package Ohlc;

import com.fasterxml.jackson.annotation.*;

public class Datum {
    private Long instrumentToken;
    private Long lastPrice;
    private OhlcClass ohlc;

    @JsonProperty("instrument_token")
    public Long getInstrumentToken() { return instrumentToken; }
    @JsonProperty("instrument_token")
    public void setInstrumentToken(Long value) { this.instrumentToken = value; }

    @JsonProperty("last_price")
    public Long getLastPrice() { return lastPrice; }
    @JsonProperty("last_price")
    public void setLastPrice(Long value) { this.lastPrice = value; }

    @JsonProperty("ohlc")
    public OhlcClass getOhlc() { return ohlc; }
    @JsonProperty("ohlc")
    public void setOhlc(OhlcClass value) { this.ohlc = value; }
}
