// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json       = Json(JsonConfiguration.Stable)
// val mFHoldings = json.parse(MFHoldings.serializer(), jsonString)

package MfHoldings

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class MFHoldings (
    val data: List<Datum>? = null,
    val status: String? = null
)

@Serializable
data class Datum (
    @SerialName("average_price")
    val averagePrice: Double? = null,

    val folio: String? = null,
    val fund: String? = null,

    @SerialName("last_price")
    val lastPrice: Double? = null,

    @SerialName("last_price_date")
    val lastPriceDate: String? = null,

    @SerialName("pledged_quantity")
    val pledgedQuantity: Long? = null,

    val pnl: Long? = null,
    val quantity: Double? = null,
    val tradingsymbol: String? = null
)
