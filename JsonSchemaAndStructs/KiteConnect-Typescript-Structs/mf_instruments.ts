// To parse this data:
//
//   import { Convert } from "./file";
//
//   const mFInstruments = Convert.toMFInstruments(json);
//
// These functions will throw an error if the JSON doesn't
// match the expected interface, even if the JSON is valid.

export interface MFInstruments {
    amc?:                             Amc;
    dividendType?:                    DividendType;
    lastPrice?:                       number;
    lastPriceDate?:                   Date;
    minimumAdditionalPurchaseAmount?: number;
    minimumPurchaseAmount?:           number;
    minimumRedemptionQuantity?:       number;
    name?:                            string;
    plan?:                            Plan;
    purchaseAllowed?:                 number;
    purchaseAmountMultiplier?:        number;
    redemptionAllowed?:               number;
    redemptionQuantityMultiplier?:    number;
    schemeType?:                      SchemeType;
    settlementType?:                  SettlementType;
    tradingsymbol?:                   string;
}

export enum Amc {
    BirlaSunLifeMutualFundMF = "BirlaSunLifeMutualFund_MF",
}

export enum DividendType {
    Growth = "growth",
    Payout = "payout",
}

export enum Plan {
    Direct = "direct",
    Regular = "regular",
}

export enum SchemeType {
    Balanced = "balanced",
    Debt = "debt",
    Equity = "equity",
    Fof = "fof",
    Liquid = "liquid",
}

export enum SettlementType {
    T1 = "T1",
    T3 = "T3",
    T4 = "T4",
    T6 = "T6",
}

// Converts JSON strings to/from your types
// and asserts the results of JSON.parse at runtime
export class Convert {
    public static toMFInstruments(json: string): MFInstruments[] {
        return cast(JSON.parse(json), a(r("MFInstruments")));
    }

    public static mFInstrumentsToJson(value: MFInstruments[]): string {
        return JSON.stringify(uncast(value, a(r("MFInstruments"))), null, 2);
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
    "MFInstruments": o([
        { json: "amc", js: "amc", typ: u(undefined, r("Amc")) },
        { json: "dividend_type", js: "dividendType", typ: u(undefined, r("DividendType")) },
        { json: "last_price", js: "lastPrice", typ: u(undefined, 3.14) },
        { json: "last_price_date", js: "lastPriceDate", typ: u(undefined, Date) },
        { json: "minimum_additional_purchase_amount", js: "minimumAdditionalPurchaseAmount", typ: u(undefined, 0) },
        { json: "minimum_purchase_amount", js: "minimumPurchaseAmount", typ: u(undefined, 0) },
        { json: "minimum_redemption_quantity", js: "minimumRedemptionQuantity", typ: u(undefined, 3.14) },
        { json: "name", js: "name", typ: u(undefined, "") },
        { json: "plan", js: "plan", typ: u(undefined, r("Plan")) },
        { json: "purchase_allowed", js: "purchaseAllowed", typ: u(undefined, 0) },
        { json: "purchase_amount_multiplier", js: "purchaseAmountMultiplier", typ: u(undefined, 0) },
        { json: "redemption_allowed", js: "redemptionAllowed", typ: u(undefined, 0) },
        { json: "redemption_quantity_multiplier", js: "redemptionQuantityMultiplier", typ: u(undefined, 3.14) },
        { json: "scheme_type", js: "schemeType", typ: u(undefined, r("SchemeType")) },
        { json: "settlement_type", js: "settlementType", typ: u(undefined, r("SettlementType")) },
        { json: "tradingsymbol", js: "tradingsymbol", typ: u(undefined, "") },
    ], false),
    "Amc": [
        "BirlaSunLifeMutualFund_MF",
    ],
    "DividendType": [
        "growth",
        "payout",
    ],
    "Plan": [
        "direct",
        "regular",
    ],
    "SchemeType": [
        "balanced",
        "debt",
        "equity",
        "fof",
        "liquid",
    ],
    "SettlementType": [
        "T1",
        "T3",
        "T4",
        "T6",
    ],
};
