// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json          = Json(JsonConfiguration.Stable)
// val orderResponse = json.parse(OrderResponse.serializer(), jsonString)

package OrderResponse

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class OrderResponse (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    @SerialName("order_id")
    val orderID: String? = null
)
