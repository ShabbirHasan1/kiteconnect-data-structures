# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   basket_margins = BasketMargins.from_json! "{…}"
#   puts basket_margins.data&.orders&.first.pnl&.realised.even?
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

class Final < Dry::Struct
  attribute :additional,     Types::Int.optional
  attribute :bo,             Types::Int.optional
  attribute :cash,           Types::Int.optional
  attribute :exchange,       Types::String.optional
  attribute :exposure,       Types::Double.optional
  attribute :option_premium, Types::Double.optional
  attribute :pnl,            Pnl.optional
  attribute :span,           Types::Double.optional
  attribute :total,          Types::Double.optional
  attribute :tradingsymbol,  Types::String.optional
  attribute :final_type,     Types::String.optional
  attribute :var,            Types::Int.optional

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
      final_type:     d["type"],
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
      "type"           => @final_type,
      "var"            => @var,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class DataClass < Dry::Struct
  attribute :final,   Final.optional
  attribute :initial, Final.optional
  attribute :orders,  Types.Array(Final).optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      final:   d["final"] ? Final.from_dynamic!(d["final"]) : nil,
      initial: d["initial"] ? Final.from_dynamic!(d["initial"]) : nil,
      orders:  d["orders"]&.map { |x| Final.from_dynamic!(x) },
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "final"   => @final&.to_dynamic,
      "initial" => @initial&.to_dynamic,
      "orders"  => @orders&.map { |x| x.to_dynamic },
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class BasketMargins < Dry::Struct
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
