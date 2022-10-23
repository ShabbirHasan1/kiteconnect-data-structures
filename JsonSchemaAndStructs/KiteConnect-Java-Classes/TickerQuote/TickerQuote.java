package TickerQuote;

import com.fasterxml.jackson.annotation.*;

public class TickerQuote {
    private Double averagePrice;
    private Long buyQuantity;
    private Double change;
    private Long instrumentToken;
    private Double lastPrice;
    private Long lastQuantity;
    private String mode;
    private Ohlc ohlc;
    private Long sellQuantity;
    private Boolean tradable;
    private Long volume;

    @JsonProperty("average_price")
    public Double getAveragePrice() { return averagePrice; }
    @JsonProperty("average_price")
    public void setAveragePrice(Double value) { this.averagePrice = value; }

    @JsonProperty("buy_quantity")
    public Long getBuyQuantity() { return buyQuantity; }
    @JsonProperty("buy_quantity")
    public void setBuyQuantity(Long value) { this.buyQuantity = value; }

    @JsonProperty("change")
    public Double getChange() { return change; }
    @JsonProperty("change")
    public void setChange(Double value) { this.change = value; }

    @JsonProperty("instrument_token")
    public Long getInstrumentToken() { return instrumentToken; }
    @JsonProperty("instrument_token")
    public void setInstrumentToken(Long value) { this.instrumentToken = value; }

    @JsonProperty("last_price")
    public Double getLastPrice() { return lastPrice; }
    @JsonProperty("last_price")
    public void setLastPrice(Double value) { this.lastPrice = value; }

    @JsonProperty("last_quantity")
    public Long getLastQuantity() { return lastQuantity; }
    @JsonProperty("last_quantity")
    public void setLastQuantity(Long value) { this.lastQuantity = value; }

    @JsonProperty("mode")
    public String getMode() { return mode; }
    @JsonProperty("mode")
    public void setMode(String value) { this.mode = value; }

    @JsonProperty("ohlc")
    public Ohlc getOhlc() { return ohlc; }
    @JsonProperty("ohlc")
    public void setOhlc(Ohlc value) { this.ohlc = value; }

    @JsonProperty("sell_quantity")
    public Long getSellQuantity() { return sellQuantity; }
    @JsonProperty("sell_quantity")
    public void setSellQuantity(Long value) { this.sellQuantity = value; }

    @JsonProperty("tradable")
    public Boolean getTradable() { return tradable; }
    @JsonProperty("tradable")
    public void setTradable(Boolean value) { this.tradable = value; }

    @JsonProperty("volume")
    public Long getVolume() { return volume; }
    @JsonProperty("volume")
    public void setVolume(Long value) { this.volume = value; }
}
