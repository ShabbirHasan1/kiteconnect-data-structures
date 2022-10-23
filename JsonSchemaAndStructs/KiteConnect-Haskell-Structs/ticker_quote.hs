{-# LANGUAGE StrictData #-}
{-# LANGUAGE OverloadedStrings #-}

module TickerQuote
    ( TickerQuote (..)
    , Ohlc (..)
    , decodeTopLevel
    ) where

import Data.Aeson
import Data.Aeson.Types (emptyObject)
import Data.ByteString.Lazy (ByteString)
import Data.HashMap.Strict (HashMap)
import Data.Text (Text)
import Data.Vector (Vector)

data TickerQuote = TickerQuote
    { averagePriceTickerQuote :: Maybe Float
    , buyQuantityTickerQuote :: Maybe Int
    , changeTickerQuote :: Maybe Float
    , instrumentTokenTickerQuote :: Maybe Int
    , lastPriceTickerQuote :: Maybe Float
    , lastQuantityTickerQuote :: Maybe Int
    , modeTickerQuote :: Maybe Text
    , ohlcTickerQuote :: Maybe Ohlc
    , sellQuantityTickerQuote :: Maybe Int
    , tradableTickerQuote :: Maybe Bool
    , volumeTickerQuote :: Maybe Int
    } deriving (Show)

data Ohlc = Ohlc
    { closeOhlc :: Maybe Float
    , highOhlc :: Maybe Int
    , lowOhlc :: Maybe Float
    , openOhlc :: Maybe Float
    } deriving (Show)

decodeTopLevel :: ByteString -> Maybe TickerQuote
decodeTopLevel = decode

instance ToJSON TickerQuote where
    toJSON (TickerQuote averagePriceTickerQuote buyQuantityTickerQuote changeTickerQuote instrumentTokenTickerQuote lastPriceTickerQuote lastQuantityTickerQuote modeTickerQuote ohlcTickerQuote sellQuantityTickerQuote tradableTickerQuote volumeTickerQuote) =
        object
        [ "average_price" .= averagePriceTickerQuote
        , "buy_quantity" .= buyQuantityTickerQuote
        , "change" .= changeTickerQuote
        , "instrument_token" .= instrumentTokenTickerQuote
        , "last_price" .= lastPriceTickerQuote
        , "last_quantity" .= lastQuantityTickerQuote
        , "mode" .= modeTickerQuote
        , "ohlc" .= ohlcTickerQuote
        , "sell_quantity" .= sellQuantityTickerQuote
        , "tradable" .= tradableTickerQuote
        , "volume" .= volumeTickerQuote
        ]

instance FromJSON TickerQuote where
    parseJSON (Object v) = TickerQuote
        <$> v .:? "average_price"
        <*> v .:? "buy_quantity"
        <*> v .:? "change"
        <*> v .:? "instrument_token"
        <*> v .:? "last_price"
        <*> v .:? "last_quantity"
        <*> v .:? "mode"
        <*> v .:? "ohlc"
        <*> v .:? "sell_quantity"
        <*> v .:? "tradable"
        <*> v .:? "volume"

instance ToJSON Ohlc where
    toJSON (Ohlc closeOhlc highOhlc lowOhlc openOhlc) =
        object
        [ "close" .= closeOhlc
        , "high" .= highOhlc
        , "low" .= lowOhlc
        , "open" .= openOhlc
        ]

instance FromJSON Ohlc where
    parseJSON (Object v) = Ohlc
        <$> v .:? "close"
        <*> v .:? "high"
        <*> v .:? "low"
        <*> v .:? "open"
