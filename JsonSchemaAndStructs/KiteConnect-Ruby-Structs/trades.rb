# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   trades = Trades.from_json! "{…}"
#   puts trades.data&.first.average_price
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

class Datum < Dry::Struct
  attribute :average_price,      Types::Double.optional
  attribute :exchange,           Types::String.optional
  attribute :exchange_order_id,  Types::String.optional
  attribute :exchange_timestamp, Types::String.optional
  attribute :fill_timestamp,     Types::String.optional
  attribute :instrument_token,   Types::Int.optional
  attribute :order_id,           Types::String.optional
  attribute :order_timestamp,    Types::String.optional
  attribute :product,            Types::String.optional
  attribute :quantity,           Types::Int.optional
  attribute :trade_id,           Types::String.optional
  attribute :tradingsymbol,      Types::String.optional
  attribute :transaction_type,   Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      average_price:      d["average_price"],
      exchange:           d["exchange"],
      exchange_order_id:  d["exchange_order_id"],
      exchange_timestamp: d["exchange_timestamp"],
      fill_timestamp:     d["fill_timestamp"],
      instrument_token:   d["instrument_token"],
      order_id:           d["order_id"],
      order_timestamp:    d["order_timestamp"],
      product:            d["product"],
      quantity:           d["quantity"],
      trade_id:           d["trade_id"],
      tradingsymbol:      d["tradingsymbol"],
      transaction_type:   d["transaction_type"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "average_price"      => @average_price,
      "exchange"           => @exchange,
      "exchange_order_id"  => @exchange_order_id,
      "exchange_timestamp" => @exchange_timestamp,
      "fill_timestamp"     => @fill_timestamp,
      "instrument_token"   => @instrument_token,
      "order_id"           => @order_id,
      "order_timestamp"    => @order_timestamp,
      "product"            => @product,
      "quantity"           => @quantity,
      "trade_id"           => @trade_id,
      "tradingsymbol"      => @tradingsymbol,
      "transaction_type"   => @transaction_type,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Trades < Dry::Struct
  attribute :data,   Types.Array(Datum).optional
  attribute :status, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      data:   d["data"]&.map { |x| Datum.from_dynamic!(x) },
      status: d["status"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "data"   => @data&.map { |x| x.to_dynamic },
      "status" => @status,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
