// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json      = Json(JsonConfiguration.Stable)
// val tickerLtp = json.parse(TickerLtp.serializer(), jsonString)

package TickerLtp

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

typealias TickerLtp = JsonArray<TriggerRangeElement>

@Serializable
data class TriggerRangeElement (
    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("last_price")
    val lastPrice: Long? = null,

    val mode: String? = null,
    val tradable: Boolean? = null
)
