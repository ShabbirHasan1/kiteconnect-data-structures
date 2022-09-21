# KiteConnect Data Structures
An Unofficial Library Containing JSON Schema and Data Class / Structs / Class Object Code For Serializing And Deserializing The Kite Connect Trading Apis JSON Responses Into The Language Of User Choice.

# Why Unofficial ?
The [Pull Request](https://github.com/zerodha/kiteconnect-mocks/pull/24) wasn't merged due to [scope mismatch](https://github.com/zerodha/kiteconnect-mocks/pull/24#issuecomment-1252181846) and it was advised by `kiteconnect-mocks team` to maintain this library as a seperate repository.

# What Is The Purpose Of This Library ?
Having a JSON schema from [kiteconnect-mocks](https://github.com/zerodha/kiteconnect-mocks) sample `.json` files, is a standard way to generate Data Class / Structs / Class Object code for serializing and deserializing the kiteconnect responses `.json` into the language of user choice.

In Context of the same, have generated and added the [JSON schema](https://github.com/ShabbirHasan1/kiteconnect-data-structures/tree/main/JsonSchemaAndStructs/KiteConnect-Json-Schema) from [kiteconnect-mocks](https://github.com/zerodha/kiteconnect-mocks) sample `.json` files and subsequently from the Json Schema, generated, [Some Languages Data Class / Structs / Class Object code](https://github.com/ShabbirHasan1/kiteconnect-data-structures/tree/main/JsonSchemaAndStructs) for serializing and deserializing the kiteconnect responses `.json`.

Example for Python

```python
# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = ltp_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, Dict, TypeVar, Callable, Type, cast


T = TypeVar("T")


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_none(x: Any) -> Any:
    assert x is None
    return x


def from_union(fs, x):
    for f in fs:
        try:
            return f(x)
        except:
            pass
    assert False


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def from_dict(f: Callable[[Any], T], x: Any) -> Dict[str, T]:
    assert isinstance(x, dict)
    return { k: f(v) for (k, v) in x.items() }


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass(slots=True)
class Datum:
    instrument_token: Optional[int] = None
    last_price: Optional[float] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Datum':
        assert isinstance(obj, dict)
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        last_price = from_union([from_float, from_none], obj.get("last_price"))
        return Datum(instrument_token, last_price)

    def to_dict(self) -> dict:
        result: dict = {}
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["last_price"] = from_union([to_float, from_none], self.last_price)
        return result


@dataclass(slots=True)
class Ltp:
    data: Optional[Dict[str, Datum]] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Ltp':
        assert isinstance(obj, dict)
        data = from_union([lambda x: from_dict(Datum.from_dict, x), from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return Ltp(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: from_dict(lambda x: to_class(Datum, x), x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def ltp_from_dict(s: Any) -> Ltp:
    return Ltp.from_dict(s)


def ltp_to_dict(x: Ltp) -> Any:
    return to_class(Ltp, x)
```

Example for Rust:
```rust
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
pub struct Profile {
    pub data: Option<Data>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Data {
    pub avatar_url: Option<serde_json::Value>,
    pub broker: Option<String>,
    pub email: Option<String>,
    pub exchanges: Option<Vec<String>>,
    pub meta: Option<Meta>,
    pub order_types: Option<Vec<String>>,
    pub products: Option<Vec<String>>,
    pub user_id: Option<String>,
    pub user_name: Option<String>,
    pub user_shortname: Option<String>,
    pub user_type: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Meta {
    pub demat_consent: Option<String>,
}
```

## Visualizing Kite Connect API Responses JSON Data As [Graphs](https://github.com/ShabbirHasan1/kiteconnect-data-structures/tree/main/kiteconnect-mocks-graphs)

Graph of profile.json
![profile](https://user-images.githubusercontent.com/68828793/191450701-d49f1c7c-b39c-437c-9425-4f630550444b.png)

Grpah of generate.session.json
![generate_session](https://user-images.githubusercontent.com/68828793/191450919-a6e52210-7c37-4733-8b02-c934f87635b9.png)
