# This code parses date/times, so please
#
#     pip install python-dateutil
#
# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = ticker_full_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Callable, Type, cast
from datetime import datetime
import dateutil.parser


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


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


def from_datetime(x: Any) -> datetime:
    return dateutil.parser.parse(x)


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_bool(x: Any) -> bool:
    assert isinstance(x, bool)
    return x


@dataclass(slots=True)
class Buy:
    orders: Optional[int] = None
    price: Optional[float] = None
    quantity: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Buy':
        assert isinstance(obj, dict)
        orders = from_union([from_int, from_none], obj.get("orders"))
        price = from_union([from_float, from_none], obj.get("price"))
        quantity = from_union([from_int, from_none], obj.get("quantity"))
        return Buy(orders, price, quantity)

    def to_dict(self) -> dict:
        result: dict = {}
        result["orders"] = from_union([from_int, from_none], self.orders)
        result["price"] = from_union([to_float, from_none], self.price)
        result["quantity"] = from_union([from_int, from_none], self.quantity)
        return result


@dataclass(slots=True)
class Depth:
    buy: Optional[List[Buy]] = None
    sell: Optional[List[Buy]] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Depth':
        assert isinstance(obj, dict)
        buy = from_union([lambda x: from_list(Buy.from_dict, x), from_none], obj.get("buy"))
        sell = from_union([lambda x: from_list(Buy.from_dict, x), from_none], obj.get("sell"))
        return Depth(buy, sell)

    def to_dict(self) -> dict:
        result: dict = {}
        result["buy"] = from_union([lambda x: from_list(lambda x: to_class(Buy, x), x), from_none], self.buy)
        result["sell"] = from_union([lambda x: from_list(lambda x: to_class(Buy, x), x), from_none], self.sell)
        return result


@dataclass(slots=True)
class Ohlc:
    close: Optional[float] = None
    high: Optional[int] = None
    low: Optional[float] = None
    open: Optional[float] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Ohlc':
        assert isinstance(obj, dict)
        close = from_union([from_float, from_none], obj.get("close"))
        high = from_union([from_int, from_none], obj.get("high"))
        low = from_union([from_float, from_none], obj.get("low"))
        open = from_union([from_float, from_none], obj.get("open"))
        return Ohlc(close, high, low, open)

    def to_dict(self) -> dict:
        result: dict = {}
        result["close"] = from_union([to_float, from_none], self.close)
        result["high"] = from_union([from_int, from_none], self.high)
        result["low"] = from_union([to_float, from_none], self.low)
        result["open"] = from_union([to_float, from_none], self.open)
        return result


@dataclass(slots=True)
class TickerFull:
    average_price: Optional[float] = None
    buy_quantity: Optional[int] = None
    change: Optional[float] = None
    depth: Optional[Depth] = None
    instrument_token: Optional[int] = None
    last_price: Optional[float] = None
    last_quantity: Optional[int] = None
    last_trade_time: Optional[datetime] = None
    mode: Optional[str] = None
    ohlc: Optional[Ohlc] = None
    oi: Optional[int] = None
    oi_day_high: Optional[int] = None
    oi_day_low: Optional[int] = None
    sell_quantity: Optional[int] = None
    timestamp: Optional[datetime] = None
    tradable: Optional[bool] = None
    volume: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'TickerFull':
        assert isinstance(obj, dict)
        average_price = from_union([from_float, from_none], obj.get("average_price"))
        buy_quantity = from_union([from_int, from_none], obj.get("buy_quantity"))
        change = from_union([from_float, from_none], obj.get("change"))
        depth = from_union([Depth.from_dict, from_none], obj.get("depth"))
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        last_price = from_union([from_float, from_none], obj.get("last_price"))
        last_quantity = from_union([from_int, from_none], obj.get("last_quantity"))
        last_trade_time = from_union([from_datetime, from_none], obj.get("last_trade_time"))
        mode = from_union([from_str, from_none], obj.get("mode"))
        ohlc = from_union([Ohlc.from_dict, from_none], obj.get("ohlc"))
        oi = from_union([from_int, from_none], obj.get("oi"))
        oi_day_high = from_union([from_int, from_none], obj.get("oi_day_high"))
        oi_day_low = from_union([from_int, from_none], obj.get("oi_day_low"))
        sell_quantity = from_union([from_int, from_none], obj.get("sell_quantity"))
        timestamp = from_union([from_datetime, from_none], obj.get("timestamp"))
        tradable = from_union([from_bool, from_none], obj.get("tradable"))
        volume = from_union([from_int, from_none], obj.get("volume"))
        return TickerFull(average_price, buy_quantity, change, depth, instrument_token, last_price, last_quantity, last_trade_time, mode, ohlc, oi, oi_day_high, oi_day_low, sell_quantity, timestamp, tradable, volume)

    def to_dict(self) -> dict:
        result: dict = {}
        result["average_price"] = from_union([to_float, from_none], self.average_price)
        result["buy_quantity"] = from_union([from_int, from_none], self.buy_quantity)
        result["change"] = from_union([to_float, from_none], self.change)
        result["depth"] = from_union([lambda x: to_class(Depth, x), from_none], self.depth)
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["last_price"] = from_union([to_float, from_none], self.last_price)
        result["last_quantity"] = from_union([from_int, from_none], self.last_quantity)
        result["last_trade_time"] = from_union([lambda x: x.isoformat(), from_none], self.last_trade_time)
        result["mode"] = from_union([from_str, from_none], self.mode)
        result["ohlc"] = from_union([lambda x: to_class(Ohlc, x), from_none], self.ohlc)
        result["oi"] = from_union([from_int, from_none], self.oi)
        result["oi_day_high"] = from_union([from_int, from_none], self.oi_day_high)
        result["oi_day_low"] = from_union([from_int, from_none], self.oi_day_low)
        result["sell_quantity"] = from_union([from_int, from_none], self.sell_quantity)
        result["timestamp"] = from_union([lambda x: x.isoformat(), from_none], self.timestamp)
        result["tradable"] = from_union([from_bool, from_none], self.tradable)
        result["volume"] = from_union([from_int, from_none], self.volume)
        return result


def ticker_full_from_dict(s: Any) -> TickerFull:
    return TickerFull.from_dict(s)


def ticker_full_to_dict(x: TickerFull) -> Any:
    return to_class(TickerFull, x)
