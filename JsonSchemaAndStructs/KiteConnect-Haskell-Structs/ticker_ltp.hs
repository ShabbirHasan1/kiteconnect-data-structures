{-# LANGUAGE StrictData #-}
{-# LANGUAGE OverloadedStrings #-}

module TickerLtp
    ( TickerLtp (..)
    , decodeTopLevel
    ) where

import Data.Aeson
import Data.Aeson.Types (emptyObject)
import Data.ByteString.Lazy (ByteString)
import Data.HashMap.Strict (HashMap)
import Data.Text (Text)
import Data.Vector (Vector)

data TickerLtp = TickerLtp
    { instrumentTokenTickerLtp :: Maybe Int
    , lastPriceTickerLtp :: Maybe Float
    , modeTickerLtp :: Maybe Text
    , tradableTickerLtp :: Maybe Bool
    } deriving (Show)

decodeTopLevel :: ByteString -> Maybe TickerLtp
decodeTopLevel = decode

instance ToJSON TickerLtp where
    toJSON (TickerLtp instrumentTokenTickerLtp lastPriceTickerLtp modeTickerLtp tradableTickerLtp) =
        object
        [ "instrument_token" .= instrumentTokenTickerLtp
        , "last_price" .= lastPriceTickerLtp
        , "mode" .= modeTickerLtp
        , "tradable" .= tradableTickerLtp
        ]

instance FromJSON TickerLtp where
    parseJSON (Object v) = TickerLtp
        <$> v .:? "instrument_token"
        <*> v .:? "last_price"
        <*> v .:? "mode"
        <*> v .:? "tradable"
