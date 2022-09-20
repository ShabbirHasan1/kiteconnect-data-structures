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

pub type TickerFull = Vec<TriggerRangeElement>;

#[derive(Debug, Serialize, Deserialize)]
pub struct TriggerRangeElement {
    pub average_traded_price: Option<f64>,
    pub change: Option<f64>,
    pub depth: Option<Depth>,
    pub exchange_timestamp: Option<String>,
    pub instrument_token: Option<i64>,
    pub last_price: Option<i64>,
    pub last_trade_time: Option<String>,
    pub last_traded_quantity: Option<i64>,
    pub mode: Option<String>,
    pub ohlc: Option<Ohlc>,
    pub oi: Option<i64>,
    pub oi_day_high: Option<i64>,
    pub oi_day_low: Option<i64>,
    pub total_buy_quantity: Option<i64>,
    pub total_sell_quantity: Option<i64>,
    pub tradable: Option<bool>,
    pub volume_traded: Option<i64>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Depth {
    pub buy: Option<Vec<Buy>>,
    pub sell: Option<Vec<Buy>>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Buy {
    pub orders: Option<i64>,
    pub price: Option<i64>,
    pub quantity: Option<i64>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Ohlc {
    pub close: Option<i64>,
    pub high: Option<i64>,
    pub low: Option<i64>,
    pub open: Option<i64>,
}
