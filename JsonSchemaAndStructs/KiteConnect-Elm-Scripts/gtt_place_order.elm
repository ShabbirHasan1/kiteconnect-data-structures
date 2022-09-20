-- To decode the JSON data, add this file to your project, run
--
--     elm-package install NoRedInk/elm-decode-pipeline
--
-- add these imports
--
--     import Json.Decode exposing (decodeString)`);
--     import GttPlaceOrder exposing (gttPlaceOrder)
--
-- and you're off to the races with
--
--     decodeString gttPlaceOrder myJsonString

module GttPlaceOrder exposing
    ( GttPlaceOrder
    , gttPlaceOrderToString
    , gttPlaceOrder
    , Data
    )

import Json.Decode as Jdec
import Json.Decode.Pipeline as Jpipe
import Json.Encode as Jenc
import Dict exposing (Dict, map, toList)
import Array exposing (Array, map)

type alias GttPlaceOrder =
    { data : Maybe Data
    , status : Maybe String
    }

type alias Data =
    { triggerID : Maybe Int
    }

-- decoders and encoders

gttPlaceOrderToString : GttPlaceOrder -> String
gttPlaceOrderToString r = Jenc.encode 0 (encodeGttPlaceOrder r)

gttPlaceOrder : Jdec.Decoder GttPlaceOrder
gttPlaceOrder =
    Jpipe.decode GttPlaceOrder
        |> Jpipe.optional "data" (Jdec.nullable data) Nothing
        |> Jpipe.optional "status" (Jdec.nullable Jdec.string) Nothing

encodeGttPlaceOrder : GttPlaceOrder -> Jenc.Value
encodeGttPlaceOrder x =
    Jenc.object
        [ ("data", makeNullableEncoder encodeData x.data)
        , ("status", makeNullableEncoder Jenc.string x.status)
        ]

data : Jdec.Decoder Data
data =
    Jpipe.decode Data
        |> Jpipe.optional "trigger_id" (Jdec.nullable Jdec.int) Nothing

encodeData : Data -> Jenc.Value
encodeData x =
    Jenc.object
        [ ("trigger_id", makeNullableEncoder Jenc.int x.triggerID)
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
