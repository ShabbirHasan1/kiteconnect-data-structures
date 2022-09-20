package InstrumentsNse;

import com.fasterxml.jackson.annotation.*;

public class InstrumentsNse {
    private Exchange exchange;
    private Long exchangeToken;
    private String expiry;
    private Long instrumentToken;
    private InstrumentType instrumentType;
    private Long lastPrice;
    private Long lotSize;
    private String name;
    private Exchange segment;
    private Long strike;
    private Double tickSize;
    private String tradingsymbol;

    @JsonProperty("exchange")
    public Exchange getExchange() { return exchange; }
    @JsonProperty("exchange")
    public void setExchange(Exchange value) { this.exchange = value; }

    @JsonProperty("exchange_token")
    public Long getExchangeToken() { return exchangeToken; }
    @JsonProperty("exchange_token")
    public void setExchangeToken(Long value) { this.exchangeToken = value; }

    @JsonProperty("expiry")
    public String getExpiry() { return expiry; }
    @JsonProperty("expiry")
    public void setExpiry(String value) { this.expiry = value; }

    @JsonProperty("instrument_token")
    public Long getInstrumentToken() { return instrumentToken; }
    @JsonProperty("instrument_token")
    public void setInstrumentToken(Long value) { this.instrumentToken = value; }

    @JsonProperty("instrument_type")
    public InstrumentType getInstrumentType() { return instrumentType; }
    @JsonProperty("instrument_type")
    public void setInstrumentType(InstrumentType value) { this.instrumentType = value; }

    @JsonProperty("last_price")
    public Long getLastPrice() { return lastPrice; }
    @JsonProperty("last_price")
    public void setLastPrice(Long value) { this.lastPrice = value; }

    @JsonProperty("lot_size")
    public Long getLotSize() { return lotSize; }
    @JsonProperty("lot_size")
    public void setLotSize(Long value) { this.lotSize = value; }

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("segment")
    public Exchange getSegment() { return segment; }
    @JsonProperty("segment")
    public void setSegment(Exchange value) { this.segment = value; }

    @JsonProperty("strike")
    public Long getStrike() { return strike; }
    @JsonProperty("strike")
    public void setStrike(Long value) { this.strike = value; }

    @JsonProperty("tick_size")
    public Double getTickSize() { return tickSize; }
    @JsonProperty("tick_size")
    public void setTickSize(Double value) { this.tickSize = value; }

    @JsonProperty("tradingsymbol")
    public String getTradingsymbol() { return tradingsymbol; }
    @JsonProperty("tradingsymbol")
    public void setTradingsymbol(String value) { this.tradingsymbol = value; }
}
