# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = instruments_nse_from_dict(json.loads(json_string))

from enum import Enum
from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Type, Callable, cast


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


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


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


class Exchange(Enum):
    NSE = "NSE"


class InstrumentType(Enum):
    EQ = "EQ"


@dataclass(slots=True)
class InstrumentsNseElement:
    exchange: Optional[Exchange] = None
    exchange_token: Optional[int] = None
    expiry: Optional[str] = None
    instrument_token: Optional[int] = None
    instrument_type: Optional[InstrumentType] = None
    last_price: Optional[int] = None
    lot_size: Optional[int] = None
    name: Optional[str] = None
    segment: Optional[Exchange] = None
    strike: Optional[int] = None
    tick_size: Optional[float] = None
    tradingsymbol: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'InstrumentsNseElement':
        assert isinstance(obj, dict)
        exchange = from_union([Exchange, from_none], obj.get("exchange"))
        exchange_token = from_union([from_int, from_none], obj.get("exchange_token"))
        expiry = from_union([from_str, from_none], obj.get("expiry"))
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        instrument_type = from_union([InstrumentType, from_none], obj.get("instrument_type"))
        last_price = from_union([from_int, from_none], obj.get("last_price"))
        lot_size = from_union([from_int, from_none], obj.get("lot_size"))
        name = from_union([from_str, from_none], obj.get("name"))
        segment = from_union([Exchange, from_none], obj.get("segment"))
        strike = from_union([from_int, from_none], obj.get("strike"))
        tick_size = from_union([from_float, from_none], obj.get("tick_size"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        return InstrumentsNseElement(exchange, exchange_token, expiry, instrument_token, instrument_type, last_price, lot_size, name, segment, strike, tick_size, tradingsymbol)

    def to_dict(self) -> dict:
        result: dict = {}
        result["exchange"] = from_union([lambda x: to_enum(Exchange, x), from_none], self.exchange)
        result["exchange_token"] = from_union([from_int, from_none], self.exchange_token)
        result["expiry"] = from_union([from_str, from_none], self.expiry)
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["instrument_type"] = from_union([lambda x: to_enum(InstrumentType, x), from_none], self.instrument_type)
        result["last_price"] = from_union([from_int, from_none], self.last_price)
        result["lot_size"] = from_union([from_int, from_none], self.lot_size)
        result["name"] = from_union([from_str, from_none], self.name)
        result["segment"] = from_union([lambda x: to_enum(Exchange, x), from_none], self.segment)
        result["strike"] = from_union([from_int, from_none], self.strike)
        result["tick_size"] = from_union([to_float, from_none], self.tick_size)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        return result


def instruments_nse_from_dict(s: Any) -> List[InstrumentsNseElement]:
    return from_list(InstrumentsNseElement.from_dict, s)


def instruments_nse_to_dict(x: List[InstrumentsNseElement]) -> Any:
    return from_list(lambda x: to_class(InstrumentsNseElement, x), x)
