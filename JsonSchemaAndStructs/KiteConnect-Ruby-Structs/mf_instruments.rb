# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   mf_instruments = MFInstruments.from_json! "[…]"
#   puts mf_instruments.first.amc == Amc::BirlaSunLifeMutualFundMF
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Int            = Strict::Int
  Hash           = Strict::Hash
  String         = Strict::String
  Double         = Strict::Float | Strict::Int
  Amc            = Strict::String.enum("BirlaSunLifeMutualFund_MF")
  DividendType   = Strict::String.enum("growth", "payout")
  Plan           = Strict::String.enum("direct", "regular")
  SchemeType     = Strict::String.enum("balanced", "debt", "equity", "fof", "liquid")
  SettlementType = Strict::String.enum("T1", "T3", "T4", "T6")
end

module Amc
  BirlaSunLifeMutualFundMF = "BirlaSunLifeMutualFund_MF"
end

module DividendType
  Growth = "growth"
  Payout = "payout"
end

module Plan
  Direct  = "direct"
  Regular = "regular"
end

module SchemeType
  Balanced = "balanced"
  Debt     = "debt"
  Equity   = "equity"
  Fof      = "fof"
  Liquid   = "liquid"
end

module SettlementType
  T1 = "T1"
  T3 = "T3"
  T4 = "T4"
  T6 = "T6"
end

class MFInstrument < Dry::Struct
  attribute :amc,                                Types::Amc.optional
  attribute :dividend_type,                      Types::DividendType.optional
  attribute :last_price,                         Types::Double.optional
  attribute :last_price_date,                    Types::String.optional
  attribute :minimum_additional_purchase_amount, Types::Int.optional
  attribute :minimum_purchase_amount,            Types::Int.optional
  attribute :minimum_redemption_quantity,        Types::Double.optional
  attribute :mf_instrument_name,                 Types::String.optional
  attribute :plan,                               Types::Plan.optional
  attribute :purchase_allowed,                   Types::Int.optional
  attribute :purchase_amount_multiplier,         Types::Int.optional
  attribute :redemption_allowed,                 Types::Int.optional
  attribute :redemption_quantity_multiplier,     Types::Double.optional
  attribute :scheme_type,                        Types::SchemeType.optional
  attribute :settlement_type,                    Types::SettlementType.optional
  attribute :tradingsymbol,                      Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      amc:                                d["amc"],
      dividend_type:                      d["dividend_type"],
      last_price:                         d["last_price"],
      last_price_date:                    d["last_price_date"],
      minimum_additional_purchase_amount: d["minimum_additional_purchase_amount"],
      minimum_purchase_amount:            d["minimum_purchase_amount"],
      minimum_redemption_quantity:        d["minimum_redemption_quantity"],
      mf_instrument_name:                 d["name"],
      plan:                               d["plan"],
      purchase_allowed:                   d["purchase_allowed"],
      purchase_amount_multiplier:         d["purchase_amount_multiplier"],
      redemption_allowed:                 d["redemption_allowed"],
      redemption_quantity_multiplier:     d["redemption_quantity_multiplier"],
      scheme_type:                        d["scheme_type"],
      settlement_type:                    d["settlement_type"],
      tradingsymbol:                      d["tradingsymbol"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "amc"                                => @amc,
      "dividend_type"                      => @dividend_type,
      "last_price"                         => @last_price,
      "last_price_date"                    => @last_price_date,
      "minimum_additional_purchase_amount" => @minimum_additional_purchase_amount,
      "minimum_purchase_amount"            => @minimum_purchase_amount,
      "minimum_redemption_quantity"        => @minimum_redemption_quantity,
      "name"                               => @mf_instrument_name,
      "plan"                               => @plan,
      "purchase_allowed"                   => @purchase_allowed,
      "purchase_amount_multiplier"         => @purchase_amount_multiplier,
      "redemption_allowed"                 => @redemption_allowed,
      "redemption_quantity_multiplier"     => @redemption_quantity_multiplier,
      "scheme_type"                        => @scheme_type,
      "settlement_type"                    => @settlement_type,
      "tradingsymbol"                      => @tradingsymbol,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class MFInstruments
  def self.from_json!(json)
    mf_instruments = JSON.parse(json, quirks_mode: true).map { |x| MFInstrument.from_dynamic!(x) }
    mf_instruments.define_singleton_method(:to_json) do
      JSON.generate(self.map { |x| x.to_dynamic })
    end
    mf_instruments
  end
end
