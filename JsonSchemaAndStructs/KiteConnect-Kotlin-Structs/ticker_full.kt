// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json       = Json(JsonConfiguration.Stable)
// val tickerFull = json.parse(TickerFull.serializer(), jsonString)

package TickerFull

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

typealias TickerFull = JsonArray<TriggerRangeElement>

@Serializable
data class TriggerRangeElement (
    @SerialName("average_traded_price")
    val averageTradedPrice: Double? = null,

    val change: Double? = null,
    val depth: Depth? = null,

    @SerialName("exchange_timestamp")
    val exchangeTimestamp: String? = null,

    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("last_price")
    val lastPrice: Long? = null,

    @SerialName("last_trade_time")
    val lastTradeTime: String? = null,

    @SerialName("last_traded_quantity")
    val lastTradedQuantity: Long? = null,

    val mode: String? = null,
    val ohlc: Ohlc? = null,
    val oi: Long? = null,

    @SerialName("oi_day_high")
    val oiDayHigh: Long? = null,

    @SerialName("oi_day_low")
    val oiDayLow: Long? = null,

    @SerialName("total_buy_quantity")
    val totalBuyQuantity: Long? = null,

    @SerialName("total_sell_quantity")
    val totalSellQuantity: Long? = null,

    val tradable: Boolean? = null,

    @SerialName("volume_traded")
    val volumeTraded: Long? = null
)

@Serializable
data class Depth (
    val buy: List<Buy>? = null,
    val sell: List<Buy>? = null
)

@Serializable
data class Buy (
    val orders: Long? = null,
    val price: Long? = null,
    val quantity: Long? = null
)

@Serializable
data class Ohlc (
    val close: Long? = null,
    val high: Long? = null,
    val low: Long? = null,
    val open: Long? = null
)
