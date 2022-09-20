# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   holdings_auth = HoldingsAuth.from_json! "{…}"
#   puts holdings_auth.data&.request_id
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Hash   = Strict::Hash
  String = Strict::String
end

class DataClass < Dry::Struct
  attribute :request_id, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      request_id: d["request_id"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "request_id" => @request_id,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class HoldingsAuth < Dry::Struct
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
