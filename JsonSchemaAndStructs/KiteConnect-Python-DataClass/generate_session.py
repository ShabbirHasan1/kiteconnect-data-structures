# This code parses date/times, so please
#
#     pip install python-dateutil
#
# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = generate_session_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Callable, Type, cast
from datetime import datetime
import dateutil.parser


T = TypeVar("T")


def from_str(x: Any) -> str:
    assert isinstance(x, str)
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


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def from_datetime(x: Any) -> datetime:
    return dateutil.parser.parse(x)


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass(slots=True)
class Meta:
    demat_consent: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Meta':
        assert isinstance(obj, dict)
        demat_consent = from_union([from_str, from_none], obj.get("demat_consent"))
        return Meta(demat_consent)

    def to_dict(self) -> dict:
        result: dict = {}
        result["demat_consent"] = from_union([from_str, from_none], self.demat_consent)
        return result


@dataclass(slots=True)
class Data:
    access_token: Optional[str] = None
    api_key: Optional[str] = None
    avatar_url: Optional[str] = None
    broker: Optional[str] = None
    email: Optional[str] = None
    enctoken: Optional[str] = None
    exchanges: Optional[List[str]] = None
    login_time: Optional[datetime] = None
    meta: Optional[Meta] = None
    order_types: Optional[List[str]] = None
    products: Optional[List[str]] = None
    public_token: Optional[str] = None
    refresh_token: Optional[str] = None
    silo: Optional[str] = None
    user_id: Optional[str] = None
    user_name: Optional[str] = None
    user_shortname: Optional[str] = None
    user_type: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        access_token = from_union([from_str, from_none], obj.get("access_token"))
        api_key = from_union([from_str, from_none], obj.get("api_key"))
        avatar_url = from_union([from_str, from_none], obj.get("avatar_url"))
        broker = from_union([from_str, from_none], obj.get("broker"))
        email = from_union([from_str, from_none], obj.get("email"))
        enctoken = from_union([from_str, from_none], obj.get("enctoken"))
        exchanges = from_union([lambda x: from_list(from_str, x), from_none], obj.get("exchanges"))
        login_time = from_union([from_datetime, from_none], obj.get("login_time"))
        meta = from_union([Meta.from_dict, from_none], obj.get("meta"))
        order_types = from_union([lambda x: from_list(from_str, x), from_none], obj.get("order_types"))
        products = from_union([lambda x: from_list(from_str, x), from_none], obj.get("products"))
        public_token = from_union([from_str, from_none], obj.get("public_token"))
        refresh_token = from_union([from_str, from_none], obj.get("refresh_token"))
        silo = from_union([from_str, from_none], obj.get("silo"))
        user_id = from_union([from_str, from_none], obj.get("user_id"))
        user_name = from_union([from_str, from_none], obj.get("user_name"))
        user_shortname = from_union([from_str, from_none], obj.get("user_shortname"))
        user_type = from_union([from_str, from_none], obj.get("user_type"))
        return Data(access_token, api_key, avatar_url, broker, email, enctoken, exchanges, login_time, meta, order_types, products, public_token, refresh_token, silo, user_id, user_name, user_shortname, user_type)

    def to_dict(self) -> dict:
        result: dict = {}
        result["access_token"] = from_union([from_str, from_none], self.access_token)
        result["api_key"] = from_union([from_str, from_none], self.api_key)
        result["avatar_url"] = from_union([from_str, from_none], self.avatar_url)
        result["broker"] = from_union([from_str, from_none], self.broker)
        result["email"] = from_union([from_str, from_none], self.email)
        result["enctoken"] = from_union([from_str, from_none], self.enctoken)
        result["exchanges"] = from_union([lambda x: from_list(from_str, x), from_none], self.exchanges)
        result["login_time"] = from_union([lambda x: x.isoformat(), from_none], self.login_time)
        result["meta"] = from_union([lambda x: to_class(Meta, x), from_none], self.meta)
        result["order_types"] = from_union([lambda x: from_list(from_str, x), from_none], self.order_types)
        result["products"] = from_union([lambda x: from_list(from_str, x), from_none], self.products)
        result["public_token"] = from_union([from_str, from_none], self.public_token)
        result["refresh_token"] = from_union([from_str, from_none], self.refresh_token)
        result["silo"] = from_union([from_str, from_none], self.silo)
        result["user_id"] = from_union([from_str, from_none], self.user_id)
        result["user_name"] = from_union([from_str, from_none], self.user_name)
        result["user_shortname"] = from_union([from_str, from_none], self.user_shortname)
        result["user_type"] = from_union([from_str, from_none], self.user_type)
        return result


@dataclass(slots=True)
class GenerateSession:
    data: Optional[Data] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'GenerateSession':
        assert isinstance(obj, dict)
        data = from_union([Data.from_dict, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return GenerateSession(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: to_class(Data, x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def generate_session_from_dict(s: Any) -> GenerateSession:
    return GenerateSession.from_dict(s)


def generate_session_to_dict(x: GenerateSession) -> Any:
    return to_class(GenerateSession, x)
