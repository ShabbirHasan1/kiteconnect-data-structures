// Example code that deserializes and serializes the model.
// extern crate serde;
// #[macro_use]
// extern crate serde_derive;
// extern crate serde_json;
//
// use generated_module::[object Object];
//
// fn main() {
//     let json = r#"{"answer": 42}"#;
//     let model: [object Object] = serde_json::from_str(&json).unwrap();
// }

extern crate serde_derive;

#[derive(Debug, Serialize, Deserialize)]
pub struct OrderTrades {
    pub data: Option<Vec<Datum>>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Datum {
    pub average_price: Option<i64>,
    pub exchange: Option<String>,
    pub exchange_order_id: Option<String>,
    pub exchange_timestamp: Option<String>,
    pub fill_timestamp: Option<String>,
    pub instrument_token: Option<i64>,
    pub order_id: Option<String>,
    pub order_timestamp: Option<String>,
    pub product: Option<String>,
    pub quantity: Option<i64>,
    pub trade_id: Option<String>,
    pub tradingsymbol: Option<String>,
    pub transaction_type: Option<String>,
}
