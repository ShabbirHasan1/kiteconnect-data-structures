# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   ticker_quote = TickerQuote.from_json! "{…}"
#   puts ticker_quote.ohlc&.close
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
  attribute :close,     Types::Double.optional
  attribute :high,      Types::Int.optional
  attribute :low,       Types::Double.optional
  attribute :ohlc_open, Types::Double.optional

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

class TickerQuote < Dry::Struct
  attribute :average_price,    Types::Double.optional
  attribute :buy_quantity,     Types::Int.optional
  attribute :change,           Types::Double.optional
  attribute :instrument_token, Types::Int.optional
  attribute :last_price,       Types::Double.optional
  attribute :last_quantity,    Types::Int.optional
  attribute :mode,             Types::String.optional
  attribute :ohlc,             Ohlc.optional
  attribute :sell_quantity,    Types::Int.optional
  attribute :tradable,         Types::Bool.optional
  attribute :volume,           Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      average_price:    d["average_price"],
      buy_quantity:     d["buy_quantity"],
      change:           d["change"],
      instrument_token: d["instrument_token"],
      last_price:       d["last_price"],
      last_quantity:    d["last_quantity"],
      mode:             d["mode"],
      ohlc:             d["ohlc"] ? Ohlc.from_dynamic!(d["ohlc"]) : nil,
      sell_quantity:    d["sell_quantity"],
      tradable:         d["tradable"],
      volume:           d["volume"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "average_price"    => @average_price,
      "buy_quantity"     => @buy_quantity,
      "change"           => @change,
      "instrument_token" => @instrument_token,
      "last_price"       => @last_price,
      "last_quantity"    => @last_quantity,
      "mode"             => @mode,
      "ohlc"             => @ohlc&.to_dynamic,
      "sell_quantity"    => @sell_quantity,
      "tradable"         => @tradable,
      "volume"           => @volume,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
