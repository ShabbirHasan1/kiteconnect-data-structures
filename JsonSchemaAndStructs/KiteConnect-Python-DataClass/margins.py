# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = margins_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, Dict, TypeVar, Callable, Type, cast


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


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def from_bool(x: Any) -> bool:
    assert isinstance(x, bool)
    return x


def from_dict(f: Callable[[Any], T], x: Any) -> Dict[str, T]:
    assert isinstance(x, dict)
    return { k: f(v) for (k, v) in x.items() }


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


@dataclass(slots=True)
class Available:
    adhoc_margin: Optional[int] = None
    cash: Optional[float] = None
    collateral: Optional[int] = None
    intraday_payin: Optional[int] = None
    live_balance: Optional[float] = None
    opening_balance: Optional[float] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Available':
        assert isinstance(obj, dict)
        adhoc_margin = from_union([from_int, from_none], obj.get("adhoc_margin"))
        cash = from_union([from_float, from_none], obj.get("cash"))
        collateral = from_union([from_int, from_none], obj.get("collateral"))
        intraday_payin = from_union([from_int, from_none], obj.get("intraday_payin"))
        live_balance = from_union([from_float, from_none], obj.get("live_balance"))
        opening_balance = from_union([from_float, from_none], obj.get("opening_balance"))
        return Available(adhoc_margin, cash, collateral, intraday_payin, live_balance, opening_balance)

    def to_dict(self) -> dict:
        result: dict = {}
        result["adhoc_margin"] = from_union([from_int, from_none], self.adhoc_margin)
        result["cash"] = from_union([to_float, from_none], self.cash)
        result["collateral"] = from_union([from_int, from_none], self.collateral)
        result["intraday_payin"] = from_union([from_int, from_none], self.intraday_payin)
        result["live_balance"] = from_union([to_float, from_none], self.live_balance)
        result["opening_balance"] = from_union([to_float, from_none], self.opening_balance)
        return result


@dataclass(slots=True)
class Ity:
    available: Optional[Available] = None
    enabled: Optional[bool] = None
    net: Optional[float] = None
    utilised: Optional[Dict[str, float]] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Ity':
        assert isinstance(obj, dict)
        available = from_union([Available.from_dict, from_none], obj.get("available"))
        enabled = from_union([from_bool, from_none], obj.get("enabled"))
        net = from_union([from_float, from_none], obj.get("net"))
        utilised = from_union([lambda x: from_dict(from_float, x), from_none], obj.get("utilised"))
        return Ity(available, enabled, net, utilised)

    def to_dict(self) -> dict:
        result: dict = {}
        result["available"] = from_union([lambda x: to_class(Available, x), from_none], self.available)
        result["enabled"] = from_union([from_bool, from_none], self.enabled)
        result["net"] = from_union([to_float, from_none], self.net)
        result["utilised"] = from_union([lambda x: from_dict(to_float, x), from_none], self.utilised)
        return result


@dataclass(slots=True)
class Data:
    commodity: Optional[Ity] = None
    equity: Optional[Ity] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        commodity = from_union([Ity.from_dict, from_none], obj.get("commodity"))
        equity = from_union([Ity.from_dict, from_none], obj.get("equity"))
        return Data(commodity, equity)

    def to_dict(self) -> dict:
        result: dict = {}
        result["commodity"] = from_union([lambda x: to_class(Ity, x), from_none], self.commodity)
        result["equity"] = from_union([lambda x: to_class(Ity, x), from_none], self.equity)
        return result


@dataclass(slots=True)
class Margins:
    data: Optional[Data] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Margins':
        assert isinstance(obj, dict)
        data = from_union([Data.from_dict, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return Margins(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: to_class(Data, x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def margins_from_dict(s: Any) -> Margins:
    return Margins.from_dict(s)


def margins_to_dict(x: Margins) -> Any:
    return to_class(Margins, x)
