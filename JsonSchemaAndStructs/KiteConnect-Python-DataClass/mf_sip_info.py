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
#     result = mfsip_info_from_dict(json.loads(json_string))

from dataclasses import dataclass
from typing import Optional, Any, TypeVar, Type, cast
from datetime import datetime
import dateutil.parser


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


def from_datetime(x: Any) -> datetime:
    return dateutil.parser.parse(x)


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass(slots=True)
class StepUp:
    the_1502: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'StepUp':
        assert isinstance(obj, dict)
        the_1502 = from_union([from_int, from_none], obj.get("15-02"))
        return StepUp(the_1502)

    def to_dict(self) -> dict:
        result: dict = {}
        result["15-02"] = from_union([from_int, from_none], self.the_1502)
        return result


@dataclass(slots=True)
class Data:
    sip_reg_num: None
    completed_instalments: Optional[int] = None
    created: Optional[datetime] = None
    dividend_type: Optional[str] = None
    frequency: Optional[str] = None
    fund: Optional[str] = None
    fund_source: Optional[str] = None
    instalment_amount: Optional[int] = None
    instalment_day: Optional[int] = None
    instalments: Optional[int] = None
    last_instalment: Optional[datetime] = None
    next_instalment: Optional[datetime] = None
    pending_instalments: Optional[int] = None
    sip_id: Optional[str] = None
    sip_type: Optional[str] = None
    status: Optional[str] = None
    step_up: Optional[StepUp] = None
    tag: Optional[str] = None
    tradingsymbol: Optional[str] = None
    transaction_type: Optional[str] = None
    trigger_price: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        sip_reg_num = from_none(obj.get("sip_reg_num"))
        completed_instalments = from_union([from_int, from_none], obj.get("completed_instalments"))
        created = from_union([from_datetime, from_none], obj.get("created"))
        dividend_type = from_union([from_str, from_none], obj.get("dividend_type"))
        frequency = from_union([from_str, from_none], obj.get("frequency"))
        fund = from_union([from_str, from_none], obj.get("fund"))
        fund_source = from_union([from_str, from_none], obj.get("fund_source"))
        instalment_amount = from_union([from_int, from_none], obj.get("instalment_amount"))
        instalment_day = from_union([from_int, from_none], obj.get("instalment_day"))
        instalments = from_union([from_int, from_none], obj.get("instalments"))
        last_instalment = from_union([from_datetime, from_none], obj.get("last_instalment"))
        next_instalment = from_union([from_datetime, from_none], obj.get("next_instalment"))
        pending_instalments = from_union([from_int, from_none], obj.get("pending_instalments"))
        sip_id = from_union([from_str, from_none], obj.get("sip_id"))
        sip_type = from_union([from_str, from_none], obj.get("sip_type"))
        status = from_union([from_str, from_none], obj.get("status"))
        step_up = from_union([StepUp.from_dict, from_none], obj.get("step_up"))
        tag = from_union([from_str, from_none], obj.get("tag"))
        tradingsymbol = from_union([from_str, from_none], obj.get("tradingsymbol"))
        transaction_type = from_union([from_str, from_none], obj.get("transaction_type"))
        trigger_price = from_union([from_int, from_none], obj.get("trigger_price"))
        return Data(sip_reg_num, completed_instalments, created, dividend_type, frequency, fund, fund_source, instalment_amount, instalment_day, instalments, last_instalment, next_instalment, pending_instalments, sip_id, sip_type, status, step_up, tag, tradingsymbol, transaction_type, trigger_price)

    def to_dict(self) -> dict:
        result: dict = {}
        result["sip_reg_num"] = from_none(self.sip_reg_num)
        result["completed_instalments"] = from_union([from_int, from_none], self.completed_instalments)
        result["created"] = from_union([lambda x: x.isoformat(), from_none], self.created)
        result["dividend_type"] = from_union([from_str, from_none], self.dividend_type)
        result["frequency"] = from_union([from_str, from_none], self.frequency)
        result["fund"] = from_union([from_str, from_none], self.fund)
        result["fund_source"] = from_union([from_str, from_none], self.fund_source)
        result["instalment_amount"] = from_union([from_int, from_none], self.instalment_amount)
        result["instalment_day"] = from_union([from_int, from_none], self.instalment_day)
        result["instalments"] = from_union([from_int, from_none], self.instalments)
        result["last_instalment"] = from_union([lambda x: x.isoformat(), from_none], self.last_instalment)
        result["next_instalment"] = from_union([lambda x: x.isoformat(), from_none], self.next_instalment)
        result["pending_instalments"] = from_union([from_int, from_none], self.pending_instalments)
        result["sip_id"] = from_union([from_str, from_none], self.sip_id)
        result["sip_type"] = from_union([from_str, from_none], self.sip_type)
        result["status"] = from_union([from_str, from_none], self.status)
        result["step_up"] = from_union([lambda x: to_class(StepUp, x), from_none], self.step_up)
        result["tag"] = from_union([from_str, from_none], self.tag)
        result["tradingsymbol"] = from_union([from_str, from_none], self.tradingsymbol)
        result["transaction_type"] = from_union([from_str, from_none], self.transaction_type)
        result["trigger_price"] = from_union([from_int, from_none], self.trigger_price)
        return result


@dataclass(slots=True)
class MFSIPInfo:
    data: Optional[Data] = None
    status: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'MFSIPInfo':
        assert isinstance(obj, dict)
        data = from_union([Data.from_dict, from_none], obj.get("data"))
        status = from_union([from_str, from_none], obj.get("status"))
        return MFSIPInfo(data, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["data"] = from_union([lambda x: to_class(Data, x), from_none], self.data)
        result["status"] = from_union([from_str, from_none], self.status)
        return result


def mfsip_info_from_dict(s: Any) -> MFSIPInfo:
    return MFSIPInfo.from_dict(s)


def mfsip_info_to_dict(x: MFSIPInfo) -> Any:
    return to_class(MFSIPInfo, x)
