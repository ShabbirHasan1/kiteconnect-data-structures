// To parse this data:
//
//   import { Convert, Quote } from "./file";
//
//   const quote = Convert.toQuote(json);
//
// These functions will throw an error if the JSON doesn't
// match the expected interface, even if the JSON is valid.

export interface Quote {
    data?:   { [key: string]: Datum };
    status?: string;
}

export interface Datum {
    averagePrice?:      number;
    buyQuantity?:       number;
    depth?:             Depth;
    instrumentToken?:   number;
    lastPrice?:         number;
    lastQuantity?:      number;
    lastTradeTime?:     Date;
    lowerCircuitLimit?: number;
    netChange?:         number;
    ohlc?:              Ohlc;
    oi?:                number;
    oiDayHigh?:         number;
    oiDayLow?:          number;
    sellQuantity?:      number;
    timestamp?:         Date;
    upperCircuitLimit?: number;
    volume?:            number;
}

export interface Depth {
    buy?:  Buy[];
    sell?: Buy[];
}

export interface Buy {
    orders?:   number;
    price?:    number;
    quantity?: number;
}

export interface Ohlc {
    close?: number;
    high?:  number;
    low?:   number;
    open?:  number;
}

// Converts JSON strings to/from your types
// and asserts the results of JSON.parse at runtime
export class Convert {
    public static toQuote(json: string): Quote {
        return cast(JSON.parse(json), r("Quote"));
    }

    public static quoteToJson(value: Quote): string {
        return JSON.stringify(uncast(value, r("Quote")), null, 2);
    }
}

function invalidValue(typ: any, val: any, key: any = ''): never {
    if (key) {
        throw Error(`Invalid value for key "${key}". Expected type ${JSON.stringify(typ)} but got ${JSON.stringify(val)}`);
    }
    throw Error(`Invalid value ${JSON.stringify(val)} for type ${JSON.stringify(typ)}`, );
}

function jsonToJSProps(typ: any): any {
    if (typ.jsonToJS === undefined) {
        const map: any = {};
        typ.props.forEach((p: any) => map[p.json] = { key: p.js, typ: p.typ });
        typ.jsonToJS = map;
    }
    return typ.jsonToJS;
}

function jsToJSONProps(typ: any): any {
    if (typ.jsToJSON === undefined) {
        const map: any = {};
        typ.props.forEach((p: any) => map[p.js] = { key: p.json, typ: p.typ });
        typ.jsToJSON = map;
    }
    return typ.jsToJSON;
}

function transform(val: any, typ: any, getProps: any, key: any = ''): any {
    function transformPrimitive(typ: string, val: any): any {
        if (typeof typ === typeof val) return val;
        return invalidValue(typ, val, key);
    }

    function transformUnion(typs: any[], val: any): any {
        // val must validate against one typ in typs
        const l = typs.length;
        for (let i = 0; i < l; i++) {
            const typ = typs[i];
            try {
                return transform(val, typ, getProps);
            } catch (_) {}
        }
        return invalidValue(typs, val);
    }

    function transformEnum(cases: string[], val: any): any {
        if (cases.indexOf(val) !== -1) return val;
        return invalidValue(cases, val);
    }

    function transformArray(typ: any, val: any): any {
        // val must be an array with no invalid elements
        if (!Array.isArray(val)) return invalidValue("array", val);
        return val.map(el => transform(el, typ, getProps));
    }

    function transformDate(val: any): any {
        if (val === null) {
            return null;
        }
        const d = new Date(val);
        if (isNaN(d.valueOf())) {
            return invalidValue("Date", val);
        }
        return d;
    }

    function transformObject(props: { [k: string]: any }, additional: any, val: any): any {
        if (val === null || typeof val !== "object" || Array.isArray(val)) {
            return invalidValue("object", val);
        }
        const result: any = {};
        Object.getOwnPropertyNames(props).forEach(key => {
            const prop = props[key];
            const v = Object.prototype.hasOwnProperty.call(val, key) ? val[key] : undefined;
            result[prop.key] = transform(v, prop.typ, getProps, prop.key);
        });
        Object.getOwnPropertyNames(val).forEach(key => {
            if (!Object.prototype.hasOwnProperty.call(props, key)) {
                result[key] = transform(val[key], additional, getProps, key);
            }
        });
        return result;
    }

    if (typ === "any") return val;
    if (typ === null) {
        if (val === null) return val;
        return invalidValue(typ, val);
    }
    if (typ === false) return invalidValue(typ, val);
    while (typeof typ === "object" && typ.ref !== undefined) {
        typ = typeMap[typ.ref];
    }
    if (Array.isArray(typ)) return transformEnum(typ, val);
    if (typeof typ === "object") {
        return typ.hasOwnProperty("unionMembers") ? transformUnion(typ.unionMembers, val)
            : typ.hasOwnProperty("arrayItems")    ? transformArray(typ.arrayItems, val)
            : typ.hasOwnProperty("props")         ? transformObject(getProps(typ), typ.additional, val)
            : invalidValue(typ, val);
    }
    // Numbers can be parsed by Date but shouldn't be.
    if (typ === Date && typeof val !== "number") return transformDate(val);
    return transformPrimitive(typ, val);
}

