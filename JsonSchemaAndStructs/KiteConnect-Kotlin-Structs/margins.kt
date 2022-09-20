// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json    = Json(JsonConfiguration.Stable)
// val margins = json.parse(Margins.serializer(), jsonString)

package Margins

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class Margins (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    val commodity: Ity? = null,
    val equity: Ity? = null
)

@Serializable
data class Ity (
    val available: Available? = null,
    val enabled: Boolean? = null,
    val net: Double? = null,
    val utilised: Map<String, Double>? = null
)

@Serializable
data class Available (
    @SerialName("adhoc_margin")
    val adhocMargin: Long? = null,

    val cash: Double? = null,
    val collateral: Long? = null,

    @SerialName("intraday_payin")
    val intradayPayin: Long? = null,

    @SerialName("live_balance")
    val liveBalance: Double? = null,

    @SerialName("opening_balance")
    val openingBalance: Double? = null
)
