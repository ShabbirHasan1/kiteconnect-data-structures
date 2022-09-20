# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   mf_sips = MFSips.from_json! "{…}"
#   puts mf_sips.data&.first.step_up&["…"].even?
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

class Datum < Dry::Struct
  attribute :completed_instalments, Types::Int.optional
  attribute :created,               Types::String.optional
  attribute :dividend_type,         Types::String.optional
  attribute :frequency,             Types::String.optional
  attribute :fund,                  Types::String.optional
  attribute :instalment_amount,     Types::Int.optional
  attribute :instalment_day,        Types::Int.optional
  attribute :instalments,           Types::Int.optional
  attribute :last_instalment,       Types::String.optional
  attribute :next_instalment,       Types::String.optional
  attribute :pending_instalments,   Types::Int.optional
  attribute :sip_id,                Types::String.optional
  attribute :sip_reg_num,           Types::String.optional.optional
  attribute :sip_type,              Types::String.optional
  attribute :status,                Types::String.optional
  attribute :step_up,               Types::Hash.meta(of: Types::Int).optional
  attribute :tag,                   Types::String.optional
  attribute :tradingsymbol,         Types::String.optional
  attribute :transaction_type,      Types::String.optional
  attribute :trigger_price,         Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      completed_instalments: d["completed_instalments"],
      created:               d["created"],
      dividend_type:         d["dividend_type"],
      frequency:             d["frequency"],
      fund:                  d["fund"],
      instalment_amount:     d["instalment_amount"],
      instalment_day:        d["instalment_day"],
      instalments:           d["instalments"],
      last_instalment:       d["last_instalment"],
      next_instalment:       d["next_instalment"],
      pending_instalments:   d["pending_instalments"],
      sip_id:                d["sip_id"],
      sip_reg_num:           d["sip_reg_num"],
      sip_type:              d["sip_type"],
      status:                d["status"],
      step_up:               Types::Hash.optional[d["step_up"]]&.map { |k, v| [k, Types::Int[v]] }&.to_h,
      tag:                   d["tag"],
      tradingsymbol:         d["tradingsymbol"],
      transaction_type:      d["transaction_type"],
      trigger_price:         d["trigger_price"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "completed_instalments" => @completed_instalments,
      "created"               => @created,
      "dividend_type"         => @dividend_type,
      "frequency"             => @frequency,
      "fund"                  => @fund,
      "instalment_amount"     => @instalment_amount,
      "instalment_day"        => @instalment_day,
      "instalments"           => @instalments,
      "last_instalment"       => @last_instalment,
      "next_instalment"       => @next_instalment,
      "pending_instalments"   => @pending_instalments,
      "sip_id"                => @sip_id,
      "sip_reg_num"           => @sip_reg_num,
      "sip_type"              => @sip_type,
      "status"                => @status,
      "step_up"               => @step_up,
      "tag"                   => @tag,
      "tradingsymbol"         => @tradingsymbol,
      "transaction_type"      => @transaction_type,
      "trigger_price"         => @trigger_price,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class MFSips < Dry::Struct
  attribute :data, Types.Array(Datum).optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      data: d["data"]&.map { |x| Datum.from_dynamic!(x) },
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "data" => @data&.map { |x| x.to_dynamic },
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
