// To parse this data:
//
//   import { Convert, GttGetOrder } from "./file";
//
//   const gttGetOrder = Convert.toGttGetOrder(json);
//
// These functions will throw an error if the JSON doesn't
// match the expected interface, even if the JSON is valid.

export interface GttGetOrder {
    data?:   Data;
    status?: string;
}

export interface Data {
    condition?:     Condition;
    createdAt?:     Date;
    expiresAt?:     Date;
    id?:            number;
    meta?:          null;
    orders?:        Order[];
    parentTrigger?: null;
    status?:        string;
    type?:          string;
    updatedAt?:     Date;
    userID?:        string;
}

export interface Condition {
    exchange?:        string;
    instrumentToken?: number;
    lastPrice?:       number;
    tradingsymbol?:   string;
    triggerValues?:   number[];
}

export interface Order {
    exchange?:        string;
    orderType?:       string;
    price?:           number;
    product?:         string;
    quantity?:        number;
    result?:          Result | null;
    tradingsymbol?:   string;
    transactionType?: string;
}

export interface Result {
    accountID?:       string;
    exchange?:        string;
    meta?:            string;
    orderResult?:     OrderResult;
    orderType?:       string;
    price?:           number;
    product?:         string;
    quantity?:        number;
    timestamp?:       Date;
    tradingsymbol?:   string;
    transactionType?: string;
    triggeredAt?:     number;
    validity?:        string;
}

export interface OrderResult {
    orderID?:         string;
    rejectionReason?: string;
    status?:          string;
}

// Converts JSON strings to/from your types
// and asserts the results of JSON.parse at runtime
export class Convert {
    public static toGttGetOrder(json: string): GttGetOrder {
        return cast(JSON.parse(json), r("GttGetOrder"));
    }

    public static gttGetOrderToJson(value: GttGetOrder): string {
        return JSON.stringify(uncast(value, r("GttGetOrder")), null, 2);
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
    "GttGetOrder": o([
        { json: "data", js: "data", typ: u(undefined, r("Data")) },
        { json: "status", js: "status", typ: u(undefined, "") },
    ], false),
    "Data": o([
        { json: "condition", js: "condition", typ: u(undefined, r("Condition")) },
        { json: "created_at", js: "createdAt", typ: u(undefined, Date) },
        { json: "expires_at", js: "expiresAt", typ: u(undefined, Date) },
        { json: "id", js: "id", typ: u(undefined, 0) },
        { json: "meta", js: "meta", typ: u(undefined, null) },
        { json: "orders", js: "orders", typ: u(undefined, a(r("Order"))) },
        { json: "parent_trigger", js: "parentTrigger", typ: u(undefined, null) },
        { json: "status", js: "status", typ: u(undefined, "") },
        { json: "type", js: "type", typ: u(undefined, "") },
        { json: "updated_at", js: "updatedAt", typ: u(undefined, Date) },
        { json: "user_id", js: "userID", typ: u(undefined, "") },
    ], false),
    "Condition": o([
        { json: "exchange", js: "exchange", typ: u(undefined, "") },
        { json: "instrument_token", js: "instrumentToken", typ: u(undefined, 0) },
        { json: "last_price", js: "lastPrice", typ: u(undefined, 3.14) },
        { json: "tradingsymbol", js: "tradingsymbol", typ: u(undefined, "") },
        { json: "trigger_values", js: "triggerValues", typ: u(undefined, a(3.14)) },
    ], false),
    "Order": o([
        { json: "exchange", js: "exchange", typ: u(undefined, "") },
        { json: "order_type", js: "orderType", typ: u(undefined, "") },
        { json: "price", js: "price", typ: u(undefined, 0) },
        { json: "product", js: "product", typ: u(undefined, "") },
        { json: "quantity", js: "quantity", typ: u(undefined, 0) },
        { json: "result", js: "result", typ: u(undefined, u(r("Result"), null)) },
        { json: "tradingsymbol", js: "tradingsymbol", typ: u(undefined, "") },
        { json: "transaction_type", js: "transactionType", typ: u(undefined, "") },
    ], false),
    "Result": o([
        { json: "account_id", js: "accountID", typ: u(undefined, "") },
        { json: "exchange", js: "exchange", typ: u(undefined, "") },
        { json: "meta", js: "meta", typ: u(undefined, "") },
        { json: "order_result", js: "orderResult", typ: u(undefined, r("OrderResult")) },
        { json: "order_type", js: "orderType", typ: u(undefined, "") },
        { json: "price", js: "price", typ: u(undefined, 0) },
        { json: "product", js: "product", typ: u(undefined, "") },
        { json: "quantity", js: "quantity", typ: u(undefined, 0) },
        { json: "timestamp", js: "timestamp", typ: u(undefined, Date) },
        { json: "tradingsymbol", js: "tradingsymbol", typ: u(undefined, "") },
        { json: "transaction_type", js: "transactionType", typ: u(undefined, "") },
        { json: "triggered_at", js: "triggeredAt", typ: u(undefined, 3.14) },
        { json: "validity", js: "validity", typ: u(undefined, "") },
    ], false),
    "OrderResult": o([
        { json: "order_id", js: "orderID", typ: u(undefined, "") },
        { json: "rejection_reason", js: "rejectionReason", typ: u(undefined, "") },
        { json: "status", js: "status", typ: u(undefined, "") },
    ], false),
};
