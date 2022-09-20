// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json             = Json(JsonConfiguration.Stable)
// val historicalMinute = json.parse(HistoricalMinute.serializer(), jsonString)

package HistoricalMinute

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class HistoricalMinute (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    val candles: List<List<Candle>>? = null
)

@Serializable
sealed class Candle {
    class DoubleValue(val value: Double) : Candle()
    class StringValue(val value: String) : Candle()
}
