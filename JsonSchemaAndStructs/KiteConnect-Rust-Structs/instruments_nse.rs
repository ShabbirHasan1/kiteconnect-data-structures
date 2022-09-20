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

pub type InstrumentsNse = Vec<InstrumentsNseElement>;

#[derive(Debug, Serialize, Deserialize)]
pub struct InstrumentsNseElement {
    pub exchange: Option<Exchange>,
    pub exchange_token: Option<i64>,
    pub expiry: Option<String>,
    pub instrument_token: Option<i64>,
    pub instrument_type: Option<InstrumentType>,
    pub last_price: Option<i64>,
    pub lot_size: Option<i64>,
    pub name: Option<String>,
    pub segment: Option<Exchange>,
    pub strike: Option<i64>,
    pub tick_size: Option<f64>,
    pub tradingsymbol: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum Exchange {
    #[serde(rename = "NSE")]
    Nse,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum InstrumentType {
    #[serde(rename = "EQ")]
    Eq,
}
