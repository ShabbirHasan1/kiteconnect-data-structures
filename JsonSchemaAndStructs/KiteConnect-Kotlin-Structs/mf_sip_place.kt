// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json       = Json(JsonConfiguration.Stable)
// val mFSIPPlace = json.parse(MFSIPPlace.serializer(), jsonString)

package MfSipPlace

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class MFSIPPlace (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    @SerialName("sip_id")
    val sipID: String? = null
)
