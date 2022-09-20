# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = positions_from_dict(json.loads(json_string))

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


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_str(x: Any) -> str:
    assert isinstance(x, str)
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
class Day:
    average_price: Optional[float] = None
    buy_m2_m: Optional[int] = None
    buy_price: Optional[float] = None
    buy_quantity: Optional[int] = None
    buy_value: Optional[int] = None
    close_price: Optional[int] = None
    day_buy_price: Optional[float] = None
    day_buy_quantity: Optional[int] = None
    day_buy_value: Optional[int] = None
    day_sell_price: Optional[int] = None
    day_sell_quantity: Optional[int] = None
    day_sell_value: Optional[int] = None
    exchange: Optional[str] = None
    instrument_token: Optional[int] = None
    last_price: Optional[float] = None
    m2_m: Optional[int] = None
    multiplier: Optional[int] = None
    overnight_quantity: Optional[int] = None
    pnl: Optional[int] = None
    product: Optional[str] = None
    quantity: Optional[int] = None
    realised: Optional[int] = None
    sell_m2_m: Optional[int] = None
    sell_price: Optional[int] = None
    sell_quantity: Optional[int] = None
    sell_value: Optional[int] = None
    tradingsymbol: Optional[str] = None
    unrealised: Optional[int] = None
    value: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Day':
        assert isinstance(obj, dict)
        average_price = from_union([from_float, from_none], obj.get("average_price"))
        buy_m2_m = from_union([from_int, from_none], obj.get("buy_m2m"))
        buy_price = from_union([from_float, from_none], obj.get("buy_price"))
        buy_quantity = from_union([from_int, from_none], obj.get("buy_quantity"))
        buy_value = from_union([from_int, from_none], obj.get("buy_value"))
        close_price = from_union([from_int, from_none], obj.get("close_price"))
        day_buy_price = from_union([from_float, from_none], obj.get("day_buy_price"))
        day_buy_quantity = from_union([from_int, from_none], obj.get("day_buy_quantity"))
        day_buy_value = from_union([from_int, from_none], obj.get("day_buy_value"))
        day_sell_price = from_union([from_int, from_none], obj.get("day_sell_price"))
        day_sell_quantity = from_union([from_int, from_none], obj.get("day_sell_quantity"))
        day_sell_value = from_union([from_int, from_none], obj.get("day_sell_value"))
        exchange = from_union([from_str, from_none], obj.get("exchange"))
        instrument_token = from_union([from_int, from_none], obj.get("instrument_token"))
        last_price = from_union([from_float, from_none], obj.get("last_price"))
        m2_m = from_union([from_int, from_none], obj.get("m2m"))
        multiplier = from_union([from_int, from_none], obj.get("multiplier"))
        overnight_quantity = from_union([from_int, from_none], obj.get("overnight_quantity"))
        pnl = from_union([from_int, from_none], obj.get("pnl"))
        product = from_union([from_str, from_none], obj.get("product"))
        quantity = from_union([from_int, from_none], obj.get("quantity"))
        realised = from_union([from_int, from_none], obj.get("realised"))
        sell_m2_m = from_union([from_int, from_none], obj.get("sell_m2m"))
        sell_price = from_union([from_int, from_none], obj.get("sell_price"))
        sell_quantity = from_union([from_int, from_none], obj.get("sell_quantity"))
        sell_value = from_union([from_int, from_none], obj.get("sell_value"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        unrealised = from_union([from_int, from_none], obj.get("unrealised"))
        value = from_union([from_int, from_none], obj.get("value"))
        return Day(average_price, buy_m2_m, buy_price, buy_quantity, buy_value, close_price, day_buy_price, day_buy_quantity, day_buy_value, day_sell_price, day_sell_quantity, day_sell_value, exchange, instrument_token, last_price, m2_m, multiplier, overnight_quantity, pnl, product, quantity, realised, sell_m2_m, sell_price, sell_quantity, sell_value, tradingsymbol, unrealised, value)

    def to_dict(self) -> dict:
        result: dict = {}
        result["average_price"] = from_union([to_float, from_none], self.average_price)
        result["buy_m2m"] = from_union([from_int, from_none], self.buy_m2_m)
        result["buy_price"] = from_union([to_float, from_none], self.buy_price)
        result["buy_quantity"] = from_union([from_int, from_none], self.buy_quantity)
        result["buy_value"] = from_union([from_int, from_none], self.buy_value)
        result["close_price"] = from_union([from_int, from_none], self.close_price)
        result["day_buy_price"] = from_union([to_float, from_none], self.day_buy_price)
        result["day_buy_quantity"] = from_union([from_int, from_none], self.day_buy_quantity)
        result["day_buy_value"] = from_union([from_int, from_none], self.day_buy_value)
        result["day_sell_price"] = from_union([from_int, from_none], self.day_sell_price)
        result["day_sell_quantity"] = from_union([from_int, from_none], self.day_sell_quantity)
        result["day_sell_value"] = from_union([from_int, from_none], self.day_sell_value)
        result["exchange"] = from_union([from_str, from_none], self.exchange)
        result["instrument_token"] = from_union([from_int, from_none], self.instrument_token)
        result["last_price"] = from_union([to_float, from_none], self.last_price)
        result["m2m"] = from_union([from_int, from_none], self.m2_m)
        result["multiplier"] = from_union([from_int, from_none], self.multiplier)
        result["overnight_quantity"] = from_union([from_int, from_none], self.overnight_quantity)
        result["pnl"] = from_union([from_int, from_none], self.pnl)
        result["product"] = from_union([from_str, from_none], self.product)
        result["quantity"] = from_union([from_int, from_none], self.quantity)
        result["realised"] = from_union([from_int, from_none], self.realised)
        result["sell_m2m"] = from_union([from_int, from_none], self.sell_m2_m)
        result["sell_price"] = from_union([from_int, from_none], self.sell_price)
        result["sell_quantity"] = from_union([from_int, from_none], self.sell_quantity)
        result["sell_value"] = from_union([from_int, from_none], self.sell_value)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["unrealised"] = from_union([from_int, from_none], self.unrealised)
        result["value"] = from_union([from_int, from_none], self.value)
        return result


@dataclass(slots=True)
class Data:
    day: Optional[List[Day]] = None
    net: Optional[List[Day]] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        day = from_union([lambda x: from_list(Day.from_dict, x), from_none], obj.get("day"))
        net = from_union([lambda x: from_list(Day.from_dict, x), from_none], obj.get("net"))
        return Data(day, net)

    def to_dict(self) -> dict:
        result: dict = {}
        result["day"] = from_union([lambda x: from_list(lambda x: to_class(Day, x), x), from_none], self.day)
        result["net"] = from_union([lambda x: from_list(lambda x: to_class(Day, x), x), from_none], self.net)
        return result


@dataclass(slots=True)
class Positions:
    data: Optional[Data] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Positions':
        assert isinstance(obj, dict)
        data = from_union([Data.from_dict, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return Positions(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: to_class(Data, x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def positions_from_dict(s: Any) -> Positions:
    return Positions.from_dict(s)


def positions_to_dict(x: Positions) -> Any:
    return to_class(Positions, x)
