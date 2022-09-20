# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   generate_session = GenerateSession.from_json! "{…}"
#   puts generate_session.data&.products&.first
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

class Meta < Dry::Struct
  attribute :demat_consent, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      demat_consent: d["demat_consent"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "demat_consent" => @demat_consent,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class DataClass < Dry::Struct
  attribute :access_token,   Types::String.optional
  attribute :api_key,        Types::String.optional
  attribute :avatar_url,     Types::String.optional
  attribute :broker,         Types::String.optional
  attribute :email,          Types::String.optional
  attribute :enctoken,       Types::String.optional
  attribute :exchanges,      Types.Array(Types::String).optional
  attribute :login_time,     Types::String.optional
  attribute :data_meta,      Meta.optional
  attribute :order_types,    Types.Array(Types::String).optional
  attribute :products,       Types.Array(Types::String).optional
  attribute :public_token,   Types::String.optional
  attribute :refresh_token,  Types::String.optional
  attribute :silo,           Types::String.optional
  attribute :user_id,        Types::String.optional
  attribute :user_name,      Types::String.optional
  attribute :user_shortname, Types::String.optional
  attribute :user_type,      Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      access_token:   d["access_token"],
      api_key:        d["api_key"],
      avatar_url:     d["avatar_url"],
      broker:         d["broker"],
      email:          d["email"],
      enctoken:       d["enctoken"],
      exchanges:      d["exchanges"],
      login_time:     d["login_time"],
      data_meta:      d["meta"] ? Meta.from_dynamic!(d["meta"]) : nil,
      order_types:    d["order_types"],
      products:       d["products"],
      public_token:   d["public_token"],
      refresh_token:  d["refresh_token"],
      silo:           d["silo"],
      user_id:        d["user_id"],
      user_name:      d["user_name"],
      user_shortname: d["user_shortname"],
      user_type:      d["user_type"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "access_token"   => @access_token,
      "api_key"        => @api_key,
      "avatar_url"     => @avatar_url,
      "broker"         => @broker,
      "email"          => @email,
      "enctoken"       => @enctoken,
      "exchanges"      => @exchanges,
      "login_time"     => @login_time,
      "meta"           => @data_meta&.to_dynamic,
      "order_types"    => @order_types,
      "products"       => @products,
      "public_token"   => @public_token,
      "refresh_token"  => @refresh_token,
      "silo"           => @silo,
      "user_id"        => @user_id,
      "user_name"      => @user_name,
      "user_shortname" => @user_shortname,
      "user_type"      => @user_type,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GenerateSession < Dry::Struct
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
