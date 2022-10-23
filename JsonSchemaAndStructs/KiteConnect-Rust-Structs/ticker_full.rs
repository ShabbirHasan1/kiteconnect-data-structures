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
pub struct TickerFull {
    pub average_price: Option<f64>,
    pub buy_quantity: Option<i64>,
    pub change: Option<f64>,
    pub depth: Option<Depth>,
    pub instrument_token: Option<i64>,
    pub last_price: Option<f64>,
    pub last_quantity: Option<i64>,
    pub last_trade_time: Option<String>,
    pub mode: Option<String>,
    pub ohlc: Option<Ohlc>,
    pub oi: Option<i64>,
    pub oi_day_high: Option<i64>,
    pub oi_day_low: Option<i64>,
    pub sell_quantity: Option<i64>,
    pub timestamp: Option<String>,
    pub tradable: Option<bool>,
    pub volume: Option<i64>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Depth {
    pub buy: Option<Vec<Buy>>,
    pub sell: Option<Vec<Buy>>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Buy {
    pub orders: Option<i64>,
    pub price: Option<f64>,
    pub quantity: Option<i64>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Ohlc {
    pub close: Option<f64>,
    pub high: Option<i64>,
    pub low: Option<f64>,
    pub open: Option<f64>,
}
