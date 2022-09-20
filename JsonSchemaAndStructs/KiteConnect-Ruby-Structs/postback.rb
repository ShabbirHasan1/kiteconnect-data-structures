# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   postback = Postback.from_json! "{…}"
#   puts postback.postback_meta
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Int    = Strict::Int
  Nil    = Strict::Nil
  Hash   = Strict::Hash
  String = Strict::String
end

class Meta < Dry::Struct

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Postback < Dry::Struct
  attribute :app_id,                    Types::Int.optional
  attribute :average_price,             Types::Int.optional
  attribute :cancelled_quantity,        Types::Int.optional
  attribute :checksum,                  Types::String.optional
  attribute :disclosed_quantity,        Types::Int.optional
  attribute :exchange,                  Types::String.optional
  attribute :exchange_order_id,         Types::String.optional
  attribute :exchange_timestamp,        Types::String.optional
  attribute :exchange_update_timestamp, Types::String.optional
  attribute :filled_quantity,           Types::Int.optional
  attribute :guid,                      Types::String.optional
  attribute :instrument_token,          Types::Int.optional
  attribute :market_protection,         Types::Int.optional
  attribute :postback_meta,             Meta.optional
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
  attribute :status_message,            Types::Nil.optional
  attribute :status_message_raw,        Types::Nil.optional
  attribute :tag,                       Types::Nil.optional
  attribute :tradingsymbol,             Types::String.optional
  attribute :transaction_type,          Types::String.optional
  attribute :trigger_price,             Types::Int.optional
  attribute :unfilled_quantity,         Types::Int.optional
  attribute :user_id,                   Types::String.optional
  attribute :validity,                  Types::String.optional
  attribute :variety,                   Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      app_id:                    d["app_id"],
      average_price:             d["average_price"],
      cancelled_quantity:        d["cancelled_quantity"],
      checksum:                  d["checksum"],
      disclosed_quantity:        d["disclosed_quantity"],
      exchange:                  d["exchange"],
      exchange_order_id:         d["exchange_order_id"],
      exchange_timestamp:        d["exchange_timestamp"],
      exchange_update_timestamp: d["exchange_update_timestamp"],
      filled_quantity:           d["filled_quantity"],
      guid:                      d["guid"],
      instrument_token:          d["instrument_token"],
      market_protection:         d["market_protection"],
      postback_meta:             d["meta"] ? Meta.from_dynamic!(d["meta"]) : nil,
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
      tradingsymbol:             d["tradingsymbol"],
      transaction_type:          d["transaction_type"],
      trigger_price:             d["trigger_price"],
      unfilled_quantity:         d["unfilled_quantity"],
      user_id:                   d["user_id"],
      validity:                  d["validity"],
      variety:                   d["variety"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "app_id"                    => @app_id,
      "average_price"             => @average_price,
      "cancelled_quantity"        => @cancelled_quantity,
      "checksum"                  => @checksum,
      "disclosed_quantity"        => @disclosed_quantity,
      "exchange"                  => @exchange,
      "exchange_order_id"         => @exchange_order_id,
      "exchange_timestamp"        => @exchange_timestamp,
      "exchange_update_timestamp" => @exchange_update_timestamp,
      "filled_quantity"           => @filled_quantity,
      "guid"                      => @guid,
      "instrument_token"          => @instrument_token,
      "market_protection"         => @market_protection,
      "meta"                      => @postback_meta&.to_dynamic,
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
      "tradingsymbol"             => @tradingsymbol,
      "transaction_type"          => @transaction_type,
      "trigger_price"             => @trigger_price,
      "unfilled_quantity"         => @unfilled_quantity,
      "user_id"                   => @user_id,
      "validity"                  => @validity,
      "variety"                   => @variety,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
