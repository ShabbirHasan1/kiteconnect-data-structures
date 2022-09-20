# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   mf_holdings = MFHoldings.from_json! "{…}"
#   puts mf_holdings.data&.first.average_price
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
  attribute :average_price,    Types::Double.optional
  attribute :folio,            Types::String.optional
  attribute :fund,             Types::String.optional
  attribute :last_price,       Types::Double.optional
  attribute :last_price_date,  Types::String.optional
  attribute :pledged_quantity, Types::Int.optional
  attribute :pnl,              Types::Int.optional
  attribute :quantity,         Types::Double.optional
  attribute :tradingsymbol,    Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      average_price:    d["average_price"],
      folio:            d["folio"],
      fund:             d["fund"],
      last_price:       d["last_price"],
      last_price_date:  d["last_price_date"],
      pledged_quantity: d["pledged_quantity"],
      pnl:              d["pnl"],
      quantity:         d["quantity"],
      tradingsymbol:    d["tradingsymbol"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "average_price"    => @average_price,
      "folio"            => @folio,
      "fund"             => @fund,
      "last_price"       => @last_price,
      "last_price_date"  => @last_price_date,
      "pledged_quantity" => @pledged_quantity,
      "pnl"              => @pnl,
      "quantity"         => @quantity,
      "tradingsymbol"    => @tradingsymbol,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class MFHoldings < Dry::Struct
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
