// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json   = Json(JsonConfiguration.Stable)
// val mFSips = json.parse(MFSips.serializer(), jsonString)

package MfSips

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class MFSips (
    val data: List<Datum>? = null
)

@Serializable
data class Datum (
    @SerialName("completed_instalments")
    val completedInstalments: Long? = null,

    val created: String? = null,

    @SerialName("dividend_type")
    val dividendType: String? = null,

    val frequency: String? = null,
    val fund: String? = null,

    @SerialName("instalment_amount")
    val instalmentAmount: Long? = null,

    @SerialName("instalment_day")
    val instalmentDay: Long? = null,

    val instalments: Long? = null,

    @SerialName("last_instalment")
    val lastInstalment: String? = null,

    @SerialName("next_instalment")
    val nextInstalment: String? = null,

    @SerialName("pending_instalments")
    val pendingInstalments: Long? = null,

    @SerialName("sip_id")
    val sipID: String? = null,

    @SerialName("sip_reg_num")
    val sipRegNum: String? = null,

    @SerialName("sip_type")
    val sipType: String? = null,

    val status: String? = null,

    @SerialName("step_up")
    val stepUp: Map<String, Long>? = null,

    val tag: String? = null,
    val tradingsymbol: String? = null,

    @SerialName("transaction_type")
    val transactionType: String? = null,

    @SerialName("trigger_price")
    val triggerPrice: Long? = null
)
