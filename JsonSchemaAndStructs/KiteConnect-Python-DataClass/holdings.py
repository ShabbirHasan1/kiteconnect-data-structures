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
#     result = holdings_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Callable, Type, cast
from datetime import datetime
import dateutil.parser


T = TypeVar("T")


def from_datetime(x: Any) -> datetime:
    return dateutil.parser.parse(x)


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


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_bool(x: Any) -> bool:
    assert isinstance(x, bool)
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
    authorised_date: Optional[datetime] = None
    authorised_quantity: Optional[int] = None
    average_price: Optional[float] = None
    close_price: Optional[float] = None
    collateral_quantity: Optional[int] = None
    collateral_type: Optional[str] = None
    day_change: Optional[float] = None
    day_change_percentage: Optional[float] = None
    discrepancy: Optional[bool] = None
    exchange: Optional[str] = None
    instrument_token: Optional[int] = None
    isin: Optional[str] = None
    last_price: Optional[float] = None
    opening_quantity: Optional[int] = None
    pnl: Optional[float] = None
    price: Optional[int] = None
    product: Optional[str] = None
    quantity: Optional[int] = None
    realised_quantity: Optional[int] = None
    t1_quantity: Optional[int] = None
    tradingsymbol: Optional[str] = None
    used_quantity: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Datum':
        assert isinstance(obj, dict)
        authorised_date = from_union([from_datetime, from_none], obj.get("authorised_date"))
        authorised_quantity = from_union([from_int, from_none], obj.get("authorised_quantity"))
        average_price = from_union([from_float, from_none], obj.get("average_price"))
        close_price = from_union([from_float, from_none], obj.get("close_price"))
        collateral_quantity = from_union([from_int, from_none], obj.get("collateral_quantity"))
        collateral_type = from_union([from_str, from_none], obj.get("collateral_type"))
        day_change = from_union([from_float, from_none], obj.get("day_change"))
        day_change_percentage = from_union([from_float, from_none], obj.get("day_change_percentage"))
        discrepancy = from_union([from_bool, from_none], obj.get("discrepancy"))
        exchange = from_union([from_str, from_none], obj.get("exchange"))
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        isin = from_union([from_str, from_none], obj.get("isin"))
        last_price = from_union([from_float, from_none], obj.get("last_price"))
        opening_quantity = from_union([from_int, from_none], obj.get("opening_quantity"))
        pnl = from_union([from_float, from_none], obj.get("pnl"))
        price = from_union([from_int, from_none], obj.get("price"))
        product = from_union([from_str, from_none], obj.get("product"))
        quantity = from_union([from_int, from_none], obj.get("quantity"))
        realised_quantity = from_union([from_int, from_none], obj.get("realised_quantity"))
        t1_quantity = from_union([from_int, from_none], obj.get("t1_quantity"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        used_quantity = from_union([from_int, from_none], obj.get("used_quantity"))
        return Datum(authorised_date, authorised_quantity, average_price, close_price, collateral_quantity, collateral_type, day_change, day_change_percentage, discrepancy, exchange, instrument_token, isin, last_price, opening_quantity, pnl, price, product, quantity, realised_quantity, t1_quantity, tradingsymbol, used_quantity)

    def to_dict(self) -> dict:
        result: dict = {}
        result["authorised_date"] = from_union([lambda x: x.isoformat(), from_none], self.authorised_date)
        result["authorised_quantity"] = from_union([from_int, from_none], self.authorised_quantity)
        result["average_price"] = from_union([to_float, from_none], self.average_price)
        result["close_price"] = from_union([to_float, from_none], self.close_price)
        result["collateral_quantity"] = from_union([from_int, from_none], self.collateral_quantity)
        result["collateral_type"] = from_union([from_str, from_none], self.collateral_type)
        result["day_change"] = from_union([to_float, from_none], self.day_change)
        result["day_change_percentage"] = from_union([to_float, from_none], self.day_change_percentage)
        result["discrepancy"] = from_union([from_bool, from_none], self.discrepancy)
        result["exchange"] = from_union([from_str, from_none], self.exchange)
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["isin"] = from_union([from_str, from_none], self.isin)
        result["last_price"] = from_union([to_float, from_none], self.last_price)
        result["opening_quantity"] = from_union([from_int, from_none], self.opening_quantity)
        result["pnl"] = from_union([to_float, from_none], self.pnl)
        result["price"] = from_union([from_int, from_none], self.price)
        result["product"] = from_union([from_str, from_none], self.product)
        result["quantity"] = from_union([from_int, from_none], self.quantity)
        result["realised_quantity"] = from_union([from_int, from_none], self.realised_quantity)
        result["t1_quantity"] = from_union([from_int, from_none], self.t1_quantity)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["used_quantity"] = from_union([from_int, from_none], self.used_quantity)
        return result


@dataclass(slots=True)
class Holdings:
    data: Optional[List[Datum]] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Holdings':
        assert isinstance(obj, dict)
        data = from_union([lambda x: from_list(Datum.from_dict, x), from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return Holdings(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: from_list(lambda x: to_class(Datum, x), x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def holdings_from_dict(s: Any) -> Holdings:
    return Holdings.from_dict(s)


def holdings_to_dict(x: Holdings) -> Any:
    return to_class(Holdings, x)
