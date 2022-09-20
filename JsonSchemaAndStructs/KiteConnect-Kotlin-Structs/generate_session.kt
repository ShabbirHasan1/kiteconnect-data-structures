// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json            = Json(JsonConfiguration.Stable)
// val generateSession = json.parse(GenerateSession.serializer(), jsonString)

package GenerateSession

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class GenerateSession (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    @SerialName("access_token")
    val accessToken: String? = null,

    @SerialName("api_key")
    val apiKey: String? = null,

    @SerialName("avatar_url")
    val avatarURL: String? = null,

    val broker: String? = null,
    val email: String? = null,
    val enctoken: String? = null,
    val exchanges: List<String>? = null,

    @SerialName("login_time")
    val loginTime: String? = null,

    val meta: Meta? = null,

    @SerialName("order_types")
    val orderTypes: List<String>? = null,

    val products: List<String>? = null,

    @SerialName("public_token")
    val publicToken: String? = null,

    @SerialName("refresh_token")
    val refreshToken: String? = null,

    val silo: String? = null,

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
