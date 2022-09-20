// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json      = Json(JsonConfiguration.Stable)
// val positions = json.parse(Positions.serializer(), jsonString)

package Positions

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

@Serializable
data class Positions (
    val data: Data? = null,
    val status: String? = null
)

@Serializable
data class Data (
    val day: List<Day>? = null,
    val net: List<Day>? = null
)

@Serializable
data class Day (
    @SerialName("average_price")
    val averagePrice: Double? = null,

    @SerialName("buy_m2m")
    val buyM2M: Long? = null,

    @SerialName("buy_price")
    val buyPrice: Double? = null,

    @SerialName("buy_quantity")
    val buyQuantity: Long? = null,

    @SerialName("buy_value")
    val buyValue: Long? = null,

    @SerialName("close_price")
    val closePrice: Long? = null,

    @SerialName("day_buy_price")
    val dayBuyPrice: Double? = null,

    @SerialName("day_buy_quantity")
    val dayBuyQuantity: Long? = null,

    @SerialName("day_buy_value")
    val dayBuyValue: Long? = null,

    @SerialName("day_sell_price")
    val daySellPrice: Long? = null,

    @SerialName("day_sell_quantity")
    val daySellQuantity: Long? = null,

    @SerialName("day_sell_value")
    val daySellValue: Long? = null,

    val exchange: String? = null,

    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("last_price")
    val lastPrice: Double? = null,

    @SerialName("m2m")
    val m2M: Long? = null,

    val multiplier: Long? = null,

    @SerialName("overnight_quantity")
    val overnightQuantity: Long? = null,

    val pnl: Long? = null,
    val product: String? = null,
    val quantity: Long? = null,
    val realised: Long? = null,

    @SerialName("sell_m2m")
    val sellM2M: Long? = null,

    @SerialName("sell_price")
    val sellPrice: Long? = null,

    @SerialName("sell_quantity")
    val sellQuantity: Long? = null,

    @SerialName("sell_value")
    val sellValue: Long? = null,

    val tradingsymbol: String? = null,
    val unrealised: Long? = null,
    val value: Long? = null
)
