# Example code that deserializes and serializes the model:
#
# require "json"
#
# class Location
#   include JSON::Serializable
#
#   @[JSON::Field(key: "lat")]
#   property latitude : Float64
#
#   @[JSON::Field(key: "lng")]
#   property longitude : Float64
# end
#
# class House
#   include JSON::Serializable
#   property address : String
#   property location : Location?
# end
#
# house = House.from_json(%({"address": "Crystal Road 1234", "location": {"lat": 12.3, "lng": 34.5}}))
# house.address  # => "Crystal Road 1234"
# house.location # => #<Location:0x10cd93d80 @latitude=12.3, @longitude=34.5>


require "json"

class TickerQuote
  include JSON::Serializable

  property average_price : Float64?

  property buy_quantity : Int32?

  property change : Float64?

  property instrument_token : Int32?

  property last_price : Float64?

  property last_quantity : Int32?

  property mode : String?

  property ohlc : Ohlc?

  property sell_quantity : Int32?

  property tradable : Bool?

  property volume : Int32?
end

class Ohlc
  include JSON::Serializable

  property close : Float64?

  property high : Int32?

  property low : Float64?

  property open : Float64?
end
