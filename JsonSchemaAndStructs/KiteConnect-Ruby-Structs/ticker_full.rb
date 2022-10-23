# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   ticker_full = TickerFull.from_json! "{…}"
#   puts ticker_full.ohlc&.close
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

class Buy < Dry::Struct
  attribute :orders,   Types::Int.optional
  attribute :price,    Types::Double.optional
  attribute :quantity, Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      orders:   d["orders"],
      price:    d["price"],
      quantity: d["quantity"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "orders"   => @orders,
      "price"    => @price,
      "quantity" => @quantity,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Depth < Dry::Struct
  attribute :buy,  Types.Array(Buy).optional
  attribute :sell, Types.Array(Buy).optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      buy:  d["buy"]&.map { |x| Buy.from_dynamic!(x) },
      sell: d["sell"]&.map { |x| Buy.from_dynamic!(x) },
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "buy"  => @buy&.map { |x| x.to_dynamic },
      "sell" => @sell&.map { |x| x.to_dynamic },
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
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

class TickerFull < Dry::Struct
  attribute :average_price,    Types::Double.optional
  attribute :buy_quantity,     Types::Int.optional
  attribute :change,           Types::Double.optional
  attribute :depth,            Depth.optional
  attribute :instrument_token, Types::Int.optional
  attribute :last_price,       Types::Double.optional
  attribute :last_quantity,    Types::Int.optional
  attribute :last_trade_time,  Types::String.optional
  attribute :mode,             Types::String.optional
  attribute :ohlc,             Ohlc.optional
  attribute :oi,               Types::Int.optional
  attribute :oi_day_high,      Types::Int.optional
  attribute :oi_day_low,       Types::Int.optional
  attribute :sell_quantity,    Types::Int.optional
  attribute :timestamp,        Types::String.optional
  attribute :tradable,         Types::Bool.optional
  attribute :volume,           Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      average_price:    d["average_price"],
      buy_quantity:     d["buy_quantity"],
      change:           d["change"],
      depth:            d["depth"] ? Depth.from_dynamic!(d["depth"]) : nil,
      instrument_token: d["instrument_token"],
      last_price:       d["last_price"],
      last_quantity:    d["last_quantity"],
      last_trade_time:  d["last_trade_time"],
      mode:             d["mode"],
      ohlc:             d["ohlc"] ? Ohlc.from_dynamic!(d["ohlc"]) : nil,
      oi:               d["oi"],
      oi_day_high:      d["oi_day_high"],
      oi_day_low:       d["oi_day_low"],
      sell_quantity:    d["sell_quantity"],
      timestamp:        d["timestamp"],
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
      "depth"            => @depth&.to_dynamic,
      "instrument_token" => @instrument_token,
      "last_price"       => @last_price,
      "last_quantity"    => @last_quantity,
      "last_trade_time"  => @last_trade_time,
      "mode"             => @mode,
      "ohlc"             => @ohlc&.to_dynamic,
      "oi"               => @oi,
      "oi_day_high"      => @oi_day_high,
      "oi_day_low"       => @oi_day_low,
      "sell_quantity"    => @sell_quantity,
      "timestamp"        => @timestamp,
      "tradable"         => @tradable,
      "volume"           => @volume,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
