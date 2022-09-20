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
pub struct BasketMargins {
    pub data: Option<Data>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Data {
    #[serde(rename = "final")]
    pub data_final: Option<Final>,
    pub initial: Option<Final>,
    pub orders: Option<Vec<Final>>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Final {
    pub additional: Option<i64>,
    pub bo: Option<i64>,
    pub cash: Option<i64>,
    pub exchange: Option<String>,
    pub exposure: Option<f64>,
    pub option_premium: Option<f64>,
    pub pnl: Option<Pnl>,
    pub span: Option<f64>,
    pub total: Option<f64>,
    pub tradingsymbol: Option<String>,
    #[serde(rename = "type")]
    pub final_type: Option<String>,
    pub var: Option<i64>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Pnl {
    pub realised: Option<i64>,
    pub unrealised: Option<i64>,
}
