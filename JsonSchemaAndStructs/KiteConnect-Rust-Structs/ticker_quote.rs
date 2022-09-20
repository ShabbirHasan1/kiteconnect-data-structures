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

pub type TickerQuote = Vec<TriggerRangeElement>;

#[derive(Debug, Serialize, Deserialize)]
pub struct TriggerRangeElement {
    pub average_traded_price: Option<f64>,
    pub change: Option<f64>,
    pub instrument_token: Option<i64>,
    pub last_price: Option<i64>,
    pub last_traded_quantity: Option<i64>,
    pub mode: Option<String>,
    pub ohlc: Option<Ohlc>,
    pub total_buy_quantity: Option<i64>,
    pub total_sell_quantity: Option<i64>,
    pub tradable: Option<bool>,
    pub volume_traded: Option<i64>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Ohlc {
    pub close: Option<i64>,
    pub high: Option<i64>,
    pub low: Option<i64>,
    pub open: Option<i64>,
}
