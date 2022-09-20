// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json = Json(JsonConfiguration.Stable)
// val ltp  = json.parse(Ltp.serializer(), jsonString)

package Ltp

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class Ltp (
    val data: Map<String, Datum>? = null,
    val status: String? = null
)

@Serializable
data class Datum (
    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("last_price")
    val lastPrice: Double? = null
)
