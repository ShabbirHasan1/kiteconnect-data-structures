// To parse this data:
//
//   const Convert = require("./file");
//
//   const tickerFull = Convert.toTickerFull(json);
//
// These functions will throw an error if the JSON doesn't
// match the expected interface, even if the JSON is valid.

// Converts JSON strings to/from your types
// and asserts the results of JSON.parse at runtime
function toTickerFull(json) {
    return cast(JSON.parse(json), r("TickerFull"));
}

function tickerFullToJson(value) {
    return JSON.stringify(uncast(value, r("TickerFull")), null, 2);
}

function invalidValue(typ, val, key = '') {
    if (key) {
        throw Error(`Invalid value for key "${key}". Expected type ${JSON.stringify(typ)} but got ${JSON.stringify(val)}`);
    }
    throw Error(`Invalid value ${JSON.stringify(val)} for type ${JSON.stringify(typ)}`, );
}

function jsonToJSProps(typ) {
    if (typ.jsonToJS === undefined) {
        const map = {};
        typ.props.forEach((p) => map[p.json] = { key: p.js, typ: p.typ });
        typ.jsonToJS = map;
    }
    return typ.jsonToJS;
}

function jsToJSONProps(typ) {
    if (typ.jsToJSON === undefined) {
        const map = {};
        typ.props.forEach((p) => map[p.js] = { key: p.json, typ: p.typ });
        typ.jsToJSON = map;
    }
    return typ.jsToJSON;
}

function transform(val, typ, getProps, key = '') {
    function transformPrimitive(typ, val) {
        if (typeof typ === typeof val) return val;
        return invalidValue(typ, val, key);
    }

    function transformUnion(typs, val) {
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

    function transformEnum(cases, val) {
        if (cases.indexOf(val) !== -1) return val;
        return invalidValue(cases, val);
    }

    function transformArray(typ, val) {
        // val must be an array with no invalid elements
        if (!Array.isArray(val)) return invalidValue("array", val);
        return val.map(el => transform(el, typ, getProps));
    }

    function transformDate(val) {
        if (val === null) {
            return null;
        }
        const d = new Date(val);
        if (isNaN(d.valueOf())) {
            return invalidValue("Date", val);
        }
        return d;
    }

    function transformObject(props, additional, val) {
        if (val === null || typeof val !== "object" || Array.isArray(val)) {
            return invalidValue("object", val);
        }
        const result = {};
        Object.getOwnPropertyNames(props)
            .forEach(key => {
                const prop = props[key];
                const v = Object.prototype.hasOwnProperty.call(val, key) ? val[key] : undefined;
                result[prop.key] = transform(v, prop.typ, getProps, prop.key);
            });
        Object.getOwnPropertyNames(val)
            .forEach(key => {
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
        return typ.hasOwnProperty("unionMembers") ? transformUnion(typ.unionMembers, val) :
            typ.hasOwnProperty("arrayItems") ? transformArray(typ.arrayItems, val) :
            typ.hasOwnProperty("props") ? transformObject(getProps(typ), typ.additional, val) :
            invalidValue(typ, val);
    }
    // Numbers can be parsed by Date but shouldn't be.
    if (typ === Date && typeof val !== "number") return transformDate(val);
    return transformPrimitive(typ, val);
}

function cast(val, typ) {
    return transform(val, typ, jsonToJSProps);
}

function uncast(val, typ) {
    return transform(val, typ, jsToJSONProps);
}

function a(typ) {
    return { arrayItems: typ };
}

function u(...typs) {
    return { unionMembers: typs };
}

function o(props, additional) {
    return { props, additional };
}

function m(additional) {
    return { props: [], additional };
}

function r(name) {
    return { ref: name };
}

const typeMap = {
    "TickerFull": o([
        { json: "average_price", js: "average_price", typ: u(undefined, 3.14) },
        { json: "buy_quantity", js: "buy_quantity", typ: u(undefined, 0) },
        { json: "change", js: "change", typ: u(undefined, 3.14) },
        { json: "depth", js: "depth", typ: u(undefined, r("Depth")) },
        { json: "instrument_token", js: "instrument_token", typ: u(undefined, 0) },
        { json: "last_price", js: "last_price", typ: u(undefined, 3.14) },
        { json: "last_quantity", js: "last_quantity", typ: u(undefined, 0) },
        { json: "last_trade_time", js: "last_trade_time", typ: u(undefined, Date) },
        { json: "mode", js: "mode", typ: u(undefined, "") },
        { json: "ohlc", js: "ohlc", typ: u(undefined, r("Ohlc")) },
        { json: "oi", js: "oi", typ: u(undefined, 0) },
        { json: "oi_day_high", js: "oi_day_high", typ: u(undefined, 0) },
        { json: "oi_day_low", js: "oi_day_low", typ: u(undefined, 0) },
        { json: "sell_quantity", js: "sell_quantity", typ: u(undefined, 0) },
        { json: "timestamp", js: "timestamp", typ: u(undefined, Date) },
        { json: "tradable", js: "tradable", typ: u(undefined, true) },
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
        { json: "high", js: "high", typ: u(undefined, 0) },
        { json: "low", js: "low", typ: u(undefined, 3.14) },
        { json: "open", js: "open", typ: u(undefined, 3.14) },
    ], false),
};

module.exports = {
    "tickerFullToJson": tickerFullToJson,
    "toTickerFull": toTickerFull,
};