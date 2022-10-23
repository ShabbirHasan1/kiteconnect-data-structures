// To parse the JSON, install Klaxon and do:
//
//   val tickerQuote = TickerQuote.fromJson(jsonString)

package TickerQuote

import com.beust.klaxon.*

private val klaxon = Klaxon()

data class TickerQuote (
    @Json(name = "average_price")
    val averagePrice: Double? = null,

    @Json(name = "buy_quantity")
    val buyQuantity: Long? = null,

    val change: Double? = null,

    @Json(name = "instrument_token")
    val instrumentToken: Long? = null,

    @Json(name = "last_price")
    val lastPrice: Double? = null,

    @Json(name = "last_quantity")
    val lastQuantity: Long? = null,

    val mode: String? = null,
    val ohlc: Ohlc? = null,

    @Json(name = "sell_quantity")
    val sellQuantity: Long? = null,

    val tradable: Boolean? = null,
    val volume: Long? = null
) {
    public fun toJson() = klaxon.toJsonString(this)

    companion object {
        public fun fromJson(json: String) = klaxon.parse<TickerQuote>(json)
    }
}

data class Ohlc (
    val close: Double? = null,
    val high: Long? = null,
    val low: Double? = null,
    val open: Double? = null
)
