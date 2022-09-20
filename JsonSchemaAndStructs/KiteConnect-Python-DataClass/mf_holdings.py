# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = mf_holdings_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Callable, Type, cast


T = TypeVar("T")


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


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


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
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
    average_price: Optional[float] = None
    folio: Optional[str] = None
    fund: Optional[str] = None
    last_price: Optional[float] = None
    last_price_date: Optional[str] = None
    pledged_quantity: Optional[int] = None
    pnl: Optional[int] = None
    quantity: Optional[float] = None
    tradingsymbol: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Datum':
        assert isinstance(obj, dict)
        average_price = from_union([from_float, from_none], obj.get("average_price"))
        folio = from_union([from_str, from_none], obj.get("folio"))
        fund = from_union([from_str, from_none], obj.get("fund"))
        last_price = from_union([from_float, from_none], obj.get("last_price"))
        last_price_date = from_union([from_str, from_none], obj.get("last_price_date"))
        pledged_quantity = from_union([from_int, from_none], obj.get("pledged_quantity"))
        pnl = from_union([from_int, from_none], obj.get("pnl"))
        quantity = from_union([from_float, from_none], obj.get("quantity"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        return Datum(average_price, folio, fund, last_price, last_price_date, pledged_quantity, pnl, quantity, tradingsymbol)

    def to_dict(self) -> dict:
        result: dict = {}
        result["average_price"] = from_union([to_float, from_none], self.average_price)
        result["folio"] = from_union([from_str, from_none], self.folio)
        result["fund"] = from_union([from_str, from_none], self.fund)
        result["last_price"] = from_union([to_float, from_none], self.last_price)
        result["last_price_date"] = from_union([from_str, from_none], self.last_price_date)
        result["pledged_quantity"] = from_union([from_int, from_none], self.pledged_quantity)
        result["pnl"] = from_union([from_int, from_none], self.pnl)
        result["quantity"] = from_union([to_float, from_none], self.quantity)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        return result


@dataclass(slots=True)
class MFHoldings:
    data: Optional[List[Datum]] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'MFHoldings':
        assert isinstance(obj, dict)
        data = from_union([lambda x: from_list(Datum.from_dict, x), from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return MFHoldings(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: from_list(lambda x: to_class(Datum, x), x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def mf_holdings_from_dict(s: Any) -> MFHoldings:
    return MFHoldings.from_dict(s)


def mf_holdings_to_dict(x: MFHoldings) -> Any:
    return to_class(MFHoldings, x)
