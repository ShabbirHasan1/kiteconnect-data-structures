# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = ticker_quote_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Type, cast, Callable


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


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_bool(x: Any) -> bool:
    assert isinstance(x, bool)
    return x


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


@dataclass(slots=True)
class Ohlc:
    close: Optional[int] = None
    high: Optional[int] = None
    low: Optional[int] = None
    open: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Ohlc':
        assert isinstance(obj, dict)
        close = from_union([from_int, from_none], obj.get("close"))
        high = from_union([from_int, from_none], obj.get("high"))
        low = from_union([from_int, from_none], obj.get("low"))
        open = from_union([from_int, from_none], obj.get("open"))
        return Ohlc(close, high, low, open)

    def to_dict(self) -> dict:
        result: dict = {}
        result["close"] = from_union([from_int, from_none], self.close)
        result["high"] = from_union([from_int, from_none], self.high)
        result["low"] = from_union([from_int, from_none], self.low)
        result["open"] = from_union([from_int, from_none], self.open)
        return result


@dataclass(slots=True)
class TriggerRangeElement:
    average_traded_price: Optional[float] = None
    change: Optional[float] = None
    instrument_token: Optional[int] = None
    last_price: Optional[int] = None
    last_traded_quantity: Optional[int] = None
    mode: Optional[str] = None
    ohlc: Optional[Ohlc] = None
    total_buy_quantity: Optional[int] = None
    total_sell_quantity: Optional[int] = None
    tradable: Optional[bool] = None
    volume_traded: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'TriggerRangeElement':
        assert isinstance(obj, dict)
        average_traded_price = from_union([from_float, from_none], obj.get("average_traded_price"))
        change = from_union([from_float, from_none], obj.get("change"))
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        last_price = from_union([from_int, from_none], obj.get("last_price"))
        last_traded_quantity = from_union([from_int, from_none], obj.get("last_traded_quantity"))
        mode = from_union([from_str, from_none], obj.get("mode"))
        ohlc = from_union([Ohlc.from_dict, from_none], obj.get("ohlc"))
        total_buy_quantity = from_union([from_int, from_none], obj.get("total_buy_quantity"))
        total_sell_quantity = from_union([from_int, from_none], obj.get("total_sell_quantity"))
        tradable = from_union([from_bool, from_none], obj.get("tradable"))
        volume_traded = from_union([from_int, from_none], obj.get("volume_traded"))
        return TriggerRangeElement(average_traded_price, change, instrument_token, last_price, last_traded_quantity, mode, ohlc, total_buy_quantity, total_sell_quantity, tradable, volume_traded)

    def to_dict(self) -> dict:
        result: dict = {}
        result["average_traded_price"] = from_union([to_float, from_none], self.average_traded_price)
        result["change"] = from_union([to_float, from_none], self.change)
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["last_price"] = from_union([from_int, from_none], self.last_price)
        result["last_traded_quantity"] = from_union([from_int, from_none], self.last_traded_quantity)
        result["mode"] = from_union([from_str, from_none], self.mode)
        result["ohlc"] = from_union([lambda x: to_class(Ohlc, x), from_none], self.ohlc)
        result["total_buy_quantity"] = from_union([from_int, from_none], self.total_buy_quantity)
        result["total_sell_quantity"] = from_union([from_int, from_none], self.total_sell_quantity)
        result["tradable"] = from_union([from_bool, from_none], self.tradable)
        result["volume_traded"] = from_union([from_int, from_none], self.volume_traded)
        return result


def ticker_quote_from_dict(s: Any) -> List[TriggerRangeElement]:
    return from_list(TriggerRangeElement.from_dict, s)


def ticker_quote_to_dict(x: List[TriggerRangeElement]) -> Any:
    return from_list(lambda x: to_class(TriggerRangeElement, x), x)
