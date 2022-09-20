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
#     result = mf_instruments_from_dict(json.loads(json_string))

from enum import Enum
from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Type, Callable, cast
from datetime import datetime
import dateutil.parser


T = TypeVar("T")
EnumT = TypeVar("EnumT", bound=Enum)


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


def from_datetime(x: Any) -> datetime:
    return dateutil.parser.parse(x)


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def to_enum(c: Type[EnumT], x: Any) -> EnumT:
    assert isinstance(x, c)
    return x.value


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


class Amc(Enum):
    BIRLA_SUN_LIFE_MUTUAL_FUND_MF = "BirlaSunLifeMutualFund_MF"


class DividendType(Enum):
    GROWTH = "growth"
    PAYOUT = "payout"


class Plan(Enum):
    DIRECT = "direct"
    REGULAR = "regular"


class SchemeType(Enum):
    BALANCED = "balanced"
    DEBT = "debt"
    EQUITY = "equity"
    FOF = "fof"
    LIQUID = "liquid"


class SettlementType(Enum):
    T1 = "T1"
    T3 = "T3"
    T4 = "T4"
    T6 = "T6"


@dataclass(slots=True)
class MFInstrument:
    amc: Optional[Amc] = None
    dividend_type: Optional[DividendType] = None
    last_price: Optional[float] = None
    last_price_date: Optional[datetime] = None
    minimum_additional_purchase_amount: Optional[int] = None
    minimum_purchase_amount: Optional[int] = None
    minimum_redemption_quantity: Optional[float] = None
    name: Optional[str] = None
    plan: Optional[Plan] = None
    purchase_allowed: Optional[int] = None
    purchase_amount_multiplier: Optional[int] = None
    redemption_allowed: Optional[int] = None
    redemption_quantity_multiplier: Optional[float] = None
    scheme_type: Optional[SchemeType] = None
    settlement_type: Optional[SettlementType] = None
    tradingsymbol: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'MFInstrument':
        assert isinstance(obj, dict)
        amc = from_union([Amc, from_none], obj.get("amc"))
        dividend_type = from_union([DividendType, from_none], obj.get("dividend_type"))
        last_price = from_union([from_float, from_none], obj.get("last_price"))
        last_price_date = from_union([from_datetime, from_none], obj.get("last_price_date"))
        minimum_additional_purchase_amount = from_union([from_int, from_none], obj.get("minimum_additional_purchase_amount"))
        minimum_purchase_amount = from_union([from_int, from_none], obj.get("minimum_purchase_amount"))
        minimum_redemption_quantity = from_union([from_float, from_none], obj.get("minimum_redemption_quantity"))
        name = from_union([from_str, from_none], obj.get("name"))
        plan = from_union([Plan, from_none], obj.get("plan"))
        purchase_allowed = from_union([from_int, from_none], obj.get("purchase_allowed"))
        purchase_amount_multiplier = from_union([from_int, from_none], obj.get("purchase_amount_multiplier"))
        redemption_allowed = from_union([from_int, from_none], obj.get("redemption_allowed"))
        redemption_quantity_multiplier = from_union([from_float, from_none], obj.get("redemption_quantity_multiplier"))
        scheme_type = from_union([SchemeType, from_none], obj.get("scheme_type"))
        settlement_type = from_union([SettlementType, from_none], obj.get("settlement_type"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        return MFInstrument(amc, dividend_type, last_price, last_price_date, minimum_additional_purchase_amount, minimum_purchase_amount, minimum_redemption_quantity, name, plan, purchase_allowed, purchase_amount_multiplier, redemption_allowed, redemption_quantity_multiplier, scheme_type, settlement_type, tradingsymbol)

    def to_dict(self) -> dict:
        result: dict = {}
        result["amc"] = from_union([lambda x: to_enum(Amc, x), from_none], self.amc)
        result["dividend_type"] = from_union([lambda x: to_enum(DividendType, x), from_none], self.dividend_type)
        result["last_price"] = from_union([to_float, from_none], self.last_price)
        result["last_price_date"] = from_union([lambda x: x.isoformat(), from_none], self.last_price_date)
        result["minimum_additional_purchase_amount"] = from_union([from_int, from_none], self.minimum_additional_purchase_amount)
        result["minimum_purchase_amount"] = from_union([from_int, from_none], self.minimum_purchase_amount)
        result["minimum_redemption_quantity"] = from_union([to_float, from_none], self.minimum_redemption_quantity)
        result["name"] = from_union([from_str, from_none], self.name)
        result["plan"] = from_union([lambda x: to_enum(Plan, x), from_none], self.plan)
        result["purchase_allowed"] = from_union([from_int, from_none], self.purchase_allowed)
        result["purchase_amount_multiplier"] = from_union([from_int, from_none], self.purchase_amount_multiplier)
        result["redemption_allowed"] = from_union([from_int, from_none], self.redemption_allowed)
        result["redemption_quantity_multiplier"] = from_union([to_float, from_none], self.redemption_quantity_multiplier)
        result["scheme_type"] = from_union([lambda x: to_enum(SchemeType, x), from_none], self.scheme_type)
        result["settlement_type"] = from_union([lambda x: to_enum(SettlementType, x), from_none], self.settlement_type)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        return result


def mf_instruments_from_dict(s: Any) -> List[MFInstrument]:
    return from_list(MFInstrument.from_dict, s)


def mf_instruments_to_dict(x: List[MFInstrument]) -> Any:
    return from_list(lambda x: to_class(MFInstrument, x), x)
