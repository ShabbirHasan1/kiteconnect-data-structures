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

pub type InstrumentsAll = Vec<InstrumentsAllElement>;

#[derive(Debug, Serialize, Deserialize)]
pub struct InstrumentsAllElement {
    pub exchange: Option<Exchange>,
    pub exchange_token: Option<i64>,
    pub expiry: Option<String>,
    pub instrument_token: Option<i64>,
    pub instrument_type: Option<InstrumentType>,
    pub last_price: Option<f64>,
    pub lot_size: Option<i64>,
    pub name: Option<String>,
    pub segment: Option<Segment>,
    pub strike: Option<i64>,
    pub tick_size: Option<f64>,
    pub tradingsymbol: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum Exchange {
    #[serde(rename = "BSE")]
    Bse,
    #[serde(rename = "NFO")]
    Nfo,
    #[serde(rename = "NSE")]
    Nse,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum InstrumentType {
    #[serde(rename = "CE")]
    Ce,
    #[serde(rename = "EQ")]
    Eq,
    #[serde(rename = "PE")]
    Pe,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum Segment {
    #[serde(rename = "BSE")]
    Bse,
    #[serde(rename = "NFO-OPT")]
    NfoOpt,
    #[serde(rename = "NSE")]
    Nse,
}
