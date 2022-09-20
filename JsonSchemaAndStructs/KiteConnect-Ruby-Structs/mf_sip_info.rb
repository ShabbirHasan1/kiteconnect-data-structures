# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   mfsip_info = MFSIPInfo.from_json! "{…}"
#   puts mfsip_info.data&.step_up&.the_1502.even?
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

class StepUp < Dry::Struct
  attribute :the_1502, Types::Int.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      the_1502: d["15-02"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "15-02" => @the_1502,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class DataClass < Dry::Struct
  attribute :completed_instalments, Types::Int.optional
  attribute :created,               Types::String.optional
  attribute :dividend_type,         Types::String.optional
  attribute :frequency,             Types::String.optional
  attribute :fund,                  Types::String.optional
  attribute :fund_source,           Types::String.optional
  attribute :instalment_amount,     Types::Int.optional
  attribute :instalment_day,        Types::Int.optional
  attribute :instalments,           Types::Int.optional
  attribute :last_instalment,       Types::String.optional
  attribute :next_instalment,       Types::String.optional
  attribute :pending_instalments,   Types::Int.optional
  attribute :sip_id,                Types::String.optional
  attribute :sip_reg_num,           Types::Nil.optional
  attribute :sip_type,              Types::String.optional
  attribute :status,                Types::String.optional
  attribute :step_up,               StepUp.optional
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
      fund_source:           d["fund_source"],
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
      step_up:               d["step_up"] ? StepUp.from_dynamic!(d["step_up"]) : nil,
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
      "fund_source"           => @fund_source,
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
      "step_up"               => @step_up&.to_dynamic,
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

class MFSIPInfo < Dry::Struct
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
