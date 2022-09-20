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
pub struct MfHoldings {
    pub data: Option<Vec<Datum>>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Datum {
    pub average_price: Option<f64>,
    pub folio: Option<String>,
    pub fund: Option<String>,
    pub last_price: Option<f64>,
    pub last_price_date: Option<String>,
    pub pledged_quantity: Option<i64>,
    pub pnl: Option<i64>,
    pub quantity: Option<f64>,
    pub tradingsymbol: Option<String>,
}
