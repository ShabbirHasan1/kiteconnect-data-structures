# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   ticker_ltp = TickerLtp.from_json! "[…]"
#   puts ticker_ltp.first.instrument_token.even?
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
end

class TriggerRangeElement < Dry::Struct
  attribute :instrument_token, Types::Int.optional
  attribute :last_price,       Types::Int.optional
  attribute :mode,             Types::String.optional
  attribute :tradable,         Types::Bool.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      instrument_token: d["instrument_token"],
      last_price:       d["last_price"],
      mode:             d["mode"],
      tradable:         d["tradable"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "instrument_token" => @instrument_token,
      "last_price"       => @last_price,
      "mode"             => @mode,
      "tradable"         => @tradable,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class TickerLtp
  def self.from_json!(json)
    ticker_ltp = JSON.parse(json, quirks_mode: true).map { |x| TriggerRangeElement.from_dynamic!(x) }
    ticker_ltp.define_singleton_method(:to_json) do
      JSON.generate(self.map { |x| x.to_dynamic })
    end
    ticker_ltp
  end
end
