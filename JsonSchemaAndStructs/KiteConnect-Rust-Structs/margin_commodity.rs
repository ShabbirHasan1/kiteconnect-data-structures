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
pub struct MarginCommodity {
    pub data: Option<Data>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Data {
    pub available: Option<Available>,
    pub enabled: Option<bool>,
    pub net: Option<f64>,
    pub utilised: Option<HashMap<String, f64>>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Available {
    pub adhoc_margin: Option<i64>,
    pub cash: Option<f64>,
    pub collateral: Option<i64>,
    pub intraday_payin: Option<i64>,
    pub live_balance: Option<f64>,
    pub opening_balance: Option<f64>,
}
