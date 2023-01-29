import re
from dataclasses import dataclass

@dataclass(slots=True)
class Position:
    average_price: float
    buy_m2m: float
    buy_price: float
    buy_quantity: int
    buy_value: float
    close_price: int
    day_buy_price: float
    day_buy_quantity: int
    day_buy_value: float
    day_sell_price: float
    day_sell_quantity: int
    day_sell_value: float
    exchange: str
    instrument_token: int
    last_price: float
    m2m: float
    multiplier: int
    overnight_quantity: int
    pnl: float
    product: str
    quantity: int
    sell_m2m: float
    sell_price: float
    sell_quantity: int
    sell_value: float
    realised: float
    tradingsymbol: str
    unrealised: float
    value: float
    pnl_percentage: float = 0
    underlying_instrument: str = ''

    def __post_init__(self):
        self.underlying_instrument = re.search('[A-Z]+', self.tradingsymbol)[0]
        if self.quantity != 0:
            self.pnl_percentage = (self.pnl / abs(self.average_price * self.quantity)) * 100

    def is_option(self):
        return True if self.tradingsymbol.endswith(('PE', 'CE')) else False


def TradingSymbolToMeta(tradingsymbol: str):
    TRADINGSYMBOL_META = re.compile(
        "(?P<instrument>[A-Z]+)(?P<datetime>[A-Z0-9]{5})(?P<type>[A-Z0-9]+)"
    )
    metadata = TRADINGSYMBOL_META.match(tradingsymbol)
    if not metadata:
        raise ValueError("Could not retrieve metadata for %s" % tradingsymbol)
    else:
        metadata_dict = metadata.groupdict()
    if (
        metadata_dict["type"].find("CE") != -1
        or metadata_dict["type"].find("CE") != -1  # noqa: E501
    ):  # noqa: E501
        metadata_dict["option_price"] = float(
            metadata_dict["type"].replace("CE", "").replace("PE", "")
        )
        metadata_dict["type"] = "OPT"
    elif "FUT" in metadata_dict["type"]:
        metadata_dict["type"] = "FUT"
    return metadata_dict
