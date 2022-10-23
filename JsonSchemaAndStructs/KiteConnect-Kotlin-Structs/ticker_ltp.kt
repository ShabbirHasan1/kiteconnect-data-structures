// To parse the JSON, install Klaxon and do:
//
//   val tickerLtp = TickerLtp.fromJson(jsonString)

package TickerLtp

import com.beust.klaxon.*

private val klaxon = Klaxon()

data class TickerLtp (
    @Json(name = "instrument_token")
    val instrumentToken: Long? = null,

    @Json(name = "last_price")
    val lastPrice: Double? = null,

    val mode: String? = null,
    val tradable: Boolean? = null
) {
    public fun toJson() = klaxon.toJsonString(this)

    companion object {
        public fun fromJson(json: String) = klaxon.parse<TickerLtp>(json)
    }
}
