# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   order_margins = OrderMargins.from_json! "{…}"
#   puts order_margins.data&.first.pnl&.realised.even?
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

class Pnl < Dry::Struct
  attribute :realised,   Types::Int.optional
  attribute :unrealised, Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      realised:   d["realised"],
      unrealised: d["unrealised"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "realised"   => @realised,
      "unrealised" => @unrealised,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Datum < Dry::Struct
  attribute :additional,     Types::Int.optional
  attribute :bo,             Types::Int.optional
  attribute :cash,           Types::Int.optional
  attribute :exchange,       Types::String.optional
  attribute :exposure,       Types::Int.optional
  attribute :option_premium, Types::Int.optional
  attribute :pnl,            Pnl.optional
  attribute :span,           Types::Int.optional
  attribute :total,          Types::Double.optional
  attribute :tradingsymbol,  Types::String.optional
  attribute :datum_type,     Types::String.optional
  attribute :var,            Types::Double.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      additional:     d["additional"],
      bo:             d["bo"],
      cash:           d["cash"],
      exchange:       d["exchange"],
      exposure:       d["exposure"],
      option_premium: d["option_premium"],
      pnl:            d["pnl"] ? Pnl.from_dynamic!(d["pnl"]) : nil,
      span:           d["span"],
      total:          d["total"],
      tradingsymbol:  d["tradingsymbol"],
      datum_type:     d["type"],
      var:            d["var"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "additional"     => @additional,
      "bo"             => @bo,
      "cash"           => @cash,
      "exchange"       => @exchange,
      "exposure"       => @exposure,
      "option_premium" => @option_premium,
      "pnl"            => @pnl&.to_dynamic,
      "span"           => @span,
      "total"          => @total,
      "tradingsymbol"  => @tradingsymbol,
      "type"           => @datum_type,
      "var"            => @var,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class OrderMargins < Dry::Struct
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
