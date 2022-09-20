// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json  = Json(JsonConfiguration.Stable)
// val quote = json.parse(Quote.serializer(), jsonString)

package Quote

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class Quote (
    val data: Map<String, Datum>? = null,
    val status: String? = null
)

@Serializable
data class Datum (
    @SerialName("average_price")
    val averagePrice: Double? = null,

    @SerialName("buy_quantity")
    val buyQuantity: Long? = null,

    val depth: Depth? = null,

    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("last_price")
    val lastPrice: Double? = null,

    @SerialName("last_quantity")
    val lastQuantity: Long? = null,

    @SerialName("last_trade_time")
    val lastTradeTime: String? = null,

    @SerialName("lower_circuit_limit")
    val lowerCircuitLimit: Double? = null,

    @SerialName("net_change")
    val netChange: Long? = null,

    val ohlc: Ohlc? = null,
    val oi: Long? = null,

    @SerialName("oi_day_high")
    val oiDayHigh: Long? = null,

    @SerialName("oi_day_low")
    val oiDayLow: Long? = null,

    @SerialName("sell_quantity")
    val sellQuantity: Long? = null,

    val timestamp: String? = null,

    @SerialName("upper_circuit_limit")
    val upperCircuitLimit: Double? = null,

    val volume: Long? = null
)

@Serializable
data class Depth (
    val buy: List<Buy>? = null,
    val sell: List<Buy>? = null
)

@Serializable
data class Buy (
    val orders: Long? = null,
    val price: Double? = null,
    val quantity: Long? = null
)

@Serializable
data class Ohlc (
    val close: Double? = null,
    val high: Double? = null,
    val low: Double? = null,
    val open: Long? = null
)
