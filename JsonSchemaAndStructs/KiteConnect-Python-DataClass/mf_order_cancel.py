# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = mf_order_cancel_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, TypeVar, Type, cast
from uuid import UUID


T = TypeVar("T")


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
    order_id: Optional[UUID] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        order_id = from_union([lambda x: UUID(x), from_none], obj.get("order_id"))
        return Data(order_id)

    def to_dict(self) -> dict:
        result: dict = {}
        result["order_id"] = from_union([lambda x: str(x), from_none], self.order_id)
        return result


@dataclass(slots=True)
class MFOrderCancel:
    data: Optional[Data] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'MFOrderCancel':
        assert isinstance(obj, dict)
        data = from_union([Data.from_dict, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return MFOrderCancel(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: to_class(Data, x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def mf_order_cancel_from_dict(s: Any) -> MFOrderCancel:
    return MFOrderCancel.from_dict(s)


def mf_order_cancel_to_dict(x: MFOrderCancel) -> Any:
    return to_class(MFOrderCancel, x)
