// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json           = Json(JsonConfiguration.Stable)
// val gttModifyOrder = json.parse(GttModifyOrder.serializer(), jsonString)

package GttModifyOrder

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class GttModifyOrder (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    @SerialName("trigger_id")
    val triggerID: Long? = null
)
