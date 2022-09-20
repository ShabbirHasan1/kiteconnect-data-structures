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
#     result = gtt_get_order_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, List, Any, TypeVar, Callable, Type, cast
from datetime import datetime
import dateutil.parser


T = TypeVar("T")


def from_str(x: Any) -> str:
    assert isinstance(x, str)
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


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def from_datetime(x: Any) -> datetime:
    return dateutil.parser.parse(x)


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass(slots=True)
class Condition:
    exchange: Optional[str] = None
    instrument_token: Optional[int] = None
    last_price: Optional[float] = None
    tradingsymbol: Optional[str] = None
    trigger_values: Optional[List[float]] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Condition':
        assert isinstance(obj, dict)
        exchange = from_union([from_str, from_none], obj.get("exchange"))
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        last_price = from_union([from_float, from_none], obj.get("last_price"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        trigger_values = from_union([lambda x: from_list(from_float, x), from_none], obj.get("trigger_values"))
        return Condition(exchange, instrument_token, last_price, tradingsymbol, trigger_values)

    def to_dict(self) -> dict:
        result: dict = {}
        result["exchange"] = from_union([from_str, from_none], self.exchange)
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["last_price"] = from_union([to_float, from_none], self.last_price)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["trigger_values"] = from_union([lambda x: from_list(to_float, x), from_none], self.trigger_values)
        return result


@dataclass(slots=True)
class OrderResult:
    order_id: Optional[str] = None
    rejection_reason: Optional[str] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'OrderResult':
        assert isinstance(obj, dict)
        order_id = from_union([from_str, from_none], obj.get("order_id"))
        rejection_reason = from_union([from_str, from_none], obj.get("rejection_reason"))
        status = from_union([from_str, from_none], obj.get("status"))
        return OrderResult(order_id, rejection_reason, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["order_id"] = from_union([from_str, from_none], self.order_id)
        result["rejection_reason"] = from_union([from_str, from_none], self.rejection_reason)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


@dataclass(slots=True)
class Result:
    account_id: Optional[str] = None
    exchange: Optional[str] = None
    meta: Optional[str] = None
    order_result: Optional[OrderResult] = None
    order_type: Optional[str] = None
    price: Optional[int] = None
    product: Optional[str] = None
    quantity: Optional[int] = None
    timestamp: Optional[datetime] = None
    tradingsymbol: Optional[str] = None
    transaction_type: Optional[str] = None
    triggered_at: Optional[float] = None
    validity: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Result':
        assert isinstance(obj, dict)
        account_id = from_union([from_str, from_none], obj.get("account_id"))
        exchange = from_union([from_str, from_none], obj.get("exchange"))
        meta = from_union([from_str, from_none], obj.get("meta"))
        order_result = from_union([OrderResult.from_dict, from_none], obj.get("order_result"))
        order_type = from_union([from_str, from_none], obj.get("order_type"))
        price = from_union([from_int, from_none], obj.get("price"))
        product = from_union([from_str, from_none], obj.get("product"))
        quantity = from_union([from_int, from_none], obj.get("quantity"))
        timestamp = from_union([from_datetime, from_none], obj.get("timestamp"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        transaction_type = from_union([from_str, from_none], obj.get("transaction_type"))
        triggered_at = from_union([from_float, from_none], obj.get("triggered_at"))
        validity = from_union([from_str, from_none], obj.get("validity"))
        return Result(account_id, exchange, meta, order_result, order_type, price, product, quantity, timestamp, tradingsymbol, transaction_type, triggered_at, validity)

    def to_dict(self) -> dict:
        result: dict = {}
        result["account_id"] = from_union([from_str, from_none], self.account_id)
        result["exchange"] = from_union([from_str, from_none], self.exchange)
        result["meta"] = from_union([from_str, from_none], self.meta)
        result["order_result"] = from_union([lambda x: to_class(OrderResult, x), from_none], self.order_result)
        result["order_type"] = from_union([from_str, from_none], self.order_type)
        result["price"] = from_union([from_int, from_none], self.price)
        result["product"] = from_union([from_str, from_none], self.product)
        result["quantity"] = from_union([from_int, from_none], self.quantity)
        result["timestamp"] = from_union([lambda x: x.isoformat(), from_none], self.timestamp)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["transaction_type"] = from_union([from_str, from_none], self.transaction_type)
        result["triggered_at"] = from_union([to_float, from_none], self.triggered_at)
        result["validity"] = from_union([from_str, from_none], self.validity)
        return result


@dataclass(slots=True)
class Order:
    exchange: Optional[str] = None
    order_type: Optional[str] = None
    price: Optional[int] = None
    product: Optional[str] = None
    quantity: Optional[int] = None
    result: Optional[Result] = None
    tradingsymbol: Optional[str] = None
    transaction_type: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Order':
        assert isinstance(obj, dict)
        exchange = from_union([from_str, from_none], obj.get("exchange"))
        order_type = from_union([from_str, from_none], obj.get("order_type"))
        price = from_union([from_int, from_none], obj.get("price"))
        product = from_union([from_str, from_none], obj.get("product"))
        quantity = from_union([from_int, from_none], obj.get("quantity"))
        result = from_union([Result.from_dict, from_none], obj.get("result"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        transaction_type = from_union([from_str, from_none], obj.get("transaction_type"))
        return Order(exchange, order_type, price, product, quantity, result, tradingsymbol, transaction_type)

    def to_dict(self) -> dict:
        result: dict = {}
        result["exchange"] = from_union([from_str, from_none], self.exchange)
        result["order_type"] = from_union([from_str, from_none], self.order_type)
        result["price"] = from_union([from_int, from_none], self.price)
        result["product"] = from_union([from_str, from_none], self.product)
        result["quantity"] = from_union([from_int, from_none], self.quantity)
        result["result"] = from_union([lambda x: to_class(Result, x), from_none], self.result)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["transaction_type"] = from_union([from_str, from_none], self.transaction_type)
        return result


@dataclass(slots=True)
class Data:
    meta: None
    parent_trigger: None
    condition: Optional[Condition] = None
    created_at: Optional[datetime] = None
    expires_at: Optional[datetime] = None
    id: Optional[int] = None
    orders: Optional[List[Order]] = None
    status: Optional[str] = None
    type: Optional[str] = None
    updated_at: Optional[datetime] = None
    user_id: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        meta = from_none(obj.get("meta"))
        parent_trigger = from_none(obj.get("parent_trigger"))
        condition = from_union([Condition.from_dict, from_none], obj.get("condition"))
        created_at = from_union([from_datetime, from_none], obj.get("created_at"))
        expires_at = from_union([from_datetime, from_none], obj.get("expires_at"))
        id = from_union([from_int, from_none], obj.get("id"))
        orders = from_union([lambda x: from_list(Order.from_dict, x), from_none], obj.get("orders"))
        status = from_union([from_str, from_none], obj.get("status"))
        type = from_union([from_str, from_none], obj.get("type"))
        updated_at = from_union([from_datetime, from_none], obj.get("updated_at"))
        user_id = from_union([from_str, from_none], obj.get("user_id"))
        return Data(meta, parent_trigger, condition, created_at, expires_at, id, orders, status, type, updated_at, user_id)

    def to_dict(self) -> dict:
        result: dict = {}
        result["meta"] = from_none(self.meta)
        result["parent_trigger"] = from_none(self.parent_trigger)
        result["condition"] = from_union([lambda x: to_class(Condition, x), from_none], self.condition)
        result["created_at"] = from_union([lambda x: x.isoformat(), from_none], self.created_at)
        result["expires_at"] = from_union([lambda x: x.isoformat(), from_none], self.expires_at)
        result["id"] = from_union([from_int, from_none], self.id)
        result["orders"] = from_union([lambda x: from_list(lambda x: to_class(Order, x), x), from_none], self.orders)
        result["status"] = from_union([from_str, from_none], self.status)
        result["type"] = from_union([from_str, from_none], self.type)
        result["updated_at"] = from_union([lambda x: x.isoformat(), from_none], self.updated_at)
        result["user_id"] = from_union([from_str, from_none], self.user_id)
        return result


@dataclass(slots=True)
class GttGetOrder:
    data: Optional[Data] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'GttGetOrder':
        assert isinstance(obj, dict)
        data = from_union([Data.from_dict, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return GttGetOrder(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: to_class(Data, x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def gtt_get_order_from_dict(s: Any) -> GttGetOrder:
    return GttGetOrder.from_dict(s)


def gtt_get_order_to_dict(x: GttGetOrder) -> Any:
    return to_class(GttGetOrder, x)
