// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json        = Json(JsonConfiguration.Stable)
// val mFSIPModify = json.parse(MFSIPModify.serializer(), jsonString)

package MfSipModify

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class MFSIPModify (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    @SerialName("sip_id")
    val sipID: String? = null
)
