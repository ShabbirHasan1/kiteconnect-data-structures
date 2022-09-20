// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json          = Json(JsonConfiguration.Stable)
// val basketMargins = json.parse(BasketMargins.serializer(), jsonString)

package BasketMargins

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class BasketMargins (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    val final: Final? = null,
    val initial: Final? = null,
    val orders: List<Final>? = null
)

@Serializable
data class Final (
    val additional: Long? = null,
    val bo: Long? = null,
    val cash: Long? = null,
    val exchange: String? = null,
    val exposure: Double? = null,

    @SerialName("option_premium")
    val optionPremium: Double? = null,

    val pnl: Pnl? = null,
    val span: Double? = null,
    val total: Double? = null,
    val tradingsymbol: String? = null,
    val type: String? = null,

    @SerialName("var")
    val finalVar: Long? = null
)

@Serializable
data class Pnl (
    val realised: Long? = null,
    val unrealised: Long? = null
)
