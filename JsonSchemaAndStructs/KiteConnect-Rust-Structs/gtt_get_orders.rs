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
pub struct GttGetOrders {
    pub data: Option<Vec<Datum>>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Datum {
    pub condition: Option<Condition>,
    pub created_at: Option<String>,
    pub expires_at: Option<String>,
    pub id: Option<i64>,
    pub meta: Option<Meta>,
    pub orders: Option<Vec<Order>>,
    pub parent_trigger: Option<serde_json::Value>,
    pub status: Option<String>,
    #[serde(rename = "type")]
    pub datum_type: Option<String>,
    pub updated_at: Option<String>,
    pub user_id: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Condition {
    pub exchange: Option<String>,
    pub instrument_token: Option<i64>,
    pub last_price: Option<f64>,
    pub tradingsymbol: Option<String>,
    pub trigger_values: Option<Vec<f64>>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Meta {
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Order {
    pub exchange: Option<String>,
    pub order_type: Option<String>,
    pub price: Option<f64>,
    pub product: Option<String>,
    pub quantity: Option<i64>,
    pub result: Option<Result>,
    pub tradingsymbol: Option<String>,
    pub transaction_type: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Result {
    pub account_id: Option<String>,
    pub exchange: Option<String>,
    pub meta: Option<String>,
    pub order_result: Option<OrderResult>,
    pub order_type: Option<String>,
    pub price: Option<i64>,
    pub product: Option<String>,
    pub quantity: Option<i64>,
    pub timestamp: Option<String>,
    pub tradingsymbol: Option<String>,
    pub transaction_type: Option<String>,
    pub triggered_at: Option<f64>,
    pub validity: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct OrderResult {
    pub order_id: Option<String>,
    pub rejection_reason: Option<String>,
    pub status: Option<String>,
}
