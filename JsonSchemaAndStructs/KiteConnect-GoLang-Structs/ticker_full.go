// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse and unparse this JSON data, add this code to your project and do:
//
//    tickerFull, err := UnmarshalTickerFull(bytes)
//    bytes, err = tickerFull.Marshal()

package TickerFull

import "encoding/json"

func UnmarshalTickerFull(data []byte) (TickerFull, error) {
	var r TickerFull
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *TickerFull) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

type TickerFull struct {
	AveragePrice    *float64 `json:"average_price,omitempty"`   
	BuyQuantity     *int64   `json:"buy_quantity,omitempty"`    
	Change          *float64 `json:"change,omitempty"`          
	Depth           *Depth   `json:"depth,omitempty"`           
	InstrumentToken *int64   `json:"instrument_token,omitempty"`
	LastPrice       *float64 `json:"last_price,omitempty"`      
	LastQuantity    *int64   `json:"last_quantity,omitempty"`   
	LastTradeTime   *string  `json:"last_trade_time,omitempty"` 
	Mode            *string  `json:"mode,omitempty"`            
	Ohlc            *Ohlc    `json:"ohlc,omitempty"`            
	Oi              *int64   `json:"oi,omitempty"`              
	OiDayHigh       *int64   `json:"oi_day_high,omitempty"`     
	OiDayLow        *int64   `json:"oi_day_low,omitempty"`      
	SellQuantity    *int64   `json:"sell_quantity,omitempty"`   
	Timestamp       *string  `json:"timestamp,omitempty"`       
	Tradable        *bool    `json:"tradable,omitempty"`        
	Volume          *int64   `json:"volume,omitempty"`          
}

type Depth struct {
	Buy  []Buy `json:"buy,omitempty"` 
	Sell []Buy `json:"sell,omitempty"`
}

type Buy struct {
	Orders   *int64   `json:"orders,omitempty"`  
	Price    *float64 `json:"price,omitempty"`   
	Quantity *int64   `json:"quantity,omitempty"`
}

type Ohlc struct {
	Close *float64 `json:"close,omitempty"`
	High  *int64   `json:"high,omitempty"` 
	Low   *float64 `json:"low,omitempty"`  
	Open  *float64 `json:"open,omitempty"` 
}
