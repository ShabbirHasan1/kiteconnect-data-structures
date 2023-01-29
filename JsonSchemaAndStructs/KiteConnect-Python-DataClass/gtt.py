from typing import Any, List
from dataclasses import dataclass, is_dataclass

@dataclass(slots=True)
class GttOrder:
    price: float
    quantity: int
    tradingsymbol: str
    transaction_type: str
    exchange: str = 'NFO'
    order_type: str = 'LIMIT'
    product: str = 'NRML'
    result: Any = None


@dataclass(slots=True)
class GttCondition:
    last_price: float
    tradingsymbol: str
    trigger_values: List[float]
    exchange: str = 'NFO'
    instrument_token: int = None


@dataclass(slots=True)
class Gtt:
    condition: ConditionModel
    orders: List[OrderModel]
    expires_at: str
    user_id: str = None
    id: int = None
    created_at: str = None
    updated_at: str = None
    parent_trigger: Any = None
    status: str = 'active'
    type: str = 'single'
    is_active: bool = False

    def __post_init__(self):
        self.is_active = True if self.status == 'active' else False
