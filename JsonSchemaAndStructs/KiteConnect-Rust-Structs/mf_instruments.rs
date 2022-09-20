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

pub type MfInstruments = Vec<MfInstrument>;

#[derive(Debug, Serialize, Deserialize)]
pub struct MfInstrument {
    pub amc: Option<Amc>,
    pub dividend_type: Option<DividendType>,
    pub last_price: Option<f64>,
    pub last_price_date: Option<String>,
    pub minimum_additional_purchase_amount: Option<i64>,
    pub minimum_purchase_amount: Option<i64>,
    pub minimum_redemption_quantity: Option<f64>,
    pub name: Option<String>,
    pub plan: Option<Plan>,
    pub purchase_allowed: Option<i64>,
    pub purchase_amount_multiplier: Option<i64>,
    pub redemption_allowed: Option<i64>,
    pub redemption_quantity_multiplier: Option<f64>,
    pub scheme_type: Option<SchemeType>,
    pub settlement_type: Option<SettlementType>,
    pub tradingsymbol: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum Amc {
    #[serde(rename = "BirlaSunLifeMutualFund_MF")]
    BirlaSunLifeMutualFundMf,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum DividendType {
    #[serde(rename = "growth")]
    Growth,
    #[serde(rename = "payout")]
    Payout,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum Plan {
    #[serde(rename = "direct")]
    Direct,
    #[serde(rename = "regular")]
    Regular,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum SchemeType {
    #[serde(rename = "balanced")]
    Balanced,
    #[serde(rename = "debt")]
    Debt,
    #[serde(rename = "equity")]
    Equity,
    #[serde(rename = "fof")]
    Fof,
    #[serde(rename = "liquid")]
    Liquid,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum SettlementType {
    T1,
    T3,
    T4,
    T6,
}
