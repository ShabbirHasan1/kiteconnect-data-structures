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
#     result = order_info_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Callable, Type, cast
from datetime import datetime
import dateutil.parser


T = TypeVar("T")


def from_none(x: Any) -> Any:
    assert x is None
    return x


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
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


def from_datetime(x: Any) -> datetime:
    return dateutil.parser.parse(x)


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


@dataclass(slots=True)
class Datum:
    parent_order_id: None
    status_message: None
    tag: None
    average_price: Optional[int] = None
    cancelled_quantity: Optional[int] = None
    disclosed_quantity: Optional[int] = None
    exchange: Optional[str] = None
    exchange_order_id: Optional[str] = None
    exchange_timestamp: Optional[datetime] = None
    filled_quantity: Optional[int] = None
    instrument_token: Optional[int] = None
    order_id: Optional[str] = None
    order_timestamp: Optional[datetime] = None
    order_type: Optional[str] = None
    pending_quantity: Optional[int] = None
    placed_by: Optional[str] = None
    price: Optional[float] = None
    product: Optional[str] = None
    quantity: Optional[int] = None
    status: Optional[str] = None
    tradingsymbol: Optional[str] = None
    transaction_type: Optional[str] = None
    trigger_price: Optional[int] = None
    validity: Optional[str] = None
    variety: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Datum':
        assert isinstance(obj, dict)
        parent_order_id = from_none(obj.get("parent_order_id"))
        status_message = from_none(obj.get("status_message"))
        tag = from_none(obj.get("tag"))
        average_price = from_union([from_int, from_none], obj.get("average_price"))
        cancelled_quantity = from_union([from_int, from_none], obj.get("cancelled_quantity"))
        disclosed_quantity = from_union([from_int, from_none], obj.get("disclosed_quantity"))
        exchange = from_union([from_str, from_none], obj.get("exchange"))
        exchange_order_id = from_union([from_none, from_str], obj.get("exchange_order_id"))
        exchange_timestamp = from_union([from_none, from_datetime], obj.get("exchange_timestamp"))
        filled_quantity = from_union([from_int, from_none], obj.get("filled_quantity"))
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        order_id = from_union([from_str, from_none], obj.get("order_id"))
        order_timestamp = from_union([from_none, from_datetime], obj.get("order_timestamp"))
        order_type = from_union([from_str, from_none], obj.get("order_type"))
        pending_quantity = from_union([from_int, from_none], obj.get("pending_quantity"))
        placed_by = from_union([from_str, from_none], obj.get("placed_by"))
        price = from_union([from_float, from_none], obj.get("price"))
        product = from_union([from_str, from_none], obj.get("product"))
        quantity = from_union([from_int, from_none], obj.get("quantity"))
        status = from_union([from_str, from_none], obj.get("status"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        transaction_type = from_union([from_str, from_none], obj.get("transaction_type"))
        trigger_price = from_union([from_int, from_none], obj.get("trigger_price"))
        validity = from_union([from_str, from_none], obj.get("validity"))
        variety = from_union([from_str, from_none], obj.get("variety"))
        return Datum(parent_order_id, status_message, tag, average_price, cancelled_quantity, disclosed_quantity, exchange, exchange_order_id, exchange_timestamp, filled_quantity, instrument_token, order_id, order_timestamp, order_type, pending_quantity, placed_by, price, product, quantity, status, tradingsymbol, transaction_type, trigger_price, validity, variety)

    def to_dict(self) -> dict:
        result: dict = {}
        result["parent_order_id"] = from_none(self.parent_order_id)
        result["status_message"] = from_none(self.status_message)
        result["tag"] = from_none(self.tag)
        result["average_price"] = from_union([from_int, from_none], self.average_price)
        result["cancelled_quantity"] = from_union([from_int, from_none], self.cancelled_quantity)
        result["disclosed_quantity"] = from_union([from_int, from_none], self.disclosed_quantity)
        result["exchange"] = from_union([from_str, from_none], self.exchange)
        result["exchange_order_id"] = from_union([from_none, from_str], self.exchange_order_id)
        result["exchange_timestamp"] = from_union([from_none, lambda x: x.isoformat()], self.exchange_timestamp)
        result["filled_quantity"] = from_union([from_int, from_none], self.filled_quantity)
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["order_id"] = from_union([from_str, from_none], self.order_id)
        result["order_timestamp"] = from_union([from_none, lambda x: x.isoformat()], self.order_timestamp)
        result["order_type"] = from_union([from_str, from_none], self.order_type)
        result["pending_quantity"] = from_union([from_int, from_none], self.pending_quantity)
        result["placed_by"] = from_union([from_str, from_none], self.placed_by)
        result["price"] = from_union([to_float, from_none], self.price)
        result["product"] = from_union([from_str, from_none], self.product)
        result["quantity"] = from_union([from_int, from_none], self.quantity)
        result["status"] = from_union([from_str, from_none], self.status)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["transaction_type"] = from_union([from_str, from_none], self.transaction_type)
        result["trigger_price"] = from_union([from_int, from_none], self.trigger_price)
        result["validity"] = from_union([from_str, from_none], self.validity)
        result["variety"] = from_union([from_str, from_none], self.variety)
        return result


@dataclass(slots=True)
class OrderInfo:
    data: Optional[List[Datum]] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'OrderInfo':
        assert isinstance(obj, dict)
        data = from_union([lambda x: from_list(Datum.from_dict, x), from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return OrderInfo(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: from_list(lambda x: to_class(Datum, x), x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def order_info_from_dict(s: Any) -> OrderInfo:
    return OrderInfo.from_dict(s)


def order_info_to_dict(x: OrderInfo) -> Any:
    return to_class(OrderInfo, x)
