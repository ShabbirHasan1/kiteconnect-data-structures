# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   orders = Orders.from_json! "{…}"
#   puts orders.data&.first.tags&.first
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Int    = Strict::Int
  Nil    = Strict::Nil
  Bool   = Strict::Bool
  Hash   = Strict::Hash
  String = Strict::String
end

class Iceberg < Dry::Struct
  attribute :leg,                Types::Int.optional
  attribute :leg_quantity,       Types::Int.optional
  attribute :legs,               Types::Int.optional
  attribute :remaining_quantity, Types::Int.optional
  attribute :total_quantity,     Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      leg:                d["leg"],
      leg_quantity:       d["leg_quantity"],
      legs:               d["legs"],
      remaining_quantity: d["remaining_quantity"],
      total_quantity:     d["total_quantity"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "leg"                => @leg,
      "leg_quantity"       => @leg_quantity,
      "legs"               => @legs,
      "remaining_quantity" => @remaining_quantity,
      "total_quantity"     => @total_quantity,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Meta < Dry::Struct
  attribute :iceberg, Iceberg.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      iceberg: d["iceberg"] ? Iceberg.from_dynamic!(d["iceberg"]) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "iceberg" => @iceberg&.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Datum < Dry::Struct
  attribute :average_price,             Types::Int.optional
  attribute :cancelled_quantity,        Types::Int.optional
  attribute :disclosed_quantity,        Types::Int.optional
  attribute :exchange,                  Types::String.optional
  attribute :exchange_order_id,         Types::String.optional.optional
  attribute :exchange_timestamp,        Types::String.optional.optional
  attribute :exchange_update_timestamp, Types::String.optional.optional
  attribute :filled_quantity,           Types::Int.optional
  attribute :guid,                      Types::String.optional
  attribute :instrument_token,          Types::Int.optional
  attribute :market_protection,         Types::Int.optional
  attribute :datum_meta,                Meta.optional
  attribute :modified,                  Types::Bool.optional
  attribute :order_id,                  Types::String.optional
  attribute :order_timestamp,           Types::String.optional
  attribute :order_type,                Types::String.optional
  attribute :parent_order_id,           Types::Nil.optional
  attribute :pending_quantity,          Types::Int.optional
  attribute :placed_by,                 Types::String.optional
  attribute :price,                     Types::Int.optional
  attribute :product,                   Types::String.optional
  attribute :quantity,                  Types::Int.optional
  attribute :status,                    Types::String.optional
  attribute :status_message,            Types::String.optional.optional
  attribute :status_message_raw,        Types::String.optional.optional
  attribute :tag,                       Types::String.optional.optional
  attribute :tags,                      Types.Array(Types::String).optional
  attribute :tradingsymbol,             Types::String.optional
  attribute :transaction_type,          Types::String.optional
  attribute :trigger_price,             Types::Int.optional
  attribute :validity,                  Types::String.optional
  attribute :validity_ttl,              Types::Int.optional
  attribute :variety,                   Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      average_price:             d["average_price"],
      cancelled_quantity:        d["cancelled_quantity"],
      disclosed_quantity:        d["disclosed_quantity"],
      exchange:                  d["exchange"],
      exchange_order_id:         d["exchange_order_id"],
      exchange_timestamp:        d["exchange_timestamp"],
      exchange_update_timestamp: d["exchange_update_timestamp"],
      filled_quantity:           d["filled_quantity"],
      guid:                      d["guid"],
      instrument_token:          d["instrument_token"],
      market_protection:         d["market_protection"],
      datum_meta:                d["meta"] ? Meta.from_dynamic!(d["meta"]) : nil,
      modified:                  d["modified"],
      order_id:                  d["order_id"],
      order_timestamp:           d["order_timestamp"],
      order_type:                d["order_type"],
      parent_order_id:           d["parent_order_id"],
      pending_quantity:          d["pending_quantity"],
      placed_by:                 d["placed_by"],
      price:                     d["price"],
      product:                   d["product"],
      quantity:                  d["quantity"],
      status:                    d["status"],
      status_message:            d["status_message"],
      status_message_raw:        d["status_message_raw"],
      tag:                       d["tag"],
      tags:                      d["tags"],
      tradingsymbol:             d["tradingsymbol"],
      transaction_type:          d["transaction_type"],
      trigger_price:             d["trigger_price"],
      validity:                  d["validity"],
      validity_ttl:              d["validity_ttl"],
      variety:                   d["variety"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "average_price"             => @average_price,
      "cancelled_quantity"        => @cancelled_quantity,
      "disclosed_quantity"        => @disclosed_quantity,
      "exchange"                  => @exchange,
      "exchange_order_id"         => @exchange_order_id,
      "exchange_timestamp"        => @exchange_timestamp,
      "exchange_update_timestamp" => @exchange_update_timestamp,
      "filled_quantity"           => @filled_quantity,
      "guid"                      => @guid,
      "instrument_token"          => @instrument_token,
      "market_protection"         => @market_protection,
      "meta"                      => @datum_meta&.to_dynamic,
      "modified"                  => @modified,
      "order_id"                  => @order_id,
      "order_timestamp"           => @order_timestamp,
      "order_type"                => @order_type,
      "parent_order_id"           => @parent_order_id,
      "pending_quantity"          => @pending_quantity,
      "placed_by"                 => @placed_by,
      "price"                     => @price,
      "product"                   => @product,
      "quantity"                  => @quantity,
      "status"                    => @status,
      "status_message"            => @status_message,
      "status_message_raw"        => @status_message_raw,
      "tag"                       => @tag,
      "tags"                      => @tags,
      "tradingsymbol"             => @tradingsymbol,
      "transaction_type"          => @transaction_type,
      "trigger_price"             => @trigger_price,
      "validity"                  => @validity,
      "validity_ttl"              => @validity_ttl,
      "variety"                   => @variety,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Orders < Dry::Struct
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
