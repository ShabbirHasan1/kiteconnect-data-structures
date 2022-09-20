package TickerQuote;

import com.fasterxml.jackson.annotation.*;

public class TickerQuote {
    private Double averageTradedPrice;
    private Double change;
    private Long instrumentToken;
    private Long lastPrice;
    private Long lastTradedQuantity;
    private String mode;
    private Ohlc ohlc;
    private Long totalBuyQuantity;
    private Long totalSellQuantity;
    private Boolean tradable;
    private Long volumeTraded;

    @JsonProperty("average_traded_price")
    public Double getAverageTradedPrice() { return averageTradedPrice; }
    @JsonProperty("average_traded_price")
    public void setAverageTradedPrice(Double value) { this.averageTradedPrice = value; }

    @JsonProperty("change")
    public Double getChange() { return change; }
    @JsonProperty("change")
    public void setChange(Double value) { this.change = value; }

    @JsonProperty("instrument_token")
    public Long getInstrumentToken() { return instrumentToken; }
    @JsonProperty("instrument_token")
    public void setInstrumentToken(Long value) { this.instrumentToken = value; }

    @JsonProperty("last_price")
    public Long getLastPrice() { return lastPrice; }
    @JsonProperty("last_price")
    public void setLastPrice(Long value) { this.lastPrice = value; }

    @JsonProperty("last_traded_quantity")
    public Long getLastTradedQuantity() { return lastTradedQuantity; }
    @JsonProperty("last_traded_quantity")
    public void setLastTradedQuantity(Long value) { this.lastTradedQuantity = value; }

    @JsonProperty("mode")
    public String getMode() { return mode; }
    @JsonProperty("mode")
    public void setMode(String value) { this.mode = value; }

    @JsonProperty("ohlc")
    public Ohlc getOhlc() { return ohlc; }
    @JsonProperty("ohlc")
    public void setOhlc(Ohlc value) { this.ohlc = value; }

    @JsonProperty("total_buy_quantity")
    public Long getTotalBuyQuantity() { return totalBuyQuantity; }
    @JsonProperty("total_buy_quantity")
    public void setTotalBuyQuantity(Long value) { this.totalBuyQuantity = value; }

    @JsonProperty("total_sell_quantity")
    public Long getTotalSellQuantity() { return totalSellQuantity; }
    @JsonProperty("total_sell_quantity")
    public void setTotalSellQuantity(Long value) { this.totalSellQuantity = value; }

    @JsonProperty("tradable")
    public Boolean getTradable() { return tradable; }
    @JsonProperty("tradable")
    public void setTradable(Boolean value) { this.tradable = value; }

    @JsonProperty("volume_traded")
    public Long getVolumeTraded() { return volumeTraded; }
    @JsonProperty("volume_traded")
    public void setVolumeTraded(Long value) { this.volumeTraded = value; }
}
