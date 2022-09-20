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
pub struct GenerateSession {
    pub data: Option<Data>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Data {
    pub access_token: Option<String>,
    pub api_key: Option<String>,
    pub avatar_url: Option<String>,
    pub broker: Option<String>,
    pub email: Option<String>,
    pub enctoken: Option<String>,
    pub exchanges: Option<Vec<String>>,
    pub login_time: Option<String>,
    pub meta: Option<Meta>,
    pub order_types: Option<Vec<String>>,
    pub products: Option<Vec<String>>,
    pub public_token: Option<String>,
    pub refresh_token: Option<String>,
    pub silo: Option<String>,
    pub user_id: Option<String>,
    pub user_name: Option<String>,
    pub user_shortname: Option<String>,
    pub user_type: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Meta {
    pub demat_consent: Option<String>,
}
