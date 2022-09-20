// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json            = Json(JsonConfiguration.Stable)
// val convertPosition = json.parse(ConvertPosition.serializer(), jsonString)

package BasketMargins

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class ConvertPosition (
    val data: Boolean? = null,
    val status: String? = null
)
