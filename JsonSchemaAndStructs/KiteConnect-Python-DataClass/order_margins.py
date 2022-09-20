# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = order_margins_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Type, cast, Callable


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


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


@dataclass(slots=True)
class Pnl:
    realised: Optional[int] = None
    unrealised: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Pnl':
        assert isinstance(obj, dict)
        realised = from_union([from_int, from_none], obj.get("realised"))
        unrealised = from_union([from_int, from_none], obj.get("unrealised"))
        return Pnl(realised, unrealised)

    def to_dict(self) -> dict:
        result: dict = {}
        result["realised"] = from_union([from_int, from_none], self.realised)
        result["unrealised"] = from_union([from_int, from_none], self.unrealised)
        return result


@dataclass(slots=True)
class Datum:
    additional: Optional[int] = None
    bo: Optional[int] = None
    cash: Optional[int] = None
    exchange: Optional[str] = None
    exposure: Optional[int] = None
    option_premium: Optional[int] = None
    pnl: Optional[Pnl] = None
    span: Optional[int] = None
    total: Optional[float] = None
    tradingsymbol: Optional[str] = None
    type: Optional[str] = None
    var: Optional[float] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Datum':
        assert isinstance(obj, dict)
        additional = from_union([from_int, from_none], obj.get("additional"))
        bo = from_union([from_int, from_none], obj.get("bo"))
        cash = from_union([from_int, from_none], obj.get("cash"))
        exchange = from_union([from_str, from_none], obj.get("exchange"))
        exposure = from_union([from_int, from_none], obj.get("exposure"))
        option_premium = from_union([from_int, from_none], obj.get("option_premium"))
        pnl = from_union([Pnl.from_dict, from_none], obj.get("pnl"))
        span = from_union([from_int, from_none], obj.get("span"))
        total = from_union([from_float, from_none], obj.get("total"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        type = from_union([from_str, from_none], obj.get("type"))
        var = from_union([from_float, from_none], obj.get("var"))
        return Datum(additional, bo, cash, exchange, exposure, option_premium, pnl, span, total, tradingsymbol, type, var)

    def to_dict(self) -> dict:
        result: dict = {}
        result["additional"] = from_union([from_int, from_none], self.additional)
        result["bo"] = from_union([from_int, from_none], self.bo)
        result["cash"] = from_union([from_int, from_none], self.cash)
        result["exchange"] = from_union([from_str, from_none], self.exchange)
        result["exposure"] = from_union([from_int, from_none], self.exposure)
        result["option_premium"] = from_union([from_int, from_none], self.option_premium)
        result["pnl"] = from_union([lambda x: to_class(Pnl, x), from_none], self.pnl)
        result["span"] = from_union([from_int, from_none], self.span)
        result["total"] = from_union([to_float, from_none], self.total)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["type"] = from_union([from_str, from_none], self.type)
        result["var"] = from_union([to_float, from_none], self.var)
        return result


@dataclass(slots=True)
class OrderMargins:
    data: Optional[List[Datum]] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'OrderMargins':
        assert isinstance(obj, dict)
        data = from_union([lambda x: from_list(Datum.from_dict, x), from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return OrderMargins(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: from_list(lambda x: to_class(Datum, x), x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def order_margins_from_dict(s: Any) -> OrderMargins:
    return OrderMargins.from_dict(s)


def order_margins_to_dict(x: OrderMargins) -> Any:
    return to_class(OrderMargins, x)
