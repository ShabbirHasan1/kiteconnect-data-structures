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
use std::collections::HashMap;

#[derive(Debug, Serialize, Deserialize)]
pub struct Ltp {
    pub data: Option<HashMap<String, Datum>>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Datum {
    pub instrument_token: Option<i64>,
    pub last_price: Option<f64>,
}
