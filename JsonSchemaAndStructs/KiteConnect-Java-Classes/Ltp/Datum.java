package Ltp;

import com.fasterxml.jackson.annotation.*;

public class Datum {
    private Long instrumentToken;
    private Double lastPrice;

    @JsonProperty("instrument_token")
    public Long getInstrumentToken() { return instrumentToken; }
    @JsonProperty("instrument_token")
    public void setInstrumentToken(Long value) { this.instrumentToken = value; }

    @JsonProperty("last_price")
    public Double getLastPrice() { return lastPrice; }
    @JsonProperty("last_price")
    public void setLastPrice(Double value) { this.lastPrice = value; }
}
