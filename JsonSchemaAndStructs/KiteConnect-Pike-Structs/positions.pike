// This source has been automatically generated by quicktype.
// ( https://github.com/quicktype/quicktype )
//
// To use this code, simply import it into your project as a Pike module.
// To JSON-encode your object, you can pass it to `Standards.JSON.encode`
// or call `encode_json` on it.
//
// To decode a JSON string, first pass it to `Standards.JSON.decode`,
// and then pass the result to `<YourClass>_from_JSON`.
// It will return an instance of <YourClass>.
// Bear in mind that these functions have unexpected behavior,
// and will likely throw an error, if the JSON string does not
// match the expected interface, even if the JSON itself is valid.

class Positions {
    Data|mixed   data;   // json: "data"
    mixed|string status; // json: "status"

    string encode_json() {
        mapping(string:mixed) json = ([
            "data" : data,
            "status" : status,
        ]);

        return Standards.JSON.encode(json);
    }
}

Positions Positions_from_JSON(mixed json) {
    Positions retval = Positions();

    retval.data = json["data"];
    retval.status = json["status"];

    return retval;
}

class Data {
    array(Day)|mixed day; // json: "day"
    array(Day)|mixed net; // json: "net"

    string encode_json() {
        mapping(string:mixed) json = ([
            "day" : day,
            "net" : net,
        ]);

        return Standards.JSON.encode(json);
    }
}

Data Data_from_JSON(mixed json) {
    Data retval = Data();

    retval.day = json["day"];
    retval.net = json["net"];

    return retval;
}

class Day {
    float|mixed  average_price;      // json: "average_price"
    int|mixed    buy_m2_m;           // json: "buy_m2m"
    float|mixed  buy_price;          // json: "buy_price"
    int|mixed    buy_quantity;       // json: "buy_quantity"
    int|mixed    buy_value;          // json: "buy_value"
    int|mixed    close_price;        // json: "close_price"
    float|mixed  day_buy_price;      // json: "day_buy_price"
    int|mixed    day_buy_quantity;   // json: "day_buy_quantity"
    int|mixed    day_buy_value;      // json: "day_buy_value"
    int|mixed    day_sell_price;     // json: "day_sell_price"
    int|mixed    day_sell_quantity;  // json: "day_sell_quantity"
    int|mixed    day_sell_value;     // json: "day_sell_value"
    mixed|string exchange;           // json: "exchange"
    int|mixed    instrument_token;   // json: "instrument_token"
    float|mixed  last_price;         // json: "last_price"
    int|mixed    m2_m;               // json: "m2m"
    int|mixed    multiplier;         // json: "multiplier"
    int|mixed    overnight_quantity; // json: "overnight_quantity"
    int|mixed    pnl;                // json: "pnl"
    mixed|string product;            // json: "product"
    int|mixed    quantity;           // json: "quantity"
    int|mixed    realised;           // json: "realised"
    int|mixed    sell_m2_m;          // json: "sell_m2m"
    int|mixed    sell_price;         // json: "sell_price"
    int|mixed    sell_quantity;      // json: "sell_quantity"
    int|mixed    sell_value;         // json: "sell_value"
    mixed|string tradingsymbol;      // json: "tradingsymbol"
    int|mixed    unrealised;         // json: "unrealised"
    int|mixed    value;              // json: "value"

    string encode_json() {
        mapping(string:mixed) json = ([
            "average_price" : average_price,
            "buy_m2m" : buy_m2_m,
            "buy_price" : buy_price,
            "buy_quantity" : buy_quantity,
            "buy_value" : buy_value,
            "close_price" : close_price,
            "day_buy_price" : day_buy_price,
            "day_buy_quantity" : day_buy_quantity,
            "day_buy_value" : day_buy_value,
            "day_sell_price" : day_sell_price,
            "day_sell_quantity" : day_sell_quantity,
            "day_sell_value" : day_sell_value,
            "exchange" : exchange,
            "instrument_token" : instrument_token,
            "last_price" : last_price,
            "m2m" : m2_m,
            "multiplier" : multiplier,
            "overnight_quantity" : overnight_quantity,
            "pnl" : pnl,
            "product" : product,
            "quantity" : quantity,
            "realised" : realised,
            "sell_m2m" : sell_m2_m,
            "sell_price" : sell_price,
            "sell_quantity" : sell_quantity,
            "sell_value" : sell_value,
            "tradingsymbol" : tradingsymbol,
            "unrealised" : unrealised,
            "value" : value,
        ]);

        return Standards.JSON.encode(json);
    }
}

Day Day_from_JSON(mixed json) {
    Day retval = Day();

    retval.average_price = json["average_price"];
    retval.buy_m2_m = json["buy_m2m"];
    retval.buy_price = json["buy_price"];
    retval.buy_quantity = json["buy_quantity"];
    retval.buy_value = json["buy_value"];
    retval.close_price = json["close_price"];
    retval.day_buy_price = json["day_buy_price"];
    retval.day_buy_quantity = json["day_buy_quantity"];
    retval.day_buy_value = json["day_buy_value"];
    retval.day_sell_price = json["day_sell_price"];
    retval.day_sell_quantity = json["day_sell_quantity"];
    retval.day_sell_value = json["day_sell_value"];
    retval.exchange = json["exchange"];
    retval.instrument_token = json["instrument_token"];
    retval.last_price = json["last_price"];
    retval.m2_m = json["m2m"];
    retval.multiplier = json["multiplier"];
    retval.overnight_quantity = json["overnight_quantity"];
    retval.pnl = json["pnl"];
    retval.product = json["product"];
    retval.quantity = json["quantity"];
    retval.realised = json["realised"];
    retval.sell_m2_m = json["sell_m2m"];
    retval.sell_price = json["sell_price"];
    retval.sell_quantity = json["sell_quantity"];
    retval.sell_value = json["sell_value"];
    retval.tradingsymbol = json["tradingsymbol"];
    retval.unrealised = json["unrealised"];
    retval.value = json["value"];

    return retval;
}