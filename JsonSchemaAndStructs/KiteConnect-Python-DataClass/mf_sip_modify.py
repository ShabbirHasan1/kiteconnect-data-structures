# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = mfsip_modify_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, TypeVar, Type, cast


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


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass(slots=True)
class Data:
    sip_id: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        sip_id = from_union([from_str, from_none], obj.get("sip_id"))
        return Data(sip_id)

    def to_dict(self) -> dict:
        result: dict = {}
        result["sip_id"] = from_union([from_str, from_none], self.sip_id)
        return result


@dataclass(slots=True)
class MFSIPModify:
    data: Optional[Data] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'MFSIPModify':
        assert isinstance(obj, dict)
        data = from_union([Data.from_dict, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return MFSIPModify(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: to_class(Data, x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def mfsip_modify_from_dict(s: Any) -> MFSIPModify:
    return MFSIPModify.from_dict(s)


def mfsip_modify_to_dict(x: MFSIPModify) -> Any:
    return to_class(MFSIPModify, x)
