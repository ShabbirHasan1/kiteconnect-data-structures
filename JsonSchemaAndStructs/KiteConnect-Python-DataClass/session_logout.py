# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = session_logout_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, TypeVar, Type, cast


T = TypeVar("T")


def from_bool(x: Any) -> bool:
    assert isinstance(x, bool)
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
class SessionLogout:
    data: Optional[bool] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'SessionLogout':
        assert isinstance(obj, dict)
        data = from_union([from_bool, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return SessionLogout(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([from_bool, from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def session_logout_from_dict(s: Any) -> SessionLogout:
    return SessionLogout.from_dict(s)


def session_logout_to_dict(x: SessionLogout) -> Any:
    return to_class(SessionLogout, x)
