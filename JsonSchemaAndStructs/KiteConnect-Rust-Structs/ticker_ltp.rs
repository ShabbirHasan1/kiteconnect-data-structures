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

pub type TickerLtp = Vec<TriggerRangeElement>;

#[derive(Debug, Serialize, Deserialize)]
pub struct TriggerRangeElement {
    pub instrument_token: Option<i64>,
    pub last_price: Option<i64>,
    pub mode: Option<String>,
    pub tradable: Option<bool>,
}
