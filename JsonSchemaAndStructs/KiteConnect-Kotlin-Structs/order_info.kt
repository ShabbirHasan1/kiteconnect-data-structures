// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json      = Json(JsonConfiguration.Stable)
// val orderInfo = json.parse(OrderInfo.serializer(), jsonString)

package OrderInfo

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class OrderInfo (
    val data: List<Datum>? = null,
    val status: String? = null
)

@Serializable
data class Datum (
    @SerialName("average_price")
    val averagePrice: Long? = null,

    @SerialName("cancelled_quantity")
    val cancelledQuantity: Long? = null,

    @SerialName("disclosed_quantity")
    val disclosedQuantity: Long? = null,

    val exchange: String? = null,

    @SerialName("exchange_order_id")
    val exchangeOrderID: String? = null,

    @SerialName("exchange_timestamp")
    val exchangeTimestamp: String? = null,

    @SerialName("filled_quantity")
    val filledQuantity: Long? = null,

    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("order_id")
    val orderID: String? = null,

    @SerialName("order_timestamp")
    val orderTimestamp: String? = null,

    @SerialName("order_type")
    val orderType: String? = null,

    @SerialName("parent_order_id")
    val parentOrderID: JsonObject? = null,

    @SerialName("pending_quantity")
    val pendingQuantity: Long? = null,

    @SerialName("placed_by")
    val placedBy: String? = null,

    val price: Double? = null,
    val product: String? = null,
    val quantity: Long? = null,
    val status: String? = null,

    @SerialName("status_message")
    val statusMessage: JsonObject? = null,

    val tag: JsonObject? = null,
    val tradingsymbol: String? = null,

    @SerialName("transaction_type")
    val transactionType: String? = null,

    @SerialName("trigger_price")
    val triggerPrice: Long? = null,

    val validity: String? = null,
    val variety: String? = null
)
