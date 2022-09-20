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
pub struct Holdings {
    pub data: Option<Vec<Datum>>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Datum {
    pub authorised_date: Option<String>,
    pub authorised_quantity: Option<i64>,
    pub average_price: Option<f64>,
    pub close_price: Option<f64>,
    pub collateral_quantity: Option<i64>,
    pub collateral_type: Option<String>,
    pub day_change: Option<f64>,
    pub day_change_percentage: Option<f64>,
    pub discrepancy: Option<bool>,
    pub exchange: Option<String>,
    pub instrument_token: Option<i64>,
    pub isin: Option<String>,
    pub last_price: Option<f64>,
    pub opening_quantity: Option<i64>,
    pub pnl: Option<f64>,
    pub price: Option<i64>,
    pub product: Option<String>,
    pub quantity: Option<i64>,
    pub realised_quantity: Option<i64>,
    pub t1_quantity: Option<i64>,
    pub tradingsymbol: Option<String>,
    pub used_quantity: Option<i64>,
}
