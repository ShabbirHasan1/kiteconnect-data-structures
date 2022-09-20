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
#     result = mf_orders_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Type, Callable, cast
from datetime import datetime
from uuid import UUID
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


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def is_type(t: Type[T], x: Any) -> T:
    assert isinstance(x, t)
    return x


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
    exchange_order_id: Optional[int] = None
    folio: None
    settlement_id: Optional[int] = None
    amount: Optional[int] = None
    average_price: Optional[int] = None
    exchange_timestamp: Optional[datetime] = None
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
    tag: Optional[str] = None
    tradingsymbol: Optional[str] = None
    transaction_type: Optional[str] = None
    variety: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Datum':
        assert isinstance(obj, dict)
        exchange_order_id = from_union([from_none, lambda x: int(from_str(x))], obj.get("exchange_order_id"))
        folio = from_none(obj.get("folio"))
        settlement_id = from_union([from_none, lambda x: int(from_str(x))], obj.get("settlement_id"))
        amount = from_union([from_int, from_none], obj.get("amount"))
        average_price = from_union([from_int, from_none], obj.get("average_price"))
        exchange_timestamp = from_union([from_none, from_datetime], obj.get("exchange_timestamp"))
        fund = from_union([from_str, from_none], obj.get("fund"))
        last_price = from_union([from_float, from_none], obj.get("last_price"))
        last_price_date = from_union([from_none, from_datetime], obj.get("last_price_date"))
        order_id = from_union([lambda x: UUID(x), from_none], obj.get("order_id"))
        order_timestamp = from_union([from_none, from_datetime], obj.get("order_timestamp"))
        placed_by = from_union([from_str, from_none], obj.get("placed_by"))
        purchase_type = from_union([from_str, from_none], obj.get("purchase_type"))
        quantity = from_union([from_int, from_none], obj.get("quantity"))
        status = from_union([from_str, from_none], obj.get("status"))
        status_message = from_union([from_str, from_none], obj.get("status_message"))
        tag = from_union([from_none, from_str], obj.get("tag"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        transaction_type = from_union([from_str, from_none], obj.get("transaction_type"))
        variety = from_union([from_str, from_none], obj.get("variety"))
        return Datum(exchange_order_id, folio, settlement_id, amount, average_price, exchange_timestamp, fund, last_price, last_price_date, order_id, order_timestamp, placed_by, purchase_type, quantity, status, status_message, tag, tradingsymbol, transaction_type, variety)

    def to_dict(self) -> dict:
        result: dict = {}
        result["exchange_order_id"] = from_union([lambda x: from_none((lambda x: is_type(type(None), x))(x)), lambda x: from_str((lambda x: str((lambda x: is_type(int, x))(x)))(x))], self.exchange_order_id)
        result["folio"] = from_none(self.folio)
        result["settlement_id"] = from_union([lambda x: from_none((lambda x: is_type(type(None), x))(x)), lambda x: from_str((lambda x: str((lambda x: is_type(int, x))(x)))(x))], self.settlement_id)
        result["amount"] = from_union([from_int, from_none], self.amount)
        result["average_price"] = from_union([from_int, from_none], self.average_price)
        result["exchange_timestamp"] = from_union([from_none, lambda x: x.isoformat()], self.exchange_timestamp)
        result["fund"] = from_union([from_str, from_none], self.fund)
        result["last_price"] = from_union([to_float, from_none], self.last_price)
        result["last_price_date"] = from_union([from_none, lambda x: x.isoformat()], self.last_price_date)
        result["order_id"] = from_union([lambda x: str(x), from_none], self.order_id)
        result["order_timestamp"] = from_union([from_none, lambda x: x.isoformat()], self.order_timestamp)
        result["placed_by"] = from_union([from_str, from_none], self.placed_by)
        result["purchase_type"] = from_union([from_str, from_none], self.purchase_type)
        result["quantity"] = from_union([from_int, from_none], self.quantity)
        result["status"] = from_union([from_str, from_none], self.status)
        result["status_message"] = from_union([from_str, from_none], self.status_message)
        result["tag"] = from_union([from_none, from_str], self.tag)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["transaction_type"] = from_union([from_str, from_none], self.transaction_type)
        result["variety"] = from_union([from_str, from_none], self.variety)
        return result


@dataclass(slots=True)
class MFOrders:
    data: Optional[List[Datum]] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'MFOrders':
        assert isinstance(obj, dict)
        data = from_union([lambda x: from_list(Datum.from_dict, x), from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return MFOrders(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: from_list(lambda x: to_class(Datum, x), x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def mf_orders_from_dict(s: Any) -> MFOrders:
    return MFOrders.from_dict(s)


def mf_orders_to_dict(x: MFOrders) -> Any:
    return to_class(MFOrders, x)
