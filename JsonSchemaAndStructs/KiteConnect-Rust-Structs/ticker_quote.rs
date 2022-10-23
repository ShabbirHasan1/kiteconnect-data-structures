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
pub struct TickerQuote {
    pub average_price: Option<f64>,
    pub buy_quantity: Option<i64>,
    pub change: Option<f64>,
    pub instrument_token: Option<i64>,
    pub last_price: Option<f64>,
    pub last_quantity: Option<i64>,
    pub mode: Option<String>,
    pub ohlc: Option<Ohlc>,
    pub sell_quantity: Option<i64>,
    pub tradable: Option<bool>,
    pub volume: Option<i64>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Ohlc {
    pub close: Option<f64>,
    pub high: Option<i64>,
    pub low: Option<f64>,
    pub open: Option<f64>,
}
