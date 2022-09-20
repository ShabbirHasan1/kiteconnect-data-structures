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
pub struct Positions {
    pub data: Option<Data>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Data {
    pub day: Option<Vec<Day>>,
    pub net: Option<Vec<Day>>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Day {
    pub average_price: Option<f64>,
    #[serde(rename = "buy_m2m")]
    pub buy_m2_m: Option<i64>,
    pub buy_price: Option<f64>,
    pub buy_quantity: Option<i64>,
    pub buy_value: Option<i64>,
    pub close_price: Option<i64>,
    pub day_buy_price: Option<f64>,
    pub day_buy_quantity: Option<i64>,
    pub day_buy_value: Option<i64>,
    pub day_sell_price: Option<i64>,
    pub day_sell_quantity: Option<i64>,
    pub day_sell_value: Option<i64>,
    pub exchange: Option<String>,
    pub instrument_token: Option<i64>,
    pub last_price: Option<f64>,
    #[serde(rename = "m2m")]
    pub m2_m: Option<i64>,
    pub multiplier: Option<i64>,
    pub overnight_quantity: Option<i64>,
    pub pnl: Option<i64>,
    pub product: Option<String>,
    pub quantity: Option<i64>,
    pub realised: Option<i64>,
    #[serde(rename = "sell_m2m")]
    pub sell_m2_m: Option<i64>,
    pub sell_price: Option<i64>,
    pub sell_quantity: Option<i64>,
    pub sell_value: Option<i64>,
    pub tradingsymbol: Option<String>,
    pub unrealised: Option<i64>,
    pub value: Option<i64>,
}
