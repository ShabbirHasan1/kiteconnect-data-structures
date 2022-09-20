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
#     result = quote_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, Dict, TypeVar, Callable, Type, cast
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


def from_dict(f: Callable[[Any], T], x: Any) -> Dict[str, T]:
    assert isinstance(x, dict)
    return { k: f(v) for (k, v) in x.items() }


def from_str(x: Any) -> str:
    assert isinstance(x, str)
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
    high: Optional[float] = None
    low: Optional[float] = None
    open: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Ohlc':
        assert isinstance(obj, dict)
        close = from_union([from_float, from_none], obj.get("close"))
        high = from_union([from_float, from_none], obj.get("high"))
        low = from_union([from_float, from_none], obj.get("low"))
        open = from_union([from_int, from_none], obj.get("open"))
        return Ohlc(close, high, low, open)

    def to_dict(self) -> dict:
        result: dict = {}
        result["close"] = from_union([to_float, from_none], self.close)
        result["high"] = from_union([to_float, from_none], self.high)
        result["low"] = from_union([to_float, from_none], self.low)
        result["open"] = from_union([from_int, from_none], self.open)
        return result


@dataclass(slots=True)
class Datum:
    average_price: Optional[float] = None
    buy_quantity: Optional[int] = None
    depth: Optional[Depth] = None
    instrument_token: Optional[int] = None
    last_price: Optional[float] = None
    last_quantity: Optional[int] = None
    last_trade_time: Optional[datetime] = None
    lower_circuit_limit: Optional[float] = None
    net_change: Optional[int] = None
    ohlc: Optional[Ohlc] = None
    oi: Optional[int] = None
    oi_day_high: Optional[int] = None
    oi_day_low: Optional[int] = None
    sell_quantity: Optional[int] = None
    timestamp: Optional[datetime] = None
    upper_circuit_limit: Optional[float] = None
    volume: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Datum':
        assert isinstance(obj, dict)
        average_price = from_union([from_float, from_none], obj.get("average_price"))
        buy_quantity = from_union([from_int, from_none], obj.get("buy_quantity"))
        depth = from_union([Depth.from_dict, from_none], obj.get("depth"))
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        last_price = from_union([from_float, from_none], obj.get("last_price"))
        last_quantity = from_union([from_int, from_none], obj.get("last_quantity"))
        last_trade_time = from_union([from_datetime, from_none], obj.get("last_trade_time"))
        lower_circuit_limit = from_union([from_float, from_none], obj.get("lower_circuit_limit"))
        net_change = from_union([from_int, from_none], obj.get("net_change"))
        ohlc = from_union([Ohlc.from_dict, from_none], obj.get("ohlc"))
        oi = from_union([from_int, from_none], obj.get("oi"))
        oi_day_high = from_union([from_int, from_none], obj.get("oi_day_high"))
        oi_day_low = from_union([from_int, from_none], obj.get("oi_day_low"))
        sell_quantity = from_union([from_int, from_none], obj.get("sell_quantity"))
        timestamp = from_union([from_datetime, from_none], obj.get("timestamp"))
        upper_circuit_limit = from_union([from_float, from_none], obj.get("upper_circuit_limit"))
        volume = from_union([from_int, from_none], obj.get("volume"))
        return Datum(average_price, buy_quantity, depth, instrument_token, last_price, last_quantity, last_trade_time, lower_circuit_limit, net_change, ohlc, oi, oi_day_high, oi_day_low, sell_quantity, timestamp, upper_circuit_limit, volume)

    def to_dict(self) -> dict:
        result: dict = {}
        result["average_price"] = from_union([to_float, from_none], self.average_price)
        result["buy_quantity"] = from_union([from_int, from_none], self.buy_quantity)
        result["depth"] = from_union([lambda x: to_class(Depth, x), from_none], self.depth)
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["last_price"] = from_union([to_float, from_none], self.last_price)
        result["last_quantity"] = from_union([from_int, from_none], self.last_quantity)
        result["last_trade_time"] = from_union([lambda x: x.isoformat(), from_none], self.last_trade_time)
        result["lower_circuit_limit"] = from_union([to_float, from_none], self.lower_circuit_limit)
        result["net_change"] = from_union([from_int, from_none], self.net_change)
        result["ohlc"] = from_union([lambda x: to_class(Ohlc, x), from_none], self.ohlc)
        result["oi"] = from_union([from_int, from_none], self.oi)
        result["oi_day_high"] = from_union([from_int, from_none], self.oi_day_high)
        result["oi_day_low"] = from_union([from_int, from_none], self.oi_day_low)
        result["sell_quantity"] = from_union([from_int, from_none], self.sell_quantity)
        result["timestamp"] = from_union([lambda x: x.isoformat(), from_none], self.timestamp)
        result["upper_circuit_limit"] = from_union([to_float, from_none], self.upper_circuit_limit)
        result["volume"] = from_union([from_int, from_none], self.volume)
        return result


@dataclass(slots=True)
class Quote:
    data: Optional[Dict[str, Datum]] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Quote':
        assert isinstance(obj, dict)
        data = from_union([lambda x: from_dict(Datum.from_dict, x), from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return Quote(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: from_dict(lambda x: to_class(Datum, x), x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def quote_from_dict(s: Any) -> Quote:
    return Quote.from_dict(s)


def quote_to_dict(x: Quote) -> Any:
    return to_class(Quote, x)
