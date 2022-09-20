# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = historical_minute_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, List, Union, Any, TypeVar, Callable, Type, cast


T = TypeVar("T")


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_union(fs, x):
    for f in fs:
        try:
            return f(x)
        except:
            pass
    assert False


def from_none(x: Any) -> Any:
    assert x is None
    return x


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass(slots=True)
class Data:
    candles: Optional[List[List[Union[float, str]]]] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        candles = from_union([lambda x: from_list(lambda x: from_list(lambda x: from_union([from_float, from_str], x), x), x), from_none], obj.get("candles"))
        return Data(candles)

    def to_dict(self) -> dict:
        result: dict = {}
        result["candles"] = from_union([lambda x: from_list(lambda x: from_list(lambda x: from_union([to_float, from_str], x), x), x), from_none], self.candles)
        return result


@dataclass(slots=True)
class HistoricalMinute:
    data: Optional[Data] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'HistoricalMinute':
        assert isinstance(obj, dict)
        data = from_union([Data.from_dict, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return HistoricalMinute(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: to_class(Data, x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def historical_minute_from_dict(s: Any) -> HistoricalMinute:
    return HistoricalMinute.from_dict(s)


def historical_minute_to_dict(x: HistoricalMinute) -> Any:
    return to_class(HistoricalMinute, x)
