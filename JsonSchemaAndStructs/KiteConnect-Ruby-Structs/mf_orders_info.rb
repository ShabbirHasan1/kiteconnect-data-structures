# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   mf_orders_info = MFOrdersInfo.from_json! "{…}"
#   puts mf_orders_info.data&.amount.even?
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

class DataClass < Dry::Struct
  attribute :amount,             Types::Int.optional
  attribute :average_price,      Types::Int.optional
  attribute :exchange_order_id,  Types::Nil.optional
  attribute :exchange_timestamp, Types::Nil.optional
  attribute :folio,              Types::Nil.optional
  attribute :fund,               Types::String.optional
  attribute :last_price,         Types::Double.optional
  attribute :last_price_date,    Types::String.optional
  attribute :order_id,           Types::String.optional
  attribute :order_timestamp,    Types::String.optional
  attribute :placed_by,          Types::String.optional
  attribute :purchase_type,      Types::String.optional
  attribute :quantity,           Types::Int.optional
  attribute :settlement_id,      Types::Nil.optional
  attribute :status,             Types::String.optional
  attribute :status_message,     Types::String.optional
  attribute :tag,                Types::Nil.optional
  attribute :tradingsymbol,      Types::String.optional
  attribute :transaction_type,   Types::String.optional
  attribute :variety,            Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      amount:             d["amount"],
      average_price:      d["average_price"],
      exchange_order_id:  d["exchange_order_id"],
      exchange_timestamp: d["exchange_timestamp"],
      folio:              d["folio"],
      fund:               d["fund"],
      last_price:         d["last_price"],
      last_price_date:    d["last_price_date"],
      order_id:           d["order_id"],
      order_timestamp:    d["order_timestamp"],
      placed_by:          d["placed_by"],
      purchase_type:      d["purchase_type"],
      quantity:           d["quantity"],
      settlement_id:      d["settlement_id"],
      status:             d["status"],
      status_message:     d["status_message"],
      tag:                d["tag"],
      tradingsymbol:      d["tradingsymbol"],
      transaction_type:   d["transaction_type"],
      variety:            d["variety"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "amount"             => @amount,
      "average_price"      => @average_price,
      "exchange_order_id"  => @exchange_order_id,
      "exchange_timestamp" => @exchange_timestamp,
      "folio"              => @folio,
      "fund"               => @fund,
      "last_price"         => @last_price,
      "last_price_date"    => @last_price_date,
      "order_id"           => @order_id,
      "order_timestamp"    => @order_timestamp,
      "placed_by"          => @placed_by,
      "purchase_type"      => @purchase_type,
      "quantity"           => @quantity,
      "settlement_id"      => @settlement_id,
      "status"             => @status,
      "status_message"     => @status_message,
      "tag"                => @tag,
      "tradingsymbol"      => @tradingsymbol,
      "transaction_type"   => @transaction_type,
      "variety"            => @variety,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class MFOrdersInfo < Dry::Struct
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
