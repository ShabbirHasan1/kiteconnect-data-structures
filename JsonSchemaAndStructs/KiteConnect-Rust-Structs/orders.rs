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
pub struct Orders {
    pub data: Option<Vec<Datum>>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Datum {
    pub average_price: Option<i64>,
    pub cancelled_quantity: Option<i64>,
    pub disclosed_quantity: Option<i64>,
    pub exchange: Option<String>,
    pub exchange_order_id: Option<String>,
    pub exchange_timestamp: Option<String>,
    pub exchange_update_timestamp: Option<String>,
    pub filled_quantity: Option<i64>,
    pub guid: Option<String>,
    pub instrument_token: Option<i64>,
    pub market_protection: Option<i64>,
    pub meta: Option<Meta>,
    pub modified: Option<bool>,
    pub order_id: Option<String>,
    pub order_timestamp: Option<String>,
    pub order_type: Option<String>,
    pub parent_order_id: Option<serde_json::Value>,
    pub pending_quantity: Option<i64>,
    pub placed_by: Option<String>,
    pub price: Option<i64>,
    pub product: Option<String>,
    pub quantity: Option<i64>,
    pub status: Option<String>,
    pub status_message: Option<String>,
    pub status_message_raw: Option<String>,
    pub tag: Option<String>,
    pub tags: Option<Vec<String>>,
    pub tradingsymbol: Option<String>,
    pub transaction_type: Option<String>,
    pub trigger_price: Option<i64>,
    pub validity: Option<String>,
    pub validity_ttl: Option<i64>,
    pub variety: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Meta {
    pub iceberg: Option<Iceberg>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Iceberg {
    pub leg: Option<i64>,
    pub leg_quantity: Option<i64>,
    pub legs: Option<i64>,
    pub remaining_quantity: Option<i64>,
    pub total_quantity: Option<i64>,
}
