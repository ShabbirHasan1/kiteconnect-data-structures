# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = ohlc_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, Dict, TypeVar, Type, cast, Callable


T = TypeVar("T")


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


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


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


def from_dict(f: Callable[[Any], T], x: Any) -> Dict[str, T]:
    assert isinstance(x, dict)
    return { k: f(v) for (k, v) in x.items() }


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


@dataclass(slots=True)
class OhlcClass:
    close: Optional[float] = None
    high: Optional[float] = None
    low: Optional[float] = None
    open: Optional[float] = None

    @staticmethod
    def from_dict(obj: Any) -> 'OhlcClass':
        assert isinstance(obj, dict)
        close = from_union([from_float, from_none], obj.get("close"))
        high = from_union([from_float, from_none], obj.get("high"))
        low = from_union([from_float, from_none], obj.get("low"))
        open = from_union([from_float, from_none], obj.get("open"))
        return OhlcClass(close, high, low, open)

    def to_dict(self) -> dict:
        result: dict = {}
        result["close"] = from_union([to_float, from_none], self.close)
        result["high"] = from_union([to_float, from_none], self.high)
        result["low"] = from_union([to_float, from_none], self.low)
        result["open"] = from_union([to_float, from_none], self.open)
        return result


@dataclass(slots=True)
class Datum:
    instrument_token: Optional[int] = None
    last_price: Optional[int] = None
    ohlc: Optional[OhlcClass] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Datum':
        assert isinstance(obj, dict)
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        last_price = from_union([from_int, from_none], obj.get("last_price"))
        ohlc = from_union([OhlcClass.from_dict, from_none], obj.get("ohlc"))
        return Datum(instrument_token, last_price, ohlc)

    def to_dict(self) -> dict:
        result: dict = {}
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["last_price"] = from_union([from_int, from_none], self.last_price)
        result["ohlc"] = from_union([lambda x: to_class(OhlcClass, x), from_none], self.ohlc)
        return result


@dataclass(slots=True)
class Ohlc:
    data: Optional[Dict[str, Datum]] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Ohlc':
        assert isinstance(obj, dict)
        data = from_union([lambda x: from_dict(Datum.from_dict, x), from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return Ohlc(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: from_dict(lambda x: to_class(Datum, x), x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def ohlc_from_dict(s: Any) -> Ohlc:
    return Ohlc.from_dict(s)


def ohlc_to_dict(x: Ohlc) -> Any:
    return to_class(Ohlc, x)
