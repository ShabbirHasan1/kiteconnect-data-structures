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
pub struct MfSips {
    pub data: Option<Vec<Datum>>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Datum {
    pub completed_instalments: Option<i64>,
    pub created: Option<String>,
    pub dividend_type: Option<String>,
    pub frequency: Option<String>,
    pub fund: Option<String>,
    pub instalment_amount: Option<i64>,
    pub instalment_day: Option<i64>,
    pub instalments: Option<i64>,
    pub last_instalment: Option<String>,
    pub next_instalment: Option<String>,
    pub pending_instalments: Option<i64>,
    pub sip_id: Option<String>,
    pub sip_reg_num: Option<String>,
    pub sip_type: Option<String>,
    pub status: Option<String>,
    pub step_up: Option<HashMap<String, i64>>,
    pub tag: Option<String>,
    pub tradingsymbol: Option<String>,
    pub transaction_type: Option<String>,
    pub trigger_price: Option<i64>,
}
