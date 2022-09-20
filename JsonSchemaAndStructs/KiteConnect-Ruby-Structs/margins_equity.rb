# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   margins_equity = MarginsEquity.from_json! "{…}"
#   puts margins_equity.data&.utilised&["…"]
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

class Available < Dry::Struct
  attribute :adhoc_margin,    Types::Int.optional
  attribute :cash,            Types::Double.optional
  attribute :collateral,      Types::Int.optional
  attribute :intraday_payin,  Types::Int.optional
  attribute :live_balance,    Types::Double.optional
  attribute :opening_balance, Types::Double.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      adhoc_margin:    d["adhoc_margin"],
      cash:            d["cash"],
      collateral:      d["collateral"],
      intraday_payin:  d["intraday_payin"],
      live_balance:    d["live_balance"],
      opening_balance: d["opening_balance"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "adhoc_margin"    => @adhoc_margin,
      "cash"            => @cash,
      "collateral"      => @collateral,
      "intraday_payin"  => @intraday_payin,
      "live_balance"    => @live_balance,
      "opening_balance" => @opening_balance,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class DataClass < Dry::Struct
  attribute :available, Available.optional
  attribute :enabled,   Types::Bool.optional
  attribute :net,       Types::Double.optional
  attribute :utilised,  Types::Hash.meta(of: Types::Double).optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      available: d["available"] ? Available.from_dynamic!(d["available"]) : nil,
      enabled:   d["enabled"],
      net:       d["net"],
      utilised:  Types::Hash.optional[d["utilised"]]&.map { |k, v| [k, Types::Double[v]] }&.to_h,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "available" => @available&.to_dynamic,
      "enabled"   => @enabled,
      "net"       => @net,
      "utilised"  => @utilised,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class MarginsEquity < Dry::Struct
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
