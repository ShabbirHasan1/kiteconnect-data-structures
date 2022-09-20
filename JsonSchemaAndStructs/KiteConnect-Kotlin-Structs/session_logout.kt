// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json          = Json(JsonConfiguration.Stable)
// val sessionLogout = json.parse(SessionLogout.serializer(), jsonString)

package SessionLogout

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class SessionLogout (
    val data: Boolean? = null,
    val status: String? = null
)
