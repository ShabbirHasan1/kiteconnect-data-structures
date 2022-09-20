// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json         = Json(JsonConfiguration.Stable)
// val orderMargins = json.parse(OrderMargins.serializer(), jsonString)

package OrderMargins

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class OrderMargins (
    val data: List<Datum>? = null,
    val status: String? = null
)

@Serializable
data class Datum (
    val additional: Long? = null,
    val bo: Long? = null,
    val cash: Long? = null,
    val exchange: String? = null,
    val exposure: Long? = null,

    @SerialName("option_premium")
    val optionPremium: Long? = null,

    val pnl: Pnl? = null,
    val span: Long? = null,
    val total: Double? = null,
    val tradingsymbol: String? = null,
    val type: String? = null,

    @SerialName("var")
    val datumVar: Double? = null
)

@Serializable
data class Pnl (
    val realised: Long? = null,
    val unrealised: Long? = null
)
