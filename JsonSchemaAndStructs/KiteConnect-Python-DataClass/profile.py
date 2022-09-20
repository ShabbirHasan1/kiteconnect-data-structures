# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = profile_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Callable, Type, cast


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
    avatar_url: None
    broker: Optional[str] = None
    email: Optional[str] = None
    exchanges: Optional[List[str]] = None
    meta: Optional[Meta] = None
    order_types: Optional[List[str]] = None
    products: Optional[List[str]] = None
    user_id: Optional[str] = None
    user_name: Optional[str] = None
    user_shortname: Optional[str] = None
    user_type: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        avatar_url = from_none(obj.get("avatar_url"))
        broker = from_union([from_str, from_none], obj.get("broker"))
        email = from_union([from_str, from_none], obj.get("email"))
        exchanges = from_union([lambda x: from_list(from_str, x), from_none], obj.get("exchanges"))
        meta = from_union([Meta.from_dict, from_none], obj.get("meta"))
        order_types = from_union([lambda x: from_list(from_str, x), from_none], obj.get("order_types"))
        products = from_union([lambda x: from_list(from_str, x), from_none], obj.get("products"))
        user_id = from_union([from_str, from_none], obj.get("user_id"))
        user_name = from_union([from_str, from_none], obj.get("user_name"))
        user_shortname = from_union([from_str, from_none], obj.get("user_shortname"))
        user_type = from_union([from_str, from_none], obj.get("user_type"))
        return Data(avatar_url, broker, email, exchanges, meta, order_types, products, user_id, user_name, user_shortname, user_type)

    def to_dict(self) -> dict:
        result: dict = {}
        result["avatar_url"] = from_none(self.avatar_url)
        result["broker"] = from_union([from_str, from_none], self.broker)
        result["email"] = from_union([from_str, from_none], self.email)
        result["exchanges"] = from_union([lambda x: from_list(from_str, x), from_none], self.exchanges)
        result["meta"] = from_union([lambda x: to_class(Meta, x), from_none], self.meta)
        result["order_types"] = from_union([lambda x: from_list(from_str, x), from_none], self.order_types)
        result["products"] = from_union([lambda x: from_list(from_str, x), from_none], self.products)
        result["user_id"] = from_union([from_str, from_none], self.user_id)
        result["user_name"] = from_union([from_str, from_none], self.user_name)
        result["user_shortname"] = from_union([from_str, from_none], self.user_shortname)
        result["user_type"] = from_union([from_str, from_none], self.user_type)
        return result


@dataclass(slots=True)
class Profile:
    data: Optional[Data] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Profile':
        assert isinstance(obj, dict)
        data = from_union([Data.from_dict, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return Profile(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: to_class(Data, x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def profile_from_dict(s: Any) -> Profile:
    return Profile.from_dict(s)


def profile_to_dict(x: Profile) -> Any:
    return to_class(Profile, x)
