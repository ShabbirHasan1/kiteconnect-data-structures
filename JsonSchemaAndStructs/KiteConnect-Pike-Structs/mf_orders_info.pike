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

class MfOrdersInfo {
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

MfOrdersInfo MfOrdersInfo_from_JSON(mixed json) {
    MfOrdersInfo retval = MfOrdersInfo();

    retval.data = json["data"];
    retval.status = json["status"];

    return retval;
}

class Data {
    int|mixed    amount;             // json: "amount"
    int|mixed    average_price;      // json: "average_price"
    mixed        exchange_order_id;  // json: "exchange_order_id"
    mixed        exchange_timestamp; // json: "exchange_timestamp"
    mixed        folio;              // json: "folio"
    mixed|string fund;               // json: "fund"
    float|mixed  last_price;         // json: "last_price"
    mixed|string last_price_date;    // json: "last_price_date"
    mixed|string order_id;           // json: "order_id"
    mixed|string order_timestamp;    // json: "order_timestamp"
    mixed|string placed_by;          // json: "placed_by"
    mixed|string purchase_type;      // json: "purchase_type"
    int|mixed    quantity;           // json: "quantity"
    mixed        settlement_id;      // json: "settlement_id"
    mixed|string status;             // json: "status"
    mixed|string status_message;     // json: "status_message"
    mixed        tag;                // json: "tag"
    mixed|string tradingsymbol;      // json: "tradingsymbol"
    mixed|string transaction_type;   // json: "transaction_type"
    mixed|string variety;            // json: "variety"

    string encode_json() {
        mapping(string:mixed) json = ([
            "amount" : amount,
            "average_price" : average_price,
            "exchange_order_id" : exchange_order_id,
            "exchange_timestamp" : exchange_timestamp,
            "folio" : folio,
            "fund" : fund,
            "last_price" : last_price,
            "last_price_date" : last_price_date,
            "order_id" : order_id,
            "order_timestamp" : order_timestamp,
            "placed_by" : placed_by,
            "purchase_type" : purchase_type,
            "quantity" : quantity,
            "settlement_id" : settlement_id,
            "status" : status,
            "status_message" : status_message,
            "tag" : tag,
            "tradingsymbol" : tradingsymbol,
            "transaction_type" : transaction_type,
            "variety" : variety,
        ]);

        return Standards.JSON.encode(json);
    }
}

Data Data_from_JSON(mixed json) {
    Data retval = Data();

    retval.amount = json["amount"];
    retval.average_price = json["average_price"];
    retval.exchange_order_id = json["exchange_order_id"];
    retval.exchange_timestamp = json["exchange_timestamp"];
    retval.folio = json["folio"];
    retval.fund = json["fund"];
    retval.last_price = json["last_price"];
    retval.last_price_date = json["last_price_date"];
    retval.order_id = json["order_id"];
    retval.order_timestamp = json["order_timestamp"];
    retval.placed_by = json["placed_by"];
    retval.purchase_type = json["purchase_type"];
    retval.quantity = json["quantity"];
    retval.settlement_id = json["settlement_id"];
    retval.status = json["status"];
    retval.status_message = json["status_message"];
    retval.tag = json["tag"];
    retval.tradingsymbol = json["tradingsymbol"];
    retval.transaction_type = json["transaction_type"];
    retval.variety = json["variety"];

    return retval;
}