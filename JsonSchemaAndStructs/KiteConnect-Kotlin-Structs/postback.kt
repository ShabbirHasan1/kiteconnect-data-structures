// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json     = Json(JsonConfiguration.Stable)
// val postback = json.parse(Postback.serializer(), jsonString)

package Postback

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class Postback (
    @SerialName("app_id")
    val appID: Long? = null,

    @SerialName("average_price")
    val averagePrice: Long? = null,

    @SerialName("cancelled_quantity")
    val cancelledQuantity: Long? = null,

    val checksum: String? = null,

    @SerialName("disclosed_quantity")
    val disclosedQuantity: Long? = null,

    val exchange: String? = null,

    @SerialName("exchange_order_id")
    val exchangeOrderID: String? = null,

    @SerialName("exchange_timestamp")
    val exchangeTimestamp: String? = null,

    @SerialName("exchange_update_timestamp")
    val exchangeUpdateTimestamp: String? = null,

    @SerialName("filled_quantity")
    val filledQuantity: Long? = null,

    val guid: String? = null,

    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("market_protection")
    val marketProtection: Long? = null,

    val meta: Meta? = null,

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

    val price: Long? = null,
    val product: String? = null,
    val quantity: Long? = null,
    val status: String? = null,

    @SerialName("status_message")
    val statusMessage: JsonObject? = null,

    @SerialName("status_message_raw")
    val statusMessageRaw: JsonObject? = null,

    val tag: JsonObject? = null,
    val tradingsymbol: String? = null,

    @SerialName("transaction_type")
    val transactionType: String? = null,

    @SerialName("trigger_price")
    val triggerPrice: Long? = null,

    @SerialName("unfilled_quantity")
    val unfilledQuantity: Long? = null,

    @SerialName("user_id")
    val userID: String? = null,

    val validity: String? = null,
    val variety: String? = null
)

@Serializable
class Meta()
