-- To decode the JSON data, add this file to your project, run
--
--     elm-package install NoRedInk/elm-decode-pipeline
--
-- add these imports
--
--     import Json.Decode exposing (decodeString)`);
--     import TickerQuote exposing (tickerQuote)
--
-- and you're off to the races with
--
--     decodeString tickerQuote myJsonString

module TickerQuote exposing
    ( TickerQuote
    , tickerQuoteToString
    , tickerQuote
    , Ohlc
    )

import Json.Decode as Jdec
import Json.Decode.Pipeline as Jpipe
import Json.Encode as Jenc
import Dict exposing (Dict, map, toList)
import Array exposing (Array, map)

type alias TickerQuote =
    { averagePrice : Maybe Float
    , buyQuantity : Maybe Int
    , change : Maybe Float
    , instrumentToken : Maybe Int
    , lastPrice : Maybe Float
    , lastQuantity : Maybe Int
    , mode : Maybe String
    , ohlc : Maybe Ohlc
    , sellQuantity : Maybe Int
    , tradable : Maybe Bool
    , volume : Maybe Int
    }

type alias Ohlc =
    { close : Maybe Float
    , high : Maybe Int
    , low : Maybe Float
    , open : Maybe Float
    }

-- decoders and encoders

tickerQuoteToString : TickerQuote -> String
tickerQuoteToString r = Jenc.encode 0 (encodeTickerQuote r)

tickerQuote : Jdec.Decoder TickerQuote
tickerQuote =
    Jpipe.decode TickerQuote
        |> Jpipe.optional "average_price" (Jdec.nullable Jdec.float) Nothing
        |> Jpipe.optional "buy_quantity" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.optional "change" (Jdec.nullable Jdec.float) Nothing
        |> Jpipe.optional "instrument_token" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.optional "last_price" (Jdec.nullable Jdec.float) Nothing
        |> Jpipe.optional "last_quantity" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.optional "mode" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "ohlc" (Jdec.nullable ohlc) Nothing
        |> Jpipe.optional "sell_quantity" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.optional "tradable" (Jdec.nullable Jdec.bool) Nothing
        |> Jpipe.optional "volume" (Jdec.nullable Jdec.int) Nothing

encodeTickerQuote : TickerQuote -> Jenc.Value
encodeTickerQuote x =
    Jenc.object
        [ ("average_price", makeNullableEncoder Jenc.float x.averagePrice)
        , ("buy_quantity", makeNullableEncoder Jenc.int x.buyQuantity)
        , ("change", makeNullableEncoder Jenc.float x.change)
        , ("instrument_token", makeNullableEncoder Jenc.int x.instrumentToken)
        , ("last_price", makeNullableEncoder Jenc.float x.lastPrice)
        , ("last_quantity", makeNullableEncoder Jenc.int x.lastQuantity)
        , ("mode", makeNullableEncoder Jenc.string x.mode)
        , ("ohlc", makeNullableEncoder encodeOhlc x.ohlc)
        , ("sell_quantity", makeNullableEncoder Jenc.int x.sellQuantity)
        , ("tradable", makeNullableEncoder Jenc.bool x.tradable)
        , ("volume", makeNullableEncoder Jenc.int x.volume)
        ]

ohlc : Jdec.Decoder Ohlc
ohlc =
    Jpipe.decode Ohlc
        |> Jpipe.optional "close" (Jdec.nullable Jdec.float) Nothing
        |> Jpipe.optional "high" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.optional "low" (Jdec.nullable Jdec.float) Nothing
        |> Jpipe.optional "open" (Jdec.nullable Jdec.float) Nothing

encodeOhlc : Ohlc -> Jenc.Value
encodeOhlc x =
    Jenc.object
        [ ("close", makeNullableEncoder Jenc.float x.close)
        , ("high", makeNullableEncoder Jenc.int x.high)
        , ("low", makeNullableEncoder Jenc.float x.low)
        , ("open", makeNullableEncoder Jenc.float x.open)
        ]

--- encoder helpers

makeArrayEncoder : (a -> Jenc.Value) -> Array a -> Jenc.Value
makeArrayEncoder f arr =
    Jenc.array (Array.map f arr)

makeDictEncoder : (a -> Jenc.Value) -> Dict String a -> Jenc.Value
makeDictEncoder f dict =
    Jenc.object (toList (Dict.map (\k -> f) dict))

makeNullableEncoder : (a -> Jenc.Value) -> Maybe a -> Jenc.Value
makeNullableEncoder f m =
    case m of
    Just x -> f x
    Nothing -> Jenc.null
