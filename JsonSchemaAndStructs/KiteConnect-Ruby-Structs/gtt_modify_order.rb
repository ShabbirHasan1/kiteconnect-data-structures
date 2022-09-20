# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   gtt_modify_order = GttModifyOrder.from_json! "{…}"
#   puts gtt_modify_order.data&.trigger_id.even?
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
end

class DataClass < Dry::Struct
  attribute :trigger_id, Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      trigger_id: d["trigger_id"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "trigger_id" => @trigger_id,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GttModifyOrder < Dry::Struct
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
