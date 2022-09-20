# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   gtt_get_orders = GttGetOrders.from_json! "{…}"
#   puts gtt_get_orders.data&.first.orders&.first.exchange
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
  Double = Strict::Float | Strict::Int
end

class Condition < Dry::Struct
  attribute :exchange,         Types::String.optional
  attribute :instrument_token, Types::Int.optional
  attribute :last_price,       Types::Double.optional
  attribute :tradingsymbol,    Types::String.optional
  attribute :trigger_values,   Types.Array(Types::Double).optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      exchange:         d["exchange"],
      instrument_token: d["instrument_token"],
      last_price:       d["last_price"],
      tradingsymbol:    d["tradingsymbol"],
      trigger_values:   d["trigger_values"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "exchange"         => @exchange,
      "instrument_token" => @instrument_token,
      "last_price"       => @last_price,
      "tradingsymbol"    => @tradingsymbol,
      "trigger_values"   => @trigger_values,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
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

class OrderResult < Dry::Struct
  attribute :order_id,         Types::String.optional
  attribute :rejection_reason, Types::String.optional
  attribute :status,           Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      order_id:         d["order_id"],
      rejection_reason: d["rejection_reason"],
      status:           d["status"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "order_id"         => @order_id,
      "rejection_reason" => @rejection_reason,
      "status"           => @status,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Result < Dry::Struct
  attribute :account_id,       Types::String.optional
  attribute :exchange,         Types::String.optional
  attribute :result_meta,      Types::String.optional
  attribute :order_result,     OrderResult.optional
  attribute :order_type,       Types::String.optional
  attribute :price,            Types::Int.optional
  attribute :product,          Types::String.optional
  attribute :quantity,         Types::Int.optional
  attribute :timestamp,        Types::String.optional
  attribute :tradingsymbol,    Types::String.optional
  attribute :transaction_type, Types::String.optional
  attribute :triggered_at,     Types::Double.optional
  attribute :validity,         Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      account_id:       d["account_id"],
      exchange:         d["exchange"],
      result_meta:      d["meta"],
      order_result:     d["order_result"] ? OrderResult.from_dynamic!(d["order_result"]) : nil,
      order_type:       d["order_type"],
      price:            d["price"],
      product:          d["product"],
      quantity:         d["quantity"],
      timestamp:        d["timestamp"],
      tradingsymbol:    d["tradingsymbol"],
      transaction_type: d["transaction_type"],
      triggered_at:     d["triggered_at"],
      validity:         d["validity"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "account_id"       => @account_id,
      "exchange"         => @exchange,
      "meta"             => @result_meta,
      "order_result"     => @order_result&.to_dynamic,
      "order_type"       => @order_type,
      "price"            => @price,
      "product"          => @product,
      "quantity"         => @quantity,
      "timestamp"        => @timestamp,
      "tradingsymbol"    => @tradingsymbol,
      "transaction_type" => @transaction_type,
      "triggered_at"     => @triggered_at,
      "validity"         => @validity,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Order < Dry::Struct
  attribute :exchange,         Types::String.optional
  attribute :order_type,       Types::String.optional
  attribute :price,            Types::Double.optional
  attribute :product,          Types::String.optional
  attribute :quantity,         Types::Int.optional
  attribute :result,           Result.optional.optional
  attribute :tradingsymbol,    Types::String.optional
  attribute :transaction_type, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      exchange:         d["exchange"],
      order_type:       d["order_type"],
      price:            d["price"],
      product:          d["product"],
      quantity:         d["quantity"],
      result:           d["result"] ? Result.from_dynamic!(d["result"]) : nil,
      tradingsymbol:    d["tradingsymbol"],
      transaction_type: d["transaction_type"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "exchange"         => @exchange,
      "order_type"       => @order_type,
      "price"            => @price,
      "product"          => @product,
      "quantity"         => @quantity,
      "result"           => @result&.to_dynamic,
      "tradingsymbol"    => @tradingsymbol,
      "transaction_type" => @transaction_type,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Datum < Dry::Struct
  attribute :condition,      Condition.optional
  attribute :created_at,     Types::String.optional
  attribute :expires_at,     Types::String.optional
  attribute :id,             Types::Int.optional
  attribute :datum_meta,     Meta.optional.optional
  attribute :orders,         Types.Array(Order).optional
  attribute :parent_trigger, Types::Nil.optional
  attribute :status,         Types::String.optional
  attribute :datum_type,     Types::String.optional
  attribute :updated_at,     Types::String.optional
  attribute :user_id,        Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      condition:      d["condition"] ? Condition.from_dynamic!(d["condition"]) : nil,
      created_at:     d["created_at"],
      expires_at:     d["expires_at"],
      id:             d["id"],
      datum_meta:     d["meta"] ? Meta.from_dynamic!(d["meta"]) : nil,
      orders:         d["orders"]&.map { |x| Order.from_dynamic!(x) },
      parent_trigger: d["parent_trigger"],
      status:         d["status"],
      datum_type:     d["type"],
      updated_at:     d["updated_at"],
      user_id:        d["user_id"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "condition"      => @condition&.to_dynamic,
      "created_at"     => @created_at,
      "expires_at"     => @expires_at,
      "id"             => @id,
      "meta"           => @datum_meta&.to_dynamic,
      "orders"         => @orders&.map { |x| x.to_dynamic },
      "parent_trigger" => @parent_trigger,
      "status"         => @status,
      "type"           => @datum_type,
      "updated_at"     => @updated_at,
      "user_id"        => @user_id,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GttGetOrders < Dry::Struct
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
