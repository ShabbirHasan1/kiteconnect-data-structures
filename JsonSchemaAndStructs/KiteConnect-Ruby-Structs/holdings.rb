# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   holdings = Holdings.from_json! "{…}"
#   puts holdings.data&.first.authorised_date
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

class Datum < Dry::Struct
  attribute :authorised_date,       Types::String.optional
  attribute :authorised_quantity,   Types::Int.optional
  attribute :average_price,         Types::Double.optional
  attribute :close_price,           Types::Double.optional
  attribute :collateral_quantity,   Types::Int.optional
  attribute :collateral_type,       Types::String.optional
  attribute :day_change,            Types::Double.optional
  attribute :day_change_percentage, Types::Double.optional
  attribute :discrepancy,           Types::Bool.optional
  attribute :exchange,              Types::String.optional
  attribute :instrument_token,      Types::Int.optional
  attribute :isin,                  Types::String.optional
  attribute :last_price,            Types::Double.optional
  attribute :opening_quantity,      Types::Int.optional
  attribute :pnl,                   Types::Double.optional
  attribute :price,                 Types::Int.optional
  attribute :product,               Types::String.optional
  attribute :quantity,              Types::Int.optional
  attribute :realised_quantity,     Types::Int.optional
  attribute :t1_quantity,           Types::Int.optional
  attribute :tradingsymbol,         Types::String.optional
  attribute :used_quantity,         Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      authorised_date:       d["authorised_date"],
      authorised_quantity:   d["authorised_quantity"],
      average_price:         d["average_price"],
      close_price:           d["close_price"],
      collateral_quantity:   d["collateral_quantity"],
      collateral_type:       d["collateral_type"],
      day_change:            d["day_change"],
      day_change_percentage: d["day_change_percentage"],
      discrepancy:           d["discrepancy"],
      exchange:              d["exchange"],
      instrument_token:      d["instrument_token"],
      isin:                  d["isin"],
      last_price:            d["last_price"],
      opening_quantity:      d["opening_quantity"],
      pnl:                   d["pnl"],
      price:                 d["price"],
      product:               d["product"],
      quantity:              d["quantity"],
      realised_quantity:     d["realised_quantity"],
      t1_quantity:           d["t1_quantity"],
      tradingsymbol:         d["tradingsymbol"],
      used_quantity:         d["used_quantity"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "authorised_date"       => @authorised_date,
      "authorised_quantity"   => @authorised_quantity,
      "average_price"         => @average_price,
      "close_price"           => @close_price,
      "collateral_quantity"   => @collateral_quantity,
      "collateral_type"       => @collateral_type,
      "day_change"            => @day_change,
      "day_change_percentage" => @day_change_percentage,
      "discrepancy"           => @discrepancy,
      "exchange"              => @exchange,
      "instrument_token"      => @instrument_token,
      "isin"                  => @isin,
      "last_price"            => @last_price,
      "opening_quantity"      => @opening_quantity,
      "pnl"                   => @pnl,
      "price"                 => @price,
      "product"               => @product,
      "quantity"              => @quantity,
      "realised_quantity"     => @realised_quantity,
      "t1_quantity"           => @t1_quantity,
      "tradingsymbol"         => @tradingsymbol,
      "used_quantity"         => @used_quantity,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Holdings < Dry::Struct
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
