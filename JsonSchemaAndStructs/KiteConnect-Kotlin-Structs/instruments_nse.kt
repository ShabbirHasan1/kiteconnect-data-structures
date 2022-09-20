// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json           = Json(JsonConfiguration.Stable)
// val instrumentsNse = json.parse(InstrumentsNse.serializer(), jsonString)

package InstrumentsNse

import kotlinx.serialization.*
import kotlinx.serialization.json.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

typealias InstrumentsNse = JsonArray<InstrumentsNseElement>

@Serializable
data class InstrumentsNseElement (
    val exchange: Exchange? = null,

    @SerialName("exchange_token")
    val exchangeToken: Long? = null,

    val expiry: String? = null,

    @SerialName("instrument_token")
    val instrumentToken: Long? = null,

    @SerialName("instrument_type")
    val instrumentType: InstrumentType? = null,

    @SerialName("last_price")
    val lastPrice: Long? = null,

    @SerialName("lot_size")
    val lotSize: Long? = null,

    val name: String? = null,
    val segment: Exchange? = null,
    val strike: Long? = null,

    @SerialName("tick_size")
    val tickSize: Double? = null,

    val tradingsymbol: String? = null
)

@Serializable
enum class Exchange(val value: String) {
    Nse("NSE");

    companion object : KSerializer<Exchange> {
        override val descriptor: SerialDescriptor get() {
            return PrimitiveSerialDescriptor("InstrumentsNse.Exchange", PrimitiveKind.STRING)
        }
        override fun deserialize(decoder: Decoder): Exchange = when (val value = decoder.decodeString()) {
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
    Eq("EQ");

    companion object : KSerializer<InstrumentType> {
        override val descriptor: SerialDescriptor get() {
            return PrimitiveSerialDescriptor("InstrumentsNse.InstrumentType", PrimitiveKind.STRING)
        }
        override fun deserialize(decoder: Decoder): InstrumentType = when (val value = decoder.decodeString()) {
            "EQ" -> Eq
            else -> throw IllegalArgumentException("InstrumentType could not parse: $value")
        }
        override fun serialize(encoder: Encoder, value: InstrumentType) {
            return encoder.encodeString(value.value)
        }
    }
}
