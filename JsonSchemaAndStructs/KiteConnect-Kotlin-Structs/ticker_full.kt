// To parse the JSON, install Klaxon and do:
//
//   val tickerFull = TickerFull.fromJson(jsonString)

package TickerFull

import com.beust.klaxon.*

private val klaxon = Klaxon()

data class TickerFull (
    @Json(name = "average_price")
    val averagePrice: Double? = null,

    @Json(name = "buy_quantity")
    val buyQuantity: Long? = null,

    val change: Double? = null,
    val depth: Depth? = null,

    @Json(name = "instrument_token")
    val instrumentToken: Long? = null,

    @Json(name = "last_price")
    val lastPrice: Double? = null,

    @Json(name = "last_quantity")
    val lastQuantity: Long? = null,

    @Json(name = "last_trade_time")
    val lastTradeTime: String? = null,

    val mode: String? = null,
    val ohlc: Ohlc? = null,
    val oi: Long? = null,

    @Json(name = "oi_day_high")
    val oiDayHigh: Long? = null,

    @Json(name = "oi_day_low")
    val oiDayLow: Long? = null,

    @Json(name = "sell_quantity")
    val sellQuantity: Long? = null,

    val timestamp: String? = null,
    val tradable: Boolean? = null,
    val volume: Long? = null
) {
    public fun toJson() = klaxon.toJsonString(this)

    companion object {
        public fun fromJson(json: String) = klaxon.parse<TickerFull>(json)
    }
}

data class Depth (
    val buy: List<Buy>? = null,
    val sell: List<Buy>? = null
)

data class Buy (
    val orders: Long? = null,
    val price: Double? = null,
    val quantity: Long? = null
)

data class Ohlc (
    val close: Double? = null,
    val high: Long? = null,
    val low: Double? = null,
    val open: Double? = null
)
