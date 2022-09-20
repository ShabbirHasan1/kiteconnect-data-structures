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
#     result = postback_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Any, Optional, TypeVar, Type, cast
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


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass(slots=True)
class Meta:
    pass

    @staticmethod
    def from_dict(obj: Any) -> 'Meta':
        assert isinstance(obj, dict)
        return Meta()

    def to_dict(self) -> dict:
        result: dict = {}
        return result


@dataclass(slots=True)
class Postback:
    parent_order_id: None
    status_message: None
    status_message_raw: None
    tag: None
    app_id: Optional[int] = None
    average_price: Optional[int] = None
    cancelled_quantity: Optional[int] = None
    checksum: Optional[str] = None
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
    order_id: Optional[str] = None
    order_timestamp: Optional[datetime] = None
    order_type: Optional[str] = None
    pending_quantity: Optional[int] = None
    placed_by: Optional[str] = None
    price: Optional[int] = None
    product: Optional[str] = None
    quantity: Optional[int] = None
    status: Optional[str] = None
    tradingsymbol: Optional[str] = None
    transaction_type: Optional[str] = None
    trigger_price: Optional[int] = None
    unfilled_quantity: Optional[int] = None
    user_id: Optional[str] = None
    validity: Optional[str] = None
    variety: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Postback':
        assert isinstance(obj, dict)
        parent_order_id = from_none(obj.get("parent_order_id"))
        status_message = from_none(obj.get("status_message"))
        status_message_raw = from_none(obj.get("status_message_raw"))
        tag = from_none(obj.get("tag"))
        app_id = from_union([from_int, from_none], obj.get("app_id"))
        average_price = from_union([from_int, from_none], obj.get("average_price"))
        cancelled_quantity = from_union([from_int, from_none], obj.get("cancelled_quantity"))
        checksum = from_union([from_str, from_none], obj.get("checksum"))
        disclosed_quantity = from_union([from_int, from_none], obj.get("disclosed_quantity"))
        exchange = from_union([from_str, from_none], obj.get("exchange"))
        exchange_order_id = from_union([from_str, from_none], obj.get("exchange_order_id"))
        exchange_timestamp = from_union([from_datetime, from_none], obj.get("exchange_timestamp"))
        exchange_update_timestamp = from_union([from_datetime, from_none], obj.get("exchange_update_timestamp"))
        filled_quantity = from_union([from_int, from_none], obj.get("filled_quantity"))
        guid = from_union([from_str, from_none], obj.get("guid"))
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        market_protection = from_union([from_int, from_none], obj.get("market_protection"))
        meta = from_union([Meta.from_dict, from_none], obj.get("meta"))
        order_id = from_union([from_str, from_none], obj.get("order_id"))
        order_timestamp = from_union([from_datetime, from_none], obj.get("order_timestamp"))
        order_type = from_union([from_str, from_none], obj.get("order_type"))
        pending_quantity = from_union([from_int, from_none], obj.get("pending_quantity"))
        placed_by = from_union([from_str, from_none], obj.get("placed_by"))
        price = from_union([from_int, from_none], obj.get("price"))
        product = from_union([from_str, from_none], obj.get("product"))
        quantity = from_union([from_int, from_none], obj.get("quantity"))
        status = from_union([from_str, from_none], obj.get("status"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        transaction_type = from_union([from_str, from_none], obj.get("transaction_type"))
        trigger_price = from_union([from_int, from_none], obj.get("trigger_price"))
        unfilled_quantity = from_union([from_int, from_none], obj.get("unfilled_quantity"))
        user_id = from_union([from_str, from_none], obj.get("user_id"))
        validity = from_union([from_str, from_none], obj.get("validity"))
        variety = from_union([from_str, from_none], obj.get("variety"))
        return Postback(parent_order_id, status_message, status_message_raw, tag, app_id, average_price, cancelled_quantity, checksum, disclosed_quantity, exchange, exchange_order_id, exchange_timestamp, exchange_update_timestamp, filled_quantity, guid, instrument_token, market_protection, meta, order_id, order_timestamp, order_type, pending_quantity, placed_by, price, product, quantity, status, tradingsymbol, transaction_type, trigger_price, unfilled_quantity, user_id, validity, variety)

    def to_dict(self) -> dict:
        result: dict = {}
        result["parent_order_id"] = from_none(self.parent_order_id)
        result["status_message"] = from_none(self.status_message)
        result["status_message_raw"] = from_none(self.status_message_raw)
        result["tag"] = from_none(self.tag)
        result["app_id"] = from_union([from_int, from_none], self.app_id)
        result["average_price"] = from_union([from_int, from_none], self.average_price)
        result["cancelled_quantity"] = from_union([from_int, from_none], self.cancelled_quantity)
        result["checksum"] = from_union([from_str, from_none], self.checksum)
        result["disclosed_quantity"] = from_union([from_int, from_none], self.disclosed_quantity)
        result["exchange"] = from_union([from_str, from_none], self.exchange)
        result["exchange_order_id"] = from_union([from_str, from_none], self.exchange_order_id)
        result["exchange_timestamp"] = from_union([lambda x: x.isoformat(), from_none], self.exchange_timestamp)
        result["exchange_update_timestamp"] = from_union([lambda x: x.isoformat(), from_none], self.exchange_update_timestamp)
        result["filled_quantity"] = from_union([from_int, from_none], self.filled_quantity)
        result["guid"] = from_union([from_str, from_none], self.guid)
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["market_protection"] = from_union([from_int, from_none], self.market_protection)
        result["meta"] = from_union([lambda x: to_class(Meta, x), from_none], self.meta)
        result["order_id"] = from_union([from_str, from_none], self.order_id)
        result["order_timestamp"] = from_union([lambda x: x.isoformat(), from_none], self.order_timestamp)
        result["order_type"] = from_union([from_str, from_none], self.order_type)
        result["pending_quantity"] = from_union([from_int, from_none], self.pending_quantity)
        result["placed_by"] = from_union([from_str, from_none], self.placed_by)
        result["price"] = from_union([from_int, from_none], self.price)
        result["product"] = from_union([from_str, from_none], self.product)
        result["quantity"] = from_union([from_int, from_none], self.quantity)
        result["status"] = from_union([from_str, from_none], self.status)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["transaction_type"] = from_union([from_str, from_none], self.transaction_type)
        result["trigger_price"] = from_union([from_int, from_none], self.trigger_price)
        result["unfilled_quantity"] = from_union([from_int, from_none], self.unfilled_quantity)
        result["user_id"] = from_union([from_str, from_none], self.user_id)
        result["validity"] = from_union([from_str, from_none], self.validity)
        result["variety"] = from_union([from_str, from_none], self.variety)
        return result


def postback_from_dict(s: Any) -> Postback:
    return Postback.from_dict(s)


def postback_to_dict(x: Postback) -> Any:
    return to_class(Postback, x)
