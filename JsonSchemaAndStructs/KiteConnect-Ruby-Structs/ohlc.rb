# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   ohlc = Ohlc.from_json! "{…}"
#   puts ohlc.data&["…"].ohlc&.close
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Int    = Strict::Int
  Hash   = Strict::Hash
  String = Strict::String
  Double = Strict::Float | Strict::Int
end

class OhlcClass < Dry::Struct
  attribute :close,           Types::Double.optional
  attribute :high,            Types::Double.optional
  attribute :low,             Types::Double.optional
  attribute :ohlc_class_open, Types::Double.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      close:           d["close"],
      high:            d["high"],
      low:             d["low"],
      ohlc_class_open: d["open"],
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
      "open"  => @ohlc_class_open,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Datum < Dry::Struct
  attribute :instrument_token, Types::Int.optional
  attribute :last_price,       Types::Int.optional
  attribute :ohlc,             OhlcClass.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      instrument_token: d["instrument_token"],
      last_price:       d["last_price"],
      ohlc:             d["ohlc"] ? OhlcClass.from_dynamic!(d["ohlc"]) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "instrument_token" => @instrument_token,
      "last_price"       => @last_price,
      "ohlc"             => @ohlc&.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Ohlc < Dry::Struct
  attribute :data,   Types::Hash.meta(of: Datum).optional
  attribute :status, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      data:   Types::Hash.optional[d["data"]]&.map { |k, v| [k, Datum.from_dynamic!(v)] }&.to_h,
      status: d["status"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "data"   => @data&.map { |k, v| [k, v.to_dynamic] }.to_h,
      "status" => @status,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
