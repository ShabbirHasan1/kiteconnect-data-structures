// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json     = Json(JsonConfiguration.Stable)
// val mFOrders = json.parse(MFOrders.serializer(), jsonString)

package MfOrders

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class MFOrders (
    val data: List<Datum>? = null,
    val status: String? = null
)

@Serializable
data class Datum (
    val amount: Long? = null,

    @SerialName("average_price")
    val averagePrice: Long? = null,

    @SerialName("exchange_order_id")
    val exchangeOrderID: String? = null,

    @SerialName("exchange_timestamp")
    val exchangeTimestamp: String? = null,

    val folio: JsonObject? = null,
    val fund: String? = null,

    @SerialName("last_price")
    val lastPrice: Double? = null,

    @SerialName("last_price_date")
    val lastPriceDate: String? = null,

    @SerialName("order_id")
    val orderID: String? = null,

    @SerialName("order_timestamp")
    val orderTimestamp: String? = null,

    @SerialName("placed_by")
    val placedBy: String? = null,

    @SerialName("purchase_type")
    val purchaseType: String? = null,

    val quantity: Long? = null,

    @SerialName("settlement_id")
    val settlementID: String? = null,

    val status: String? = null,

    @SerialName("status_message")
    val statusMessage: String? = null,

    val tag: String? = null,
    val tradingsymbol: String? = null,

    @SerialName("transaction_type")
    val transactionType: String? = null,

    val variety: String? = null
)
