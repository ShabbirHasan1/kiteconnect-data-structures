# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = trigger_range_from_dict(json.loads(json_string))

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
    lower: Optional[float] = None
    upper: Optional[float] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Datum':
        assert isinstance(obj, dict)
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        lower = from_union([from_float, from_none], obj.get("lower"))
        upper = from_union([from_float, from_none], obj.get("upper"))
        return Datum(instrument_token, lower, upper)

    def to_dict(self) -> dict:
        result: dict = {}
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["lower"] = from_union([to_float, from_none], self.lower)
        result["upper"] = from_union([to_float, from_none], self.upper)
        return result


@dataclass(slots=True)
class TriggerRange:
    data: Optional[Dict[str, Datum]] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'TriggerRange':
        assert isinstance(obj, dict)
        data = from_union([lambda x: from_dict(Datum.from_dict, x), from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return TriggerRange(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: from_dict(lambda x: to_class(Datum, x), x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def trigger_range_from_dict(s: Any) -> TriggerRange:
    return TriggerRange.from_dict(s)


def trigger_range_to_dict(x: TriggerRange) -> Any:
    return to_class(TriggerRange, x)
