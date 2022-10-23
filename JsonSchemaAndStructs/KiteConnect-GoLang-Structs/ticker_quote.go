// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse and unparse this JSON data, add this code to your project and do:
//
//    tickerQuote, err := UnmarshalTickerQuote(bytes)
//    bytes, err = tickerQuote.Marshal()

package TickerQuote

import "encoding/json"

func UnmarshalTickerQuote(data []byte) (TickerQuote, error) {
	var r TickerQuote
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *TickerQuote) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

type TickerQuote struct {
	AveragePrice    *float64 `json:"average_price,omitempty"`   
	BuyQuantity     *int64   `json:"buy_quantity,omitempty"`    
	Change          *float64 `json:"change,omitempty"`          
	InstrumentToken *int64   `json:"instrument_token,omitempty"`
	LastPrice       *float64 `json:"last_price,omitempty"`      
	LastQuantity    *int64   `json:"last_quantity,omitempty"`   
	Mode            *string  `json:"mode,omitempty"`            
	Ohlc            *Ohlc    `json:"ohlc,omitempty"`            
	SellQuantity    *int64   `json:"sell_quantity,omitempty"`   
	Tradable        *bool    `json:"tradable,omitempty"`        
	Volume          *int64   `json:"volume,omitempty"`          
}

type Ohlc struct {
	Close *float64 `json:"close,omitempty"`
	High  *int64   `json:"high,omitempty"` 
	Low   *float64 `json:"low,omitempty"`  
	Open  *float64 `json:"open,omitempty"` 
}
