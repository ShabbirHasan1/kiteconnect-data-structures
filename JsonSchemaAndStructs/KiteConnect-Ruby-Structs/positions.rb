# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   positions = Positions.from_json! "{…}"
#   puts positions.data&.net&.first.average_price
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

class Day < Dry::Struct
  attribute :average_price,      Types::Double.optional
  attribute :buy_m2_m,           Types::Int.optional
  attribute :buy_price,          Types::Double.optional
  attribute :buy_quantity,       Types::Int.optional
  attribute :buy_value,          Types::Int.optional
  attribute :close_price,        Types::Int.optional
  attribute :day_buy_price,      Types::Double.optional
  attribute :day_buy_quantity,   Types::Int.optional
  attribute :day_buy_value,      Types::Int.optional
  attribute :day_sell_price,     Types::Int.optional
  attribute :day_sell_quantity,  Types::Int.optional
  attribute :day_sell_value,     Types::Int.optional
  attribute :exchange,           Types::String.optional
  attribute :instrument_token,   Types::Int.optional
  attribute :last_price,         Types::Double.optional
  attribute :m2_m,               Types::Int.optional
  attribute :multiplier,         Types::Int.optional
  attribute :overnight_quantity, Types::Int.optional
  attribute :pnl,                Types::Int.optional
  attribute :product,            Types::String.optional
  attribute :quantity,           Types::Int.optional
  attribute :realised,           Types::Int.optional
  attribute :sell_m2_m,          Types::Int.optional
  attribute :sell_price,         Types::Int.optional
  attribute :sell_quantity,      Types::Int.optional
  attribute :sell_value,         Types::Int.optional
  attribute :tradingsymbol,      Types::String.optional
  attribute :unrealised,         Types::Int.optional
  attribute :value,              Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      average_price:      d["average_price"],
      buy_m2_m:           d["buy_m2m"],
      buy_price:          d["buy_price"],
      buy_quantity:       d["buy_quantity"],
      buy_value:          d["buy_value"],
      close_price:        d["close_price"],
      day_buy_price:      d["day_buy_price"],
      day_buy_quantity:   d["day_buy_quantity"],
      day_buy_value:      d["day_buy_value"],
      day_sell_price:     d["day_sell_price"],
      day_sell_quantity:  d["day_sell_quantity"],
      day_sell_value:     d["day_sell_value"],
      exchange:           d["exchange"],
      instrument_token:   d["instrument_token"],
      last_price:         d["last_price"],
      m2_m:               d["m2m"],
      multiplier:         d["multiplier"],
      overnight_quantity: d["overnight_quantity"],
      pnl:                d["pnl"],
      product:            d["product"],
      quantity:           d["quantity"],
      realised:           d["realised"],
      sell_m2_m:          d["sell_m2m"],
      sell_price:         d["sell_price"],
      sell_quantity:      d["sell_quantity"],
      sell_value:         d["sell_value"],
      tradingsymbol:      d["tradingsymbol"],
      unrealised:         d["unrealised"],
      value:              d["value"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "average_price"      => @average_price,
      "buy_m2m"            => @buy_m2_m,
      "buy_price"          => @buy_price,
      "buy_quantity"       => @buy_quantity,
      "buy_value"          => @buy_value,
      "close_price"        => @close_price,
      "day_buy_price"      => @day_buy_price,
      "day_buy_quantity"   => @day_buy_quantity,
      "day_buy_value"      => @day_buy_value,
      "day_sell_price"     => @day_sell_price,
      "day_sell_quantity"  => @day_sell_quantity,
      "day_sell_value"     => @day_sell_value,
      "exchange"           => @exchange,
      "instrument_token"   => @instrument_token,
      "last_price"         => @last_price,
      "m2m"                => @m2_m,
      "multiplier"         => @multiplier,
      "overnight_quantity" => @overnight_quantity,
      "pnl"                => @pnl,
      "product"            => @product,
      "quantity"           => @quantity,
      "realised"           => @realised,
      "sell_m2m"           => @sell_m2_m,
      "sell_price"         => @sell_price,
      "sell_quantity"      => @sell_quantity,
      "sell_value"         => @sell_value,
      "tradingsymbol"      => @tradingsymbol,
      "unrealised"         => @unrealised,
      "value"              => @value,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class DataClass < Dry::Struct
  attribute :day, Types.Array(Day).optional
  attribute :net, Types.Array(Day).optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      day: d["day"]&.map { |x| Day.from_dynamic!(x) },
      net: d["net"]&.map { |x| Day.from_dynamic!(x) },
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "day" => @day&.map { |x| x.to_dynamic },
      "net" => @net&.map { |x| x.to_dynamic },
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Positions < Dry::Struct
  attribute :data,   DataClass.optional
  attribute :status, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      data:   d["data"] ? DataClass.from_dynamic!(d["data"]) : nil,
      status: d["status"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "data"   => @data&.to_dynamic,
      "status" => @status,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
