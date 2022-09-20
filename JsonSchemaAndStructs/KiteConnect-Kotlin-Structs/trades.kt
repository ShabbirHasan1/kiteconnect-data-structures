// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json   = Json(JsonConfiguration.Stable)
// val trades = json.parse(Trades.serializer(), jsonString)

package Trades

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class Trades (
    val data: List<Datum>? = null,
    val status: String? = null
)

@Serializable
data class Datum (
    @SerialName("average_price")
    val averagePrice: Double? = null,

    val exchange: String? = null,

    @SerialName("exchange_order_id")
    val exchangeOrderID: String? = null,

    @SerialName("exchange_timestamp")
    val exchangeTimestamp: String? = null,

    @SerialName("fill_timestamp")
    val fillTimestamp: String? = null,

    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("order_id")
    val orderID: String? = null,

    @SerialName("order_timestamp")
    val orderTimestamp: String? = null,

    val product: String? = null,
    val quantity: Long? = null,

    @SerialName("trade_id")
    val tradeID: String? = null,

    val tradingsymbol: String? = null,

    @SerialName("transaction_type")
    val transactionType: String? = null
)
