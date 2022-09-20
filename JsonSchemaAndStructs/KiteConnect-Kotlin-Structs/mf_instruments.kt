// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json          = Json(JsonConfiguration.Stable)
// val mFInstruments = json.parse(MFInstruments.serializer(), jsonString)

package MfInstruments

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

typealias MFInstruments = JsonArray<MFInstrument>

@Serializable
data class MFInstrument (
    val amc: Amc? = null,

    @SerialName("dividend_type")
    val dividendType: DividendType? = null,

    @SerialName("last_price")
    val lastPrice: Double? = null,

    @SerialName("last_price_date")
    val lastPriceDate: String? = null,

    @SerialName("minimum_additional_purchase_amount")
    val minimumAdditionalPurchaseAmount: Long? = null,

    @SerialName("minimum_purchase_amount")
    val minimumPurchaseAmount: Long? = null,

    @SerialName("minimum_redemption_quantity")
    val minimumRedemptionQuantity: Double? = null,

    val name: String? = null,
    val plan: Plan? = null,

    @SerialName("purchase_allowed")
    val purchaseAllowed: Long? = null,

    @SerialName("purchase_amount_multiplier")
    val purchaseAmountMultiplier: Long? = null,

    @SerialName("redemption_allowed")
    val redemptionAllowed: Long? = null,

    @SerialName("redemption_quantity_multiplier")
    val redemptionQuantityMultiplier: Double? = null,

    @SerialName("scheme_type")
    val schemeType: SchemeType? = null,

    @SerialName("settlement_type")
    val settlementType: SettlementType? = null,

    val tradingsymbol: String? = null
)

@Serializable
enum class Amc(val value: String) {
    BirlaSunLifeMutualFundMF("BirlaSunLifeMutualFund_MF");

    companion object : KSerializer<Amc> {
        override val descriptor: SerialDescriptor get() {
            return PrimitiveSerialDescriptor("MfInstruments.Amc", PrimitiveKind.STRING)
        }
        override fun deserialize(decoder: Decoder): Amc = when (val value = decoder.decodeString()) {
            "BirlaSunLifeMutualFund_MF" -> BirlaSunLifeMutualFundMF
            else                        -> throw IllegalArgumentException("Amc could not parse: $value")
        }
        override fun serialize(encoder: Encoder, value: Amc) {
            return encoder.encodeString(value.value)
        }
    }
}

@Serializable
enum class DividendType(val value: String) {
    Growth("growth"),
    Payout("payout");

    companion object : KSerializer<DividendType> {
        override val descriptor: SerialDescriptor get() {
            return PrimitiveSerialDescriptor("MfInstruments.DividendType", PrimitiveKind.STRING)
        }
        override fun deserialize(decoder: Decoder): DividendType = when (val value = decoder.decodeString()) {
            "growth" -> Growth
            "payout" -> Payout
            else     -> throw IllegalArgumentException("DividendType could not parse: $value")
        }
        override fun serialize(encoder: Encoder, value: DividendType) {
            return encoder.encodeString(value.value)
        }
    }
}

@Serializable
enum class Plan(val value: String) {
    Direct("direct"),
    Regular("regular");

    companion object : KSerializer<Plan> {
        override val descriptor: SerialDescriptor get() {
            return PrimitiveSerialDescriptor("MfInstruments.Plan", PrimitiveKind.STRING)
        }
        override fun deserialize(decoder: Decoder): Plan = when (val value = decoder.decodeString()) {
            "direct"  -> Direct
            "regular" -> Regular
            else      -> throw IllegalArgumentException("Plan could not parse: $value")
        }
        override fun serialize(encoder: Encoder, value: Plan) {
            return encoder.encodeString(value.value)
        }
    }
}

@Serializable
enum class SchemeType(val value: String) {
    Balanced("balanced"),
    Debt("debt"),
    Equity("equity"),
    Fof("fof"),
    Liquid("liquid");

    companion object : KSerializer<SchemeType> {
        override val descriptor: SerialDescriptor get() {
            return PrimitiveSerialDescriptor("MfInstruments.SchemeType", PrimitiveKind.STRING)
        }
        override fun deserialize(decoder: Decoder): SchemeType = when (val value = decoder.decodeString()) {
            "balanced" -> Balanced
            "debt"     -> Debt
            "equity"   -> Equity
            "fof"      -> Fof
            "liquid"   -> Liquid
            else       -> throw IllegalArgumentException("SchemeType could not parse: $value")
        }
        override fun serialize(encoder: Encoder, value: SchemeType) {
            return encoder.encodeString(value.value)
        }
    }
}

@Serializable
enum class SettlementType(val value: String) {
    T1("T1"),
    T3("T3"),
    T4("T4"),
    T6("T6");

    companion object : KSerializer<SettlementType> {
        override val descriptor: SerialDescriptor get() {
            return PrimitiveSerialDescriptor("MfInstruments.SettlementType", PrimitiveKind.STRING)
        }
        override fun deserialize(decoder: Decoder): SettlementType = when (val value = decoder.decodeString()) {
            "T1" -> T1
            "T3" -> T3
            "T4" -> T4
            "T6" -> T6
            else -> throw IllegalArgumentException("SettlementType could not parse: $value")
        }
        override fun serialize(encoder: Encoder, value: SettlementType) {
            return encoder.encodeString(value.value)
        }
    }
}
