# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = gtt_place_order_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, TypeVar, Type, cast


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


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass(slots=True)
class Data:
    trigger_id: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        trigger_id = from_union([from_int, from_none], obj.get("trigger_id"))
        return Data(trigger_id)

    def to_dict(self) -> dict:
        result: dict = {}
        result["trigger_id"] = from_union([from_int, from_none], self.trigger_id)
        return result


@dataclass(slots=True)
class GttPlaceOrder:
    data: Optional[Data] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'GttPlaceOrder':
        assert isinstance(obj, dict)
        data = from_union([Data.from_dict, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return GttPlaceOrder(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: to_class(Data, x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def gtt_place_order_from_dict(s: Any) -> GttPlaceOrder:
    return GttPlaceOrder.from_dict(s)


def gtt_place_order_to_dict(x: GttPlaceOrder) -> Any:
    return to_class(GttPlaceOrder, x)
