// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json         = Json(JsonConfiguration.Stable)
// val mFOrdersInfo = json.parse(MFOrdersInfo.serializer(), jsonString)

package MfOrdersInfo

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class MFOrdersInfo (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    val amount: Long? = null,

    @SerialName("average_price")
    val averagePrice: Long? = null,

    @SerialName("exchange_order_id")
    val exchangeOrderID: JsonObject? = null,

    @SerialName("exchange_timestamp")
    val exchangeTimestamp: JsonObject? = null,

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
    val settlementID: JsonObject? = null,

    val status: String? = null,

    @SerialName("status_message")
    val statusMessage: String? = null,

    val tag: JsonObject? = null,
    val tradingsymbol: String? = null,

    @SerialName("transaction_type")
    val transactionType: String? = null,

    val variety: String? = null
)
