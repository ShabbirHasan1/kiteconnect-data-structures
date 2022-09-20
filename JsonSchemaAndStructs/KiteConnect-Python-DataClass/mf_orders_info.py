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
#     result = mf_orders_info_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, TypeVar, Type, cast
from datetime import datetime
from uuid import UUID
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


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def from_datetime(x: Any) -> datetime:
    return dateutil.parser.parse(x)


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass(slots=True)
class Data:
    exchange_order_id: None
    exchange_timestamp: None
    folio: None
    settlement_id: None
    tag: None
    amount: Optional[int] = None
    average_price: Optional[int] = None
    fund: Optional[str] = None
    last_price: Optional[float] = None
    last_price_date: Optional[datetime] = None
    order_id: Optional[UUID] = None
    order_timestamp: Optional[datetime] = None
    placed_by: Optional[str] = None
    purchase_type: Optional[str] = None
    quantity: Optional[int] = None
    status: Optional[str] = None
    status_message: Optional[str] = None
    tradingsymbol: Optional[str] = None
    transaction_type: Optional[str] = None
    variety: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        exchange_order_id = from_none(obj.get("exchange_order_id"))
        exchange_timestamp = from_none(obj.get("exchange_timestamp"))
        folio = from_none(obj.get("folio"))
        settlement_id = from_none(obj.get("settlement_id"))
        tag = from_none(obj.get("tag"))
        amount = from_union([from_int, from_none], obj.get("amount"))
        average_price = from_union([from_int, from_none], obj.get("average_price"))
        fund = from_union([from_str, from_none], obj.get("fund"))
        last_price = from_union([from_float, from_none], obj.get("last_price"))
        last_price_date = from_union([from_datetime, from_none], obj.get("last_price_date"))
        order_id = from_union([lambda x: UUID(x), from_none], obj.get("order_id"))
        order_timestamp = from_union([from_datetime, from_none], obj.get("order_timestamp"))
        placed_by = from_union([from_str, from_none], obj.get("placed_by"))
        purchase_type = from_union([from_str, from_none], obj.get("purchase_type"))
        quantity = from_union([from_int, from_none], obj.get("quantity"))
        status = from_union([from_str, from_none], obj.get("status"))
        status_message = from_union([from_str, from_none], obj.get("status_message"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        transaction_type = from_union([from_str, from_none], obj.get("transaction_type"))
        variety = from_union([from_str, from_none], obj.get("variety"))
        return Data(exchange_order_id, exchange_timestamp, folio, settlement_id, tag, amount, average_price, fund, last_price, last_price_date, order_id, order_timestamp, placed_by, purchase_type, quantity, status, status_message, tradingsymbol, transaction_type, variety)

    def to_dict(self) -> dict:
        result: dict = {}
        result["exchange_order_id"] = from_none(self.exchange_order_id)
        result["exchange_timestamp"] = from_none(self.exchange_timestamp)
        result["folio"] = from_none(self.folio)
        result["settlement_id"] = from_none(self.settlement_id)
        result["tag"] = from_none(self.tag)
        result["amount"] = from_union([from_int, from_none], self.amount)
        result["average_price"] = from_union([from_int, from_none], self.average_price)
        result["fund"] = from_union([from_str, from_none], self.fund)
        result["last_price"] = from_union([to_float, from_none], self.last_price)
        result["last_price_date"] = from_union([lambda x: x.isoformat(), from_none], self.last_price_date)
        result["order_id"] = from_union([lambda x: str(x), from_none], self.order_id)
        result["order_timestamp"] = from_union([lambda x: x.isoformat(), from_none], self.order_timestamp)
        result["placed_by"] = from_union([from_str, from_none], self.placed_by)
        result["purchase_type"] = from_union([from_str, from_none], self.purchase_type)
        result["quantity"] = from_union([from_int, from_none], self.quantity)
        result["status"] = from_union([from_str, from_none], self.status)
        result["status_message"] = from_union([from_str, from_none], self.status_message)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["transaction_type"] = from_union([from_str, from_none], self.transaction_type)
        result["variety"] = from_union([from_str, from_none], self.variety)
        return result


@dataclass(slots=True)
class MFOrdersInfo:
    data: Optional[Data] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'MFOrdersInfo':
        assert isinstance(obj, dict)
        data = from_union([Data.from_dict, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return MFOrdersInfo(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: to_class(Data, x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def mf_orders_info_from_dict(s: Any) -> MFOrdersInfo:
    return MFOrdersInfo.from_dict(s)


def mf_orders_info_to_dict(x: MFOrdersInfo) -> Any:
    return to_class(MFOrdersInfo, x)
