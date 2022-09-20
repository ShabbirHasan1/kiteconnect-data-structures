# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   instruments_all = InstrumentsAll.from_json! "[…]"
#   puts instruments_all.first.exchange == Exchange::Bse
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Int            = Strict::Int
  Hash           = Strict::Hash
  String         = Strict::String
  Double         = Strict::Float | Strict::Int
  Exchange       = Strict::String.enum("BSE", "NFO", "NSE")
  InstrumentType = Strict::String.enum("CE", "EQ", "PE")
  Segment        = Strict::String.enum("BSE", "NFO-OPT", "NSE")
end

module Exchange
  Bse = "BSE"
  Nfo = "NFO"
  Nse = "NSE"
end

module InstrumentType
  Ce = "CE"
  Eq = "EQ"
  PE = "PE"
end

module Segment
  Bse    = "BSE"
  NfoOpt = "NFO-OPT"
  Nse    = "NSE"
end

class InstrumentsAllElement < Dry::Struct
  attribute :exchange,                     Types::Exchange.optional
  attribute :exchange_token,               Types::Int.optional
  attribute :expiry,                       Types::String.optional
  attribute :instrument_token,             Types::Int.optional
  attribute :instrument_type,              Types::InstrumentType.optional
  attribute :last_price,                   Types::Double.optional
  attribute :lot_size,                     Types::Int.optional
  attribute :instruments_all_element_name, Types::String.optional
  attribute :segment,                      Types::Segment.optional
  attribute :strike,                       Types::Int.optional
  attribute :tick_size,                    Types::Double.optional
  attribute :tradingsymbol,                Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      exchange:                     d["exchange"],
      exchange_token:               d["exchange_token"],
      expiry:                       d["expiry"],
      instrument_token:             d["instrument_token"],
      instrument_type:              d["instrument_type"],
      last_price:                   d["last_price"],
      lot_size:                     d["lot_size"],
      instruments_all_element_name: d["name"],
      segment:                      d["segment"],
      strike:                       d["strike"],
      tick_size:                    d["tick_size"],
      tradingsymbol:                d["tradingsymbol"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "exchange"         => @exchange,
      "exchange_token"   => @exchange_token,
      "expiry"           => @expiry,
      "instrument_token" => @instrument_token,
      "instrument_type"  => @instrument_type,
      "last_price"       => @last_price,
      "lot_size"         => @lot_size,
      "name"             => @instruments_all_element_name,
      "segment"          => @segment,
      "strike"           => @strike,
      "tick_size"        => @tick_size,
      "tradingsymbol"    => @tradingsymbol,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class InstrumentsAll
  def self.from_json!(json)
    instruments_all = JSON.parse(json, quirks_mode: true).map { |x| InstrumentsAllElement.from_dynamic!(x) }
    instruments_all.define_singleton_method(:to_json) do
      JSON.generate(self.map { |x| x.to_dynamic })
    end
    instruments_all
  end
end
