# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = ticker_ltp_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Callable, Type, cast


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


def from_bool(x: Any) -> bool:
    assert isinstance(x, bool)
    return x


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass(slots=True)
class TriggerRangeElement:
    instrument_token: Optional[int] = None
    last_price: Optional[int] = None
    mode: Optional[str] = None
    tradable: Optional[bool] = None

    @staticmethod
    def from_dict(obj: Any) -> 'TriggerRangeElement':
        assert isinstance(obj, dict)
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        last_price = from_union([from_int, from_none], obj.get("last_price"))
        mode = from_union([from_str, from_none], obj.get("mode"))
        tradable = from_union([from_bool, from_none], obj.get("tradable"))
        return TriggerRangeElement(instrument_token, last_price, mode, tradable)

    def to_dict(self) -> dict:
        result: dict = {}
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["last_price"] = from_union([from_int, from_none], self.last_price)
        result["mode"] = from_union([from_str, from_none], self.mode)
        result["tradable"] = from_union([from_bool, from_none], self.tradable)
        return result


def ticker_ltp_from_dict(s: Any) -> List[TriggerRangeElement]:
    return from_list(TriggerRangeElement.from_dict, s)


def ticker_ltp_to_dict(x: List[TriggerRangeElement]) -> Any:
    return from_list(lambda x: to_class(TriggerRangeElement, x), x)
