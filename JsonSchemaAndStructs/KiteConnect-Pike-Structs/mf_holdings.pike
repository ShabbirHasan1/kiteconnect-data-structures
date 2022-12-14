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

class MfHoldings {
    array(Datum)|mixed data;   // json: "data"
    mixed|string       status; // json: "status"

    string encode_json() {
        mapping(string:mixed) json = ([
            "data" : data,
            "status" : status,
        ]);

        return Standards.JSON.encode(json);
    }
}

MfHoldings MfHoldings_from_JSON(mixed json) {
    MfHoldings retval = MfHoldings();

    retval.data = json["data"];
    retval.status = json["status"];

    return retval;
}

class Datum {
    float|mixed  average_price;    // json: "average_price"
    mixed|string folio;            // json: "folio"
    mixed|string fund;             // json: "fund"
    float|mixed  last_price;       // json: "last_price"
    mixed|string last_price_date;  // json: "last_price_date"
    int|mixed    pledged_quantity; // json: "pledged_quantity"
    int|mixed    pnl;              // json: "pnl"
    float|mixed  quantity;         // json: "quantity"
    mixed|string tradingsymbol;    // json: "tradingsymbol"

    string encode_json() {
        mapping(string:mixed) json = ([
            "average_price" : average_price,
            "folio" : folio,
            "fund" : fund,
            "last_price" : last_price,
            "last_price_date" : last_price_date,
            "pledged_quantity" : pledged_quantity,
            "pnl" : pnl,
            "quantity" : quantity,
            "tradingsymbol" : tradingsymbol,
        ]);

        return Standards.JSON.encode(json);
    }
}

Datum Datum_from_JSON(mixed json) {
    Datum retval = Datum();

    retval.average_price = json["average_price"];
    retval.folio = json["folio"];
    retval.fund = json["fund"];
    retval.last_price = json["last_price"];
    retval.last_price_date = json["last_price_date"];
    retval.pledged_quantity = json["pledged_quantity"];
    retval.pnl = json["pnl"];
    retval.quantity = json["quantity"];
    retval.tradingsymbol = json["tradingsymbol"];

    return retval;
}
