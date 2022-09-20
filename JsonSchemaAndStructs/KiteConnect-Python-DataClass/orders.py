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
#     result = orders_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Type, cast, Callable
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


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_datetime(x: Any) -> datetime:
    return dateutil.parser.parse(x)


def from_bool(x: Any) -> bool:
    assert isinstance(x, bool)
    return x


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


@dataclass(slots=True)
class Iceberg:
    leg: Optional[int] = None
    leg_quantity: Optional[int] = None
    legs: Optional[int] = None
    remaining_quantity: Optional[int] = None
    total_quantity: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Iceberg':
        assert isinstance(obj, dict)
        leg = from_union([from_int, from_none], obj.get("leg"))
        leg_quantity = from_union([from_int, from_none], obj.get("leg_quantity"))
        legs = from_union([from_int, from_none], obj.get("legs"))
        remaining_quantity = from_union([from_int, from_none], obj.get("remaining_quantity"))
        total_quantity = from_union([from_int, from_none], obj.get("total_quantity"))
        return Iceberg(leg, leg_quantity, legs, remaining_quantity, total_quantity)

    def to_dict(self) -> dict:
        result: dict = {}
        result["leg"] = from_union([from_int, from_none], self.leg)
        result["leg_quantity"] = from_union([from_int, from_none], self.leg_quantity)
        result["legs"] = from_union([from_int, from_none], self.legs)
        result["remaining_quantity"] = from_union([from_int, from_none], self.remaining_quantity)
        result["total_quantity"] = from_union([from_int, from_none], self.total_quantity)
        return result


@dataclass(slots=True)
class Meta:
    iceberg: Optional[Iceberg] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Meta':
        assert isinstance(obj, dict)
        iceberg = from_union([Iceberg.from_dict, from_none], obj.get("iceberg"))
        return Meta(iceberg)

    def to_dict(self) -> dict:
        result: dict = {}
        result["iceberg"] = from_union([lambda x: to_class(Iceberg, x), from_none], self.iceberg)
        return result


