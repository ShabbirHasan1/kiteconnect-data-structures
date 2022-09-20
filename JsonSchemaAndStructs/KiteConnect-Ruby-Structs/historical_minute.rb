# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   historical_minute = HistoricalMinute.from_json! "{…}"
#   puts historical_minute.data&.candles&.first.first
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Hash   = Strict::Hash
  String = Strict::String
  Double = Strict::Float | Strict::Int
end

class Candle < Dry::Struct
  attribute :double, Types::Double.optional
  attribute :string, Types::String.optional

  def self.from_dynamic!(d)
    if schema[:double].right.valid? d
      return new(double: d, string: nil)
    end
    if schema[:string].right.valid? d
      return new(string: d, double: nil)
    end
    raise "Invalid union"
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    if @double != nil
      @double
    elsif @string != nil
      @string
    end
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class DataClass < Dry::Struct
  attribute :candles, Types.Array(Types.Array(Types.Instance(Candle))).optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      candles: d["candles"]&.map { |x| x.map { |x| Candle.from_dynamic!(x) } },
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "candles" => @candles&.map { |x| x.map { |x| x.to_dynamic } },
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class HistoricalMinute < Dry::Struct
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
