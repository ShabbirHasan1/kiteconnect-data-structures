// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json    = Json(JsonConfiguration.Stable)
// val profile = json.parse(Profile.serializer(), jsonString)

package Profile

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class Profile (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    @SerialName("avatar_url")
    val avatarURL: JsonObject? = null,

    val broker: String? = null,
    val email: String? = null,
    val exchanges: List<String>? = null,
    val meta: Meta? = null,

    @SerialName("order_types")
    val orderTypes: List<String>? = null,

    val products: List<String>? = null,

    @SerialName("user_id")
    val userID: String? = null,

    @SerialName("user_name")
    val userName: String? = null,

    @SerialName("user_shortname")
    val userShortname: String? = null,

    @SerialName("user_type")
    val userType: String? = null
)

@Serializable
data class Meta (
    @SerialName("demat_consent")
    val dematConsent: String? = null
)
