// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json = Json(JsonConfiguration.Stable)
// val ohlc = json.parse(Ohlc.serializer(), jsonString)

package Ohlc

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class Ohlc (
    val data: Map<String, Datum>? = null,
    val status: String? = null
)

@Serializable
data class Datum (
    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("last_price")
    val lastPrice: Long? = null,

    val ohlc: OhlcClass? = null
)

@Serializable
data class OhlcClass (
    val close: Double? = null,
    val high: Double? = null,
    val low: Double? = null,
    val open: Double? = null
)
