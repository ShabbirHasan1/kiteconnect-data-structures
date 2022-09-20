package TickerLtp;

import com.fasterxml.jackson.annotation.*;

public class TickerLtp {
    private Long instrumentToken;
    private Long lastPrice;
    private String mode;
    private Boolean tradable;

    @JsonProperty("instrument_token")
    public Long getInstrumentToken() { return instrumentToken; }
    @JsonProperty("instrument_token")
    public void setInstrumentToken(Long value) { this.instrumentToken = value; }

    @JsonProperty("last_price")
    public Long getLastPrice() { return lastPrice; }
    @JsonProperty("last_price")
    public void setLastPrice(Long value) { this.lastPrice = value; }

    @JsonProperty("mode")
    public String getMode() { return mode; }
    @JsonProperty("mode")
    public void setMode(String value) { this.mode = value; }

    @JsonProperty("tradable")
    public Boolean getTradable() { return tradable; }
    @JsonProperty("tradable")
    public void setTradable(Boolean value) { this.tradable = value; }
}
