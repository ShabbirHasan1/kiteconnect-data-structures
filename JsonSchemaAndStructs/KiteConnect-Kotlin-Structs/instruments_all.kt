// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json           = Json(JsonConfiguration.Stable)
// val instrumentsAll = json.parse(InstrumentsAll.serializer(), jsonString)

package InstrumentsAll

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

typealias InstrumentsAll = JsonArray<InstrumentsAllElement>

@Serializable
data class InstrumentsAllElement (
    val exchange: Exchange? = null,

    @SerialName("exchange_token")
    val exchangeToken: Long? = null,

    val expiry: String? = null,

    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("instrument_type")
    val instrumentType: InstrumentType? = null,

    @SerialName("last_price")
    val lastPrice: Double? = null,

    @SerialName("lot_size")
    val lotSize: Long? = null,

    val name: String? = null,
    val segment: Segment? = null,
    val strike: Long? = null,

    @SerialName("tick_size")
    val tickSize: Double? = null,

    val tradingsymbol: String? = null
)

@Serializable
enum class Exchange(val value: String) {
    Bse("BSE"),
    Nfo("NFO"),
    Nse("NSE");

    companion object : KSerializer<Exchange> {
        override val descriptor: SerialDescriptor get() {
            return PrimitiveSerialDescriptor("InstrumentsAll.Exchange", PrimitiveKind.STRING)
        }
        override fun deserialize(decoder: Decoder): Exchange = when (val value = decoder.decodeString()) {
            "BSE" -> Bse
            "NFO" -> Nfo
            "NSE" -> Nse
            else  -> throw IllegalArgumentException("Exchange could not parse: $value")
        }
        override fun serialize(encoder: Encoder, value: Exchange) {
            return encoder.encodeString(value.value)
        }
    }
}

@Serializable
enum class InstrumentType(val value: String) {
    Ce("CE"),
    Eq("EQ"),
    PE("PE");

    companion object : KSerializer<InstrumentType> {
        override val descriptor: SerialDescriptor get() {
            return PrimitiveSerialDescriptor("InstrumentsAll.InstrumentType", PrimitiveKind.STRING)
        }
        override fun deserialize(decoder: Decoder): InstrumentType = when (val value = decoder.decodeString()) {
            "CE" -> Ce
            "EQ" -> Eq
            "PE" -> PE
            else -> throw IllegalArgumentException("InstrumentType could not parse: $value")
        }
        override fun serialize(encoder: Encoder, value: InstrumentType) {
            return encoder.encodeString(value.value)
        }
    }
}

@Serializable
enum class Segment(val value: String) {
    Bse("BSE"),
    NfoOpt("NFO-OPT"),
    Nse("NSE");

    companion object : KSerializer<Segment> {
        override val descriptor: SerialDescriptor get() {
            return PrimitiveSerialDescriptor("InstrumentsAll.Segment", PrimitiveKind.STRING)
        }
        override fun deserialize(decoder: Decoder): Segment = when (val value = decoder.decodeString()) {
            "BSE"     -> Bse
            "NFO-OPT" -> NfoOpt
            "NSE"     -> Nse
            else      -> throw IllegalArgumentException("Segment could not parse: $value")
        }
        override fun serialize(encoder: Encoder, value: Segment) {
            return encoder.encodeString(value.value)
        }
    }
}
