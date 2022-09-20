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
#     result = order_trades_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Type, Callable, cast
from datetime import datetime
import dateutil.parser


T = TypeVar("T")


def from_none(x: Any) -> Any:
    assert x is None
    return x


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


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_datetime(x: Any) -> datetime:
    return dateutil.parser.parse(x)


def is_type(t: Type[T], x: Any) -> T:
    assert isinstance(x, t)
    return x


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass(slots=True)
class Datum:
    trade_id: Optional[int] = None
    average_price: Optional[int] = None
    exchange: Optional[str] = None
    exchange_order_id: Optional[str] = None
    exchange_timestamp: Optional[datetime] = None
    fill_timestamp: Optional[datetime] = None
    instrument_token: Optional[int] = None
    order_id: Optional[str] = None
    order_timestamp: Optional[datetime] = None
    product: Optional[str] = None
    quantity: Optional[int] = None
    tradingsymbol: Optional[str] = None
    transaction_type: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Datum':
        assert isinstance(obj, dict)
        trade_id = from_union([from_none, lambda x: int(from_str(x))], obj.get("trade_id"))
        average_price = from_union([from_int, from_none], obj.get("average_price"))
        exchange = from_union([from_str, from_none], obj.get("exchange"))
        exchange_order_id = from_union([from_str, from_none], obj.get("exchange_order_id"))
        exchange_timestamp = from_union([from_datetime, from_none], obj.get("exchange_timestamp"))
        fill_timestamp = from_union([from_datetime, from_none], obj.get("fill_timestamp"))
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        order_id = from_union([from_str, from_none], obj.get("order_id"))
        order_timestamp = from_union([from_datetime, from_none], obj.get("order_timestamp"))
        product = from_union([from_str, from_none], obj.get("product"))
        quantity = from_union([from_int, from_none], obj.get("quantity"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        transaction_type = from_union([from_str, from_none], obj.get("transaction_type"))
        return Datum(trade_id, average_price, exchange, exchange_order_id, exchange_timestamp, fill_timestamp, instrument_token, order_id, order_timestamp, product, quantity, tradingsymbol, transaction_type)

    def to_dict(self) -> dict:
        result: dict = {}
        result["trade_id"] = from_union([lambda x: from_none((lambda x: is_type(type(None), x))(x)), lambda x: from_str((lambda x: str((lambda x: is_type(int, x))(x)))(x))], self.trade_id)
        result["average_price"] = from_union([from_int, from_none], self.average_price)
        result["exchange"] = from_union([from_str, from_none], self.exchange)
        result["exchange_order_id"] = from_union([from_str, from_none], self.exchange_order_id)
        result["exchange_timestamp"] = from_union([lambda x: x.isoformat(), from_none], self.exchange_timestamp)
        result["fill_timestamp"] = from_union([lambda x: x.isoformat(), from_none], self.fill_timestamp)
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["order_id"] = from_union([from_str, from_none], self.order_id)
        result["order_timestamp"] = from_union([lambda x: x.isoformat(), from_none], self.order_timestamp)
        result["product"] = from_union([from_str, from_none], self.product)
        result["quantity"] = from_union([from_int, from_none], self.quantity)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["transaction_type"] = from_union([from_str, from_none], self.transaction_type)
        return result


@dataclass(slots=True)
class OrderTrades:
    data: Optional[List[Datum]] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'OrderTrades':
        assert isinstance(obj, dict)
        data = from_union([lambda x: from_list(Datum.from_dict, x), from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return OrderTrades(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: from_list(lambda x: to_class(Datum, x), x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def order_trades_from_dict(s: Any) -> OrderTrades:
    return OrderTrades.from_dict(s)


def order_trades_to_dict(x: OrderTrades) -> Any:
    return to_class(OrderTrades, x)
