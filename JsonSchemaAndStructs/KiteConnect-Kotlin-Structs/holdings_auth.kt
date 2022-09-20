// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json         = Json(JsonConfiguration.Stable)
// val holdingsAuth = json.parse(HoldingsAuth.serializer(), jsonString)

package HoldingsAuth

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class HoldingsAuth (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    @SerialName("request_id")
    val requestID: String? = null
)