@dataclass(slots=True)
class Datum:
    parent_order_id: None
    average_price: Optional[int] = None
    cancelled_quantity: Optional[int] = None
    disclosed_quantity: Optional[int] = None
    exchange: Optional[str] = None
    exchange_order_id: Optional[str] = None
    exchange_timestamp: Optional[datetime] = None
    exchange_update_timestamp: Optional[datetime] = None
    filled_quantity: Optional[int] = None
    guid: Optional[str] = None
    instrument_token: Optional[int] = None
    market_protection: Optional[int] = None
    meta: Optional[Meta] = None
    modified: Optional[bool] = None
    order_id: Optional[str] = None
    order_timestamp: Optional[datetime] = None
    order_type: Optional[str] = None
    pending_quantity: Optional[int] = None
    placed_by: Optional[str] = None
    price: Optional[int] = None
    product: Optional[str] = None
    quantity: Optional[int] = None
    status: Optional[str] = None
    status_message: Optional[str] = None
    status_message_raw: Optional[str] = None
    tag: Optional[str] = None
    tags: Optional[List[str]] = None
    tradingsymbol: Optional[str] = None
    transaction_type: Optional[str] = None
    trigger_price: Optional[int] = None
    validity: Optional[str] = None
    validity_ttl: Optional[int] = None
    variety: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Datum':
        assert isinstance(obj, dict)
        parent_order_id = from_none(obj.get("parent_order_id"))
        average_price = from_union([from_int, from_none], obj.get("average_price"))
        cancelled_quantity = from_union([from_int, from_none], obj.get("cancelled_quantity"))
        disclosed_quantity = from_union([from_int, from_none], obj.get("disclosed_quantity"))
        exchange = from_union([from_str, from_none], obj.get("exchange"))
        exchange_order_id = from_union([from_none, from_str], obj.get("exchange_order_id"))
        exchange_timestamp = from_union([from_none, from_datetime], obj.get("exchange_timestamp"))
        exchange_update_timestamp = from_union([from_none, from_datetime], obj.get("exchange_update_timestamp"))
        filled_quantity = from_union([from_int, from_none], obj.get("filled_quantity"))
        guid = from_union([from_str, from_none], obj.get("guid"))
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        market_protection = from_union([from_int, from_none], obj.get("market_protection"))
        meta = from_union([Meta.from_dict, from_none], obj.get("meta"))
        modified = from_union([from_bool, from_none], obj.get("modified"))
        order_id = from_union([from_str, from_none], obj.get("order_id"))
        order_timestamp = from_union([from_none, from_datetime], obj.get("order_timestamp"))
        order_type = from_union([from_str, from_none], obj.get("order_type"))
        pending_quantity = from_union([from_int, from_none], obj.get("pending_quantity"))
        placed_by = from_union([from_str, from_none], obj.get("placed_by"))
        price = from_union([from_int, from_none], obj.get("price"))
        product = from_union([from_str, from_none], obj.get("product"))
        quantity = from_union([from_int, from_none], obj.get("quantity"))
        status = from_union([from_str, from_none], obj.get("status"))
        status_message = from_union([from_none, from_str], obj.get("status_message"))
        status_message_raw = from_union([from_none, from_str], obj.get("status_message_raw"))
        tag = from_union([from_none, from_str], obj.get("tag"))
        tags = from_union([lambda x: from_list(from_str, x), from_none], obj.get("tags"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        transaction_type = from_union([from_str, from_none], obj.get("transaction_type"))
        trigger_price = from_union([from_int, from_none], obj.get("trigger_price"))
        validity = from_union([from_str, from_none], obj.get("validity"))
        validity_ttl = from_union([from_int, from_none], obj.get("validity_ttl"))
        variety = from_union([from_str, from_none], obj.get("variety"))
        return Datum(parent_order_id, average_price, cancelled_quantity, disclosed_quantity, exchange, exchange_order_id, exchange_timestamp, exchange_update_timestamp, filled_quantity, guid, instrument_token, market_protection, meta, modified, order_id, order_timestamp, order_type, pending_quantity, placed_by, price, product, quantity, status, status_message, status_message_raw, tag, tags, tradingsymbol, transaction_type, trigger_price, validity, validity_ttl, variety)

    def to_dict(self) -> dict:
        result: dict = {}
        result["parent_order_id"] = from_none(self.parent_order_id)
        result["average_price"] = from_union([from_int, from_none], self.average_price)
        result["cancelled_quantity"] = from_union([from_int, from_none], self.cancelled_quantity)
        result["disclosed_quantity"] = from_union([from_int, from_none], self.disclosed_quantity)
        result["exchange"] = from_union([from_str, from_none], self.exchange)
        result["exchange_order_id"] = from_union([from_none, from_str], self.exchange_order_id)
        result["exchange_timestamp"] = from_union([from_none, lambda x: x.isoformat()], self.exchange_timestamp)
        result["exchange_update_timestamp"] = from_union([from_none, lambda x: x.isoformat()], self.exchange_update_timestamp)
        result["filled_quantity"] = from_union([from_int, from_none], self.filled_quantity)
        result["guid"] = from_union([from_str, from_none], self.guid)
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["market_protection"] = from_union([from_int, from_none], self.market_protection)
        result["meta"] = from_union([lambda x: to_class(Meta, x), from_none], self.meta)
        result["modified"] = from_union([from_bool, from_none], self.modified)
        result["order_id"] = from_union([from_str, from_none], self.order_id)
        result["order_timestamp"] = from_union([from_none, lambda x: x.isoformat()], self.order_timestamp)
        result["order_type"] = from_union([from_str, from_none], self.order_type)
        result["pending_quantity"] = from_union([from_int, from_none], self.pending_quantity)
        result["placed_by"] = from_union([from_str, from_none], self.placed_by)
        result["price"] = from_union([from_int, from_none], self.price)
        result["product"] = from_union([from_str, from_none], self.product)
        result["quantity"] = from_union([from_int, from_none], self.quantity)
        result["status"] = from_union([from_str, from_none], self.status)
        result["status_message"] = from_union([from_none, from_str], self.status_message)
        result["status_message_raw"] = from_union([from_none, from_str], self.status_message_raw)
        result["tag"] = from_union([from_none, from_str], self.tag)
        result["tags"] = from_union([lambda x: from_list(from_str, x), from_none], self.tags)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["transaction_type"] = from_union([from_str, from_none], self.transaction_type)
        result["trigger_price"] = from_union([from_int, from_none], self.trigger_price)
        result["validity"] = from_union([from_str, from_none], self.validity)
        result["validity_ttl"] = from_union([from_int, from_none], self.validity_ttl)
        result["variety"] = from_union([from_str, from_none], self.variety)
        return result


@dataclass(slots=True)
class Orders:
    data: Optional[List[Datum]] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Orders':
        assert isinstance(obj, dict)
        data = from_union([lambda x: from_list(Datum.from_dict, x), from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return Orders(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: from_list(lambda x: to_class(Datum, x), x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def orders_from_dict(s: Any) -> Orders:
    return Orders.from_dict(s)


def orders_to_dict(x: Orders) -> Any:
    return to_class(Orders, x)
