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

class MfOrderResponse {
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

MfOrderResponse MfOrderResponse_from_JSON(mixed json) {
    MfOrderResponse retval = MfOrderResponse();

    retval.data = json["data"];
    retval.status = json["status"];

    return retval;
}

class Data {
    mixed|string order_id; // json: "order_id"

    string encode_json() {
        mapping(string:mixed) json = ([
            "order_id" : order_id,
        ]);

        return Standards.JSON.encode(json);
    }
}

Data Data_from_JSON(mixed json) {
    Data retval = Data();

    retval.order_id = json["order_id"];

    return retval;
}