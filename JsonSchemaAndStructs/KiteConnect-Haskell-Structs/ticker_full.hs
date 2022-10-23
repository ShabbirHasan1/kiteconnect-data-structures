{-# LANGUAGE StrictData #-}
{-# LANGUAGE OverloadedStrings #-}

module TickerFull
    ( TickerFull (..)
    , Depth (..)
    , Buy (..)
    , Ohlc (..)
    , decodeTopLevel
    ) where

import Data.Aeson
import Data.Aeson.Types (emptyObject)
import Data.ByteString.Lazy (ByteString)
import Data.HashMap.Strict (HashMap)
import Data.Text (Text)
import Data.Vector (Vector)

data TickerFull = TickerFull
    { averagePriceTickerFull :: Maybe Float
    , buyQuantityTickerFull :: Maybe Int
    , changeTickerFull :: Maybe Float
    , depthTickerFull :: Maybe Depth
    , instrumentTokenTickerFull :: Maybe Int
    , lastPriceTickerFull :: Maybe Float
    , lastQuantityTickerFull :: Maybe Int
    , lastTradeTimeTickerFull :: Maybe Text
    , modeTickerFull :: Maybe Text
    , ohlcTickerFull :: Maybe Ohlc
    , oiTickerFull :: Maybe Int
    , oiDayHighTickerFull :: Maybe Int
    , oiDayLowTickerFull :: Maybe Int
    , sellQuantityTickerFull :: Maybe Int
    , timestampTickerFull :: Maybe Text
    , tradableTickerFull :: Maybe Bool
    , volumeTickerFull :: Maybe Int
    } deriving (Show)

data Depth = Depth
    { buyDepth :: Maybe (Vector Buy)
    , sellDepth :: Maybe (Vector Buy)
    } deriving (Show)

data Buy = Buy
    { ordersBuy :: Maybe Int
    , priceBuy :: Maybe Float
    , quantityBuy :: Maybe Int
    } deriving (Show)

data Ohlc = Ohlc
    { closeOhlc :: Maybe Float
    , highOhlc :: Maybe Int
    , lowOhlc :: Maybe Float
    , openOhlc :: Maybe Float
    } deriving (Show)

decodeTopLevel :: ByteString -> Maybe TickerFull
decodeTopLevel = decode

instance ToJSON TickerFull where
    toJSON (TickerFull averagePriceTickerFull buyQuantityTickerFull changeTickerFull depthTickerFull instrumentTokenTickerFull lastPriceTickerFull lastQuantityTickerFull lastTradeTimeTickerFull modeTickerFull ohlcTickerFull oiTickerFull oiDayHighTickerFull oiDayLowTickerFull sellQuantityTickerFull timestampTickerFull tradableTickerFull volumeTickerFull) =
        object
        [ "average_price" .= averagePriceTickerFull
        , "buy_quantity" .= buyQuantityTickerFull
        , "change" .= changeTickerFull
        , "depth" .= depthTickerFull
        , "instrument_token" .= instrumentTokenTickerFull
        , "last_price" .= lastPriceTickerFull
        , "last_quantity" .= lastQuantityTickerFull
        , "last_trade_time" .= lastTradeTimeTickerFull
        , "mode" .= modeTickerFull
        , "ohlc" .= ohlcTickerFull
        , "oi" .= oiTickerFull
        , "oi_day_high" .= oiDayHighTickerFull
        , "oi_day_low" .= oiDayLowTickerFull
        , "sell_quantity" .= sellQuantityTickerFull
        , "timestamp" .= timestampTickerFull
        , "tradable" .= tradableTickerFull
        , "volume" .= volumeTickerFull
        ]

instance FromJSON TickerFull where
    parseJSON (Object v) = TickerFull
        <$> v .:? "average_price"
        <*> v .:? "buy_quantity"
        <*> v .:? "change"
        <*> v .:? "depth"
        <*> v .:? "instrument_token"
        <*> v .:? "last_price"
        <*> v .:? "last_quantity"
        <*> v .:? "last_trade_time"
        <*> v .:? "mode"
        <*> v .:? "ohlc"
        <*> v .:? "oi"
        <*> v .:? "oi_day_high"
        <*> v .:? "oi_day_low"
        <*> v .:? "sell_quantity"
        <*> v .:? "timestamp"
        <*> v .:? "tradable"
        <*> v .:? "volume"

instance ToJSON Depth where
    toJSON (Depth buyDepth sellDepth) =
        object
        [ "buy" .= buyDepth
        , "sell" .= sellDepth
        ]

instance FromJSON Depth where
    parseJSON (Object v) = Depth
        <$> v .:? "buy"
        <*> v .:? "sell"

instance ToJSON Buy where
    toJSON (Buy ordersBuy priceBuy quantityBuy) =
        object
        [ "orders" .= ordersBuy
        , "price" .= priceBuy
        , "quantity" .= quantityBuy
        ]

instance FromJSON Buy where
    parseJSON (Object v) = Buy
        <$> v .:? "orders"
        <*> v .:? "price"
        <*> v .:? "quantity"

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