function cast<T>(val: any, typ: any): T {
    return transform(val, typ, jsonToJSProps);
}

function uncast<T>(val: T, typ: any): any {
    return transform(val, typ, jsToJSONProps);
}

function a(typ: any) {
    return { arrayItems: typ };
}

function u(...typs: any[]) {
    return { unionMembers: typs };
}

function o(props: any[], additional: any) {
    return { props, additional };
}

function m(additional: any) {
    return { props: [], additional };
}

function r(name: string) {
    return { ref: name };
}

const typeMap: any = {
    "Quote": o([
        { json: "data", js: "data", typ: u(undefined, m(r("Datum"))) },
        { json: "status", js: "status", typ: u(undefined, "") },
    ], false),
    "Datum": o([
        { json: "average_price", js: "averagePrice", typ: u(undefined, 3.14) },
        { json: "buy_quantity", js: "buyQuantity", typ: u(undefined, 0) },
        { json: "depth", js: "depth", typ: u(undefined, r("Depth")) },
        { json: "instrument_token", js: "instrumentToken", typ: u(undefined, 0) },
        { json: "last_price", js: "lastPrice", typ: u(undefined, 3.14) },
        { json: "last_quantity", js: "lastQuantity", typ: u(undefined, 0) },
        { json: "last_trade_time", js: "lastTradeTime", typ: u(undefined, Date) },
        { json: "lower_circuit_limit", js: "lowerCircuitLimit", typ: u(undefined, 3.14) },
        { json: "net_change", js: "netChange", typ: u(undefined, 0) },
        { json: "ohlc", js: "ohlc", typ: u(undefined, r("Ohlc")) },
        { json: "oi", js: "oi", typ: u(undefined, 0) },
        { json: "oi_day_high", js: "oiDayHigh", typ: u(undefined, 0) },
        { json: "oi_day_low", js: "oiDayLow", typ: u(undefined, 0) },
        { json: "sell_quantity", js: "sellQuantity", typ: u(undefined, 0) },
        { json: "timestamp", js: "timestamp", typ: u(undefined, Date) },
        { json: "upper_circuit_limit", js: "upperCircuitLimit", typ: u(undefined, 3.14) },
        { json: "volume", js: "volume", typ: u(undefined, 0) },
    ], false),
    "Depth": o([
        { json: "buy", js: "buy", typ: u(undefined, a(r("Buy"))) },
        { json: "sell", js: "sell", typ: u(undefined, a(r("Buy"))) },
    ], false),
    "Buy": o([
        { json: "orders", js: "orders", typ: u(undefined, 0) },
        { json: "price", js: "price", typ: u(undefined, 3.14) },
        { json: "quantity", js: "quantity", typ: u(undefined, 0) },
    ], false),
    "Ohlc": o([
        { json: "close", js: "close", typ: u(undefined, 3.14) },
        { json: "high", js: "high", typ: u(undefined, 3.14) },
        { json: "low", js: "low", typ: u(undefined, 3.14) },
        { json: "open", js: "open", typ: u(undefined, 0) },
    ], false),
};
