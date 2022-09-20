// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json            = Json(JsonConfiguration.Stable)
// val mFOrderResponse = json.parse(MFOrderResponse.serializer(), jsonString)

package MfOrderResponse

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class MFOrderResponse (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    @SerialName("order_id")
    val orderID: String? = null
)
