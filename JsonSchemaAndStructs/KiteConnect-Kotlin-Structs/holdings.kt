// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json     = Json(JsonConfiguration.Stable)
// val holdings = json.parse(Holdings.serializer(), jsonString)

package Holdings

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class Holdings (
    val data: List<Datum>? = null,
    val status: String? = null
)

@Serializable
data class Datum (
    @SerialName("authorised_date")
    val authorisedDate: String? = null,

    @SerialName("authorised_quantity")
    val authorisedQuantity: Long? = null,

    @SerialName("average_price")
    val averagePrice: Double? = null,

    @SerialName("close_price")
    val closePrice: Double? = null,

    @SerialName("collateral_quantity")
    val collateralQuantity: Long? = null,

    @SerialName("collateral_type")
    val collateralType: String? = null,

    @SerialName("day_change")
    val dayChange: Double? = null,

    @SerialName("day_change_percentage")
    val dayChangePercentage: Double? = null,

    val discrepancy: Boolean? = null,
    val exchange: String? = null,

    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    val isin: String? = null,

    @SerialName("last_price")
    val lastPrice: Double? = null,

    @SerialName("opening_quantity")
    val openingQuantity: Long? = null,

    val pnl: Double? = null,
    val price: Long? = null,
    val product: String? = null,
    val quantity: Long? = null,

    @SerialName("realised_quantity")
    val realisedQuantity: Long? = null,

    @SerialName("t1_quantity")
    val t1Quantity: Long? = null,

    val tradingsymbol: String? = null,

    @SerialName("used_quantity")
    val usedQuantity: Long? = null
)
