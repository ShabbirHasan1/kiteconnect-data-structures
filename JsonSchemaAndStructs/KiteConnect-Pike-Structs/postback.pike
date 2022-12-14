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

class Postback {
    int|mixed    app_id;                    // json: "app_id"
    int|mixed    average_price;             // json: "average_price"
    int|mixed    cancelled_quantity;        // json: "cancelled_quantity"
    mixed|string checksum;                  // json: "checksum"
    int|mixed    disclosed_quantity;        // json: "disclosed_quantity"
    mixed|string exchange;                  // json: "exchange"
    mixed|string exchange_order_id;         // json: "exchange_order_id"
    mixed|string exchange_timestamp;        // json: "exchange_timestamp"
    mixed|string exchange_update_timestamp; // json: "exchange_update_timestamp"
    int|mixed    filled_quantity;           // json: "filled_quantity"
    mixed|string guid;                      // json: "guid"
    int|mixed    instrument_token;          // json: "instrument_token"
    int|mixed    market_protection;         // json: "market_protection"
    Meta|mixed   meta;                      // json: "meta"
    mixed|string order_id;                  // json: "order_id"
    mixed|string order_timestamp;           // json: "order_timestamp"
    mixed|string order_type;                // json: "order_type"
    mixed        parent_order_id;           // json: "parent_order_id"
    int|mixed    pending_quantity;          // json: "pending_quantity"
    mixed|string placed_by;                 // json: "placed_by"
    int|mixed    price;                     // json: "price"
    mixed|string product;                   // json: "product"
    int|mixed    quantity;                  // json: "quantity"
    mixed|string status;                    // json: "status"
    mixed        status_message;            // json: "status_message"
    mixed        status_message_raw;        // json: "status_message_raw"
    mixed        tag;                       // json: "tag"
    mixed|string tradingsymbol;             // json: "tradingsymbol"
    mixed|string transaction_type;          // json: "transaction_type"
    int|mixed    trigger_price;             // json: "trigger_price"
    int|mixed    unfilled_quantity;         // json: "unfilled_quantity"
    mixed|string user_id;                   // json: "user_id"
    mixed|string validity;                  // json: "validity"
    mixed|string variety;                   // json: "variety"

    string encode_json() {
        mapping(string:mixed) json = ([
            "app_id" : app_id,
            "average_price" : average_price,
            "cancelled_quantity" : cancelled_quantity,
            "checksum" : checksum,
            "disclosed_quantity" : disclosed_quantity,
            "exchange" : exchange,
            "exchange_order_id" : exchange_order_id,
            "exchange_timestamp" : exchange_timestamp,
            "exchange_update_timestamp" : exchange_update_timestamp,
            "filled_quantity" : filled_quantity,
            "guid" : guid,
            "instrument_token" : instrument_token,
            "market_protection" : market_protection,
            "meta" : meta,
            "order_id" : order_id,
            "order_timestamp" : order_timestamp,
            "order_type" : order_type,
            "parent_order_id" : parent_order_id,
            "pending_quantity" : pending_quantity,
            "placed_by" : placed_by,
            "price" : price,
            "product" : product,
            "quantity" : quantity,
            "status" : status,
            "status_message" : status_message,
            "status_message_raw" : status_message_raw,
            "tag" : tag,
            "tradingsymbol" : tradingsymbol,
            "transaction_type" : transaction_type,
            "trigger_price" : trigger_price,
            "unfilled_quantity" : unfilled_quantity,
            "user_id" : user_id,
            "validity" : validity,
            "variety" : variety,
        ]);

        return Standards.JSON.encode(json);
    }
}

Postback Postback_from_JSON(mixed json) {
    Postback retval = Postback();

    retval.app_id = json["app_id"];
    retval.average_price = json["average_price"];
    retval.cancelled_quantity = json["cancelled_quantity"];
    retval.checksum = json["checksum"];
    retval.disclosed_quantity = json["disclosed_quantity"];
    retval.exchange = json["exchange"];
    retval.exchange_order_id = json["exchange_order_id"];
    retval.exchange_timestamp = json["exchange_timestamp"];
    retval.exchange_update_timestamp = json["exchange_update_timestamp"];
    retval.filled_quantity = json["filled_quantity"];
    retval.guid = json["guid"];
    retval.instrument_token = json["instrument_token"];
    retval.market_protection = json["market_protection"];
    retval.meta = json["meta"];
    retval.order_id = json["order_id"];
    retval.order_timestamp = json["order_timestamp"];
    retval.order_type = json["order_type"];
    retval.parent_order_id = json["parent_order_id"];
    retval.pending_quantity = json["pending_quantity"];
    retval.placed_by = json["placed_by"];
    retval.price = json["price"];
    retval.product = json["product"];
    retval.quantity = json["quantity"];
    retval.status = json["status"];
    retval.status_message = json["status_message"];
    retval.status_message_raw = json["status_message_raw"];
    retval.tag = json["tag"];
    retval.tradingsymbol = json["tradingsymbol"];
    retval.transaction_type = json["transaction_type"];
    retval.trigger_price = json["trigger_price"];
    retval.unfilled_quantity = json["unfilled_quantity"];
    retval.user_id = json["user_id"];
    retval.validity = json["validity"];
    retval.variety = json["variety"];

    return retval;
}

class Meta {

    string encode_json() {
        mapping(string:mixed) json = ([
        ]);

        return Standards.JSON.encode(json);
    }
}

Meta Meta_from_JSON(mixed json) {
    Meta retval = Meta();

    return retval;
}
