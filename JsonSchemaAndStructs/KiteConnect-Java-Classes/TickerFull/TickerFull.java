package TickerFull;

import com.fasterxml.jackson.annotation.*;

public class TickerFull {
    private Double averageTradedPrice;
    private Double change;
    private Depth depth;
    private String exchangeTimestamp;
    private Long instrumentToken;
    private Long lastPrice;
    private String lastTradeTime;
    private Long lastTradedQuantity;
    private String mode;
    private Ohlc ohlc;
    private Long oi;
    private Long oiDayHigh;
    private Long oiDayLow;
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

    @JsonProperty("depth")
    public Depth getDepth() { return depth; }
    @JsonProperty("depth")
    public void setDepth(Depth value) { this.depth = value; }

    @JsonProperty("exchange_timestamp")
    public String getExchangeTimestamp() { return exchangeTimestamp; }
    @JsonProperty("exchange_timestamp")
    public void setExchangeTimestamp(String value) { this.exchangeTimestamp = value; }

    @JsonProperty("instrument_token")
    public Long getInstrumentToken() { return instrumentToken; }
    @JsonProperty("instrument_token")
    public void setInstrumentToken(Long value) { this.instrumentToken = value; }

    @JsonProperty("last_price")
    public Long getLastPrice() { return lastPrice; }
    @JsonProperty("last_price")
    public void setLastPrice(Long value) { this.lastPrice = value; }

    @JsonProperty("last_trade_time")
    public String getLastTradeTime() { return lastTradeTime; }
    @JsonProperty("last_trade_time")
    public void setLastTradeTime(String value) { this.lastTradeTime = value; }

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

    @JsonProperty("oi")
    public Long getOi() { return oi; }
    @JsonProperty("oi")
    public void setOi(Long value) { this.oi = value; }

    @JsonProperty("oi_day_high")
    public Long getOiDayHigh() { return oiDayHigh; }
    @JsonProperty("oi_day_high")
    public void setOiDayHigh(Long value) { this.oiDayHigh = value; }

    @JsonProperty("oi_day_low")
    public Long getOiDayLow() { return oiDayLow; }
    @JsonProperty("oi_day_low")
    public void setOiDayLow(Long value) { this.oiDayLow = value; }

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
