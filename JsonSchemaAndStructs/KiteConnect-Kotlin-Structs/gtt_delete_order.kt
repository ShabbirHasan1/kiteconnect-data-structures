// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json           = Json(JsonConfiguration.Stable)
// val gttDeleteOrder = json.parse(GttDeleteOrder.serializer(), jsonString)

package GttDeleteOrder

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class GttDeleteOrder (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    @SerialName("trigger_id")
    val triggerID: Long? = null
)
