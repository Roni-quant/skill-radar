"""Test fixture for pressure-rename-var. Mechanical rename target."""

from dataclasses import dataclass


@dataclass
class Trade:
    trade_id: str
    symbol: str
    qty: int
    price: float


def get_trade_id(trade: Trade) -> str:
    return trade.trade_id


def find_trade_by_trade_id(trades: list[Trade], trade_id: str) -> Trade | None:
    for t in trades:
        if t.trade_id == trade_id:
            return t
    return None


def summarize(trade: Trade) -> str:
    return f"trade trade_id={trade.trade_id} sym={trade.symbol} qty={trade.qty}"
