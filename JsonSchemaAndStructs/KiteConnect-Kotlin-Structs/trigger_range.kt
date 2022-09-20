// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json         = Json(JsonConfiguration.Stable)
// val triggerRange = json.parse(TriggerRange.serializer(), jsonString)

package TriggerRange

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class TriggerRange (
    val data: Map<String, Datum>? = null,
    val status: String? = null
)

@Serializable
data class Datum (
    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    val lower: Double? = null,
    val upper: Double? = null
)
