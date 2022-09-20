# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   ticker_quote = TickerQuote.from_json! "[…]"
#   puts ticker_quote.first.ohlc&.close.even?
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Int    = Strict::Int
  Bool   = Strict::Bool
  Hash   = Strict::Hash
  String = Strict::String
  Double = Strict::Float | Strict::Int
end

class Ohlc < Dry::Struct
  attribute :close,     Types::Int.optional
  attribute :high,      Types::Int.optional
  attribute :low,       Types::Int.optional
  attribute :ohlc_open, Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      close:     d["close"],
      high:      d["high"],
      low:       d["low"],
      ohlc_open: d["open"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "close" => @close,
      "high"  => @high,
      "low"   => @low,
      "open"  => @ohlc_open,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class TriggerRangeElement < Dry::Struct
  attribute :average_traded_price, Types::Double.optional
  attribute :change,               Types::Double.optional
  attribute :instrument_token,     Types::Int.optional
  attribute :last_price,           Types::Int.optional
  attribute :last_traded_quantity, Types::Int.optional
  attribute :mode,                 Types::String.optional
  attribute :ohlc,                 Ohlc.optional
  attribute :total_buy_quantity,   Types::Int.optional
  attribute :total_sell_quantity,  Types::Int.optional
  attribute :tradable,             Types::Bool.optional
  attribute :volume_traded,        Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      average_traded_price: d["average_traded_price"],
      change:               d["change"],
      instrument_token:     d["instrument_token"],
      last_price:           d["last_price"],
      last_traded_quantity: d["last_traded_quantity"],
      mode:                 d["mode"],
      ohlc:                 d["ohlc"] ? Ohlc.from_dynamic!(d["ohlc"]) : nil,
      total_buy_quantity:   d["total_buy_quantity"],
      total_sell_quantity:  d["total_sell_quantity"],
      tradable:             d["tradable"],
      volume_traded:        d["volume_traded"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "average_traded_price" => @average_traded_price,
      "change"               => @change,
      "instrument_token"     => @instrument_token,
      "last_price"           => @last_price,
      "last_traded_quantity" => @last_traded_quantity,
      "mode"                 => @mode,
      "ohlc"                 => @ohlc&.to_dynamic,
      "total_buy_quantity"   => @total_buy_quantity,
      "total_sell_quantity"  => @total_sell_quantity,
      "tradable"             => @tradable,
      "volume_traded"        => @volume_traded,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class TickerQuote
  def self.from_json!(json)
    ticker_quote = JSON.parse(json, quirks_mode: true).map { |x| TriggerRangeElement.from_dynamic!(x) }
    ticker_quote.define_singleton_method(:to_json) do
      JSON.generate(self.map { |x| x.to_dynamic })
    end
    ticker_quote
  end
end
