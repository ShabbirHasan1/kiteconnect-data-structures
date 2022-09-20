// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json        = Json(JsonConfiguration.Stable)
// val gttGetOrder = json.parse(GttGetOrder.serializer(), jsonString)

package GttGetOrder

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class GttGetOrder (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    val condition: Condition? = null,

    @SerialName("created_at")
    val createdAt: String? = null,

    @SerialName("expires_at")
    val expiresAt: String? = null,

    val id: Long? = null,
    val meta: JsonObject? = null,
    val orders: List<Order>? = null,

    @SerialName("parent_trigger")
    val parentTrigger: JsonObject? = null,

    val status: String? = null,
    val type: String? = null,

    @SerialName("updated_at")
    val updatedAt: String? = null,

    @SerialName("user_id")
    val userID: String? = null
)

@Serializable
data class Condition (
    val exchange: String? = null,

    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("last_price")
    val lastPrice: Double? = null,

    val tradingsymbol: String? = null,

    @SerialName("trigger_values")
    val triggerValues: List<Double>? = null
)

@Serializable
data class Order (
    val exchange: String? = null,

    @SerialName("order_type")
    val orderType: String? = null,

    val price: Long? = null,
    val product: String? = null,
    val quantity: Long? = null,
    val result: Result? = null,
    val tradingsymbol: String? = null,

    @SerialName("transaction_type")
    val transactionType: String? = null
)

@Serializable
data class Result (
    @SerialName("account_id")
    val accountID: String? = null,

    val exchange: String? = null,
    val meta: String? = null,

    @SerialName("order_result")
    val orderResult: OrderResult? = null,

    @SerialName("order_type")
    val orderType: String? = null,

    val price: Long? = null,
    val product: String? = null,
    val quantity: Long? = null,
    val timestamp: String? = null,
    val tradingsymbol: String? = null,

    @SerialName("transaction_type")
    val transactionType: String? = null,

    @SerialName("triggered_at")
    val triggeredAt: Double? = null,

    val validity: String? = null
)

@Serializable
data class OrderResult (
    @SerialName("order_id")
    val orderID: String? = null,

    @SerialName("rejection_reason")
    val rejectionReason: String? = null,

    val status: String? = null
)
