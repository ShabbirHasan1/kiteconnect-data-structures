package Positions;

import com.fasterxml.jackson.annotation.*;

public class Day {
    private Double averagePrice;
    private Long buyM2M;
    private Double buyPrice;
    private Long buyQuantity;
    private Long buyValue;
    private Long closePrice;
    private Double dayBuyPrice;
    private Long dayBuyQuantity;
    private Long dayBuyValue;
    private Long daySellPrice;
    private Long daySellQuantity;
    private Long daySellValue;
    private String exchange;
    private Long instrumentToken;
    private Double lastPrice;
    private Long m2M;
    private Long multiplier;
    private Long overnightQuantity;
    private Long pnl;
    private String product;
    private Long quantity;
    private Long realised;
    private Long sellM2M;
    private Long sellPrice;
    private Long sellQuantity;
    private Long sellValue;
    private String tradingsymbol;
    private Long unrealised;
    private Long value;

    @JsonProperty("average_price")
    public Double getAveragePrice() { return averagePrice; }
    @JsonProperty("average_price")
    public void setAveragePrice(Double value) { this.averagePrice = value; }

    @JsonProperty("buy_m2m")
    public Long getBuyM2M() { return buyM2M; }
    @JsonProperty("buy_m2m")
    public void setBuyM2M(Long value) { this.buyM2M = value; }

    @JsonProperty("buy_price")
    public Double getBuyPrice() { return buyPrice; }
    @JsonProperty("buy_price")
    public void setBuyPrice(Double value) { this.buyPrice = value; }

    @JsonProperty("buy_quantity")
    public Long getBuyQuantity() { return buyQuantity; }
    @JsonProperty("buy_quantity")
    public void setBuyQuantity(Long value) { this.buyQuantity = value; }

    @JsonProperty("buy_value")
    public Long getBuyValue() { return buyValue; }
    @JsonProperty("buy_value")
    public void setBuyValue(Long value) { this.buyValue = value; }

    @JsonProperty("close_price")
    public Long getClosePrice() { return closePrice; }
    @JsonProperty("close_price")
    public void setClosePrice(Long value) { this.closePrice = value; }

    @JsonProperty("day_buy_price")
    public Double getDayBuyPrice() { return dayBuyPrice; }
    @JsonProperty("day_buy_price")
    public void setDayBuyPrice(Double value) { this.dayBuyPrice = value; }

    @JsonProperty("day_buy_quantity")
    public Long getDayBuyQuantity() { return dayBuyQuantity; }
    @JsonProperty("day_buy_quantity")
    public void setDayBuyQuantity(Long value) { this.dayBuyQuantity = value; }

    @JsonProperty("day_buy_value")
    public Long getDayBuyValue() { return dayBuyValue; }
    @JsonProperty("day_buy_value")
    public void setDayBuyValue(Long value) { this.dayBuyValue = value; }

    @JsonProperty("day_sell_price")
    public Long getDaySellPrice() { return daySellPrice; }
    @JsonProperty("day_sell_price")
    public void setDaySellPrice(Long value) { this.daySellPrice = value; }

    @JsonProperty("day_sell_quantity")
    public Long getDaySellQuantity() { return daySellQuantity; }
    @JsonProperty("day_sell_quantity")
    public void setDaySellQuantity(Long value) { this.daySellQuantity = value; }

    @JsonProperty("day_sell_value")
    public Long getDaySellValue() { return daySellValue; }
    @JsonProperty("day_sell_value")
    public void setDaySellValue(Long value) { this.daySellValue = value; }

    @JsonProperty("exchange")
    public String getExchange() { return exchange; }
    @JsonProperty("exchange")
    public void setExchange(String value) { this.exchange = value; }

    @JsonProperty("instrument_token")
    public Long getInstrumentToken() { return instrumentToken; }
    @JsonProperty("instrument_token")
    public void setInstrumentToken(Long value) { this.instrumentToken = value; }

    @JsonProperty("last_price")
    public Double getLastPrice() { return lastPrice; }
    @JsonProperty("last_price")
    public void setLastPrice(Double value) { this.lastPrice = value; }

    @JsonProperty("m2m")
    public Long getM2M() { return m2M; }
    @JsonProperty("m2m")
    public void setM2M(Long value) { this.m2M = value; }

    @JsonProperty("multiplier")
    public Long getMultiplier() { return multiplier; }
    @JsonProperty("multiplier")
    public void setMultiplier(Long value) { this.multiplier = value; }

    @JsonProperty("overnight_quantity")
    public Long getOvernightQuantity() { return overnightQuantity; }
    @JsonProperty("overnight_quantity")
    public void setOvernightQuantity(Long value) { this.overnightQuantity = value; }

    @JsonProperty("pnl")
    public Long getPnl() { return pnl; }
    @JsonProperty("pnl")
    public void setPnl(Long value) { this.pnl = value; }

    @JsonProperty("product")
    public String getProduct() { return product; }
    @JsonProperty("product")
    public void setProduct(String value) { this.product = value; }

    @JsonProperty("quantity")
    public Long getQuantity() { return quantity; }
    @JsonProperty("quantity")
    public void setQuantity(Long value) { this.quantity = value; }

    @JsonProperty("realised")
    public Long getRealised() { return realised; }
    @JsonProperty("realised")
    public void setRealised(Long value) { this.realised = value; }

    @JsonProperty("sell_m2m")
    public Long getSellM2M() { return sellM2M; }
    @JsonProperty("sell_m2m")
    public void setSellM2M(Long value) { this.sellM2M = value; }

    @JsonProperty("sell_price")
    public Long getSellPrice() { return sellPrice; }
    @JsonProperty("sell_price")
    public void setSellPrice(Long value) { this.sellPrice = value; }

    @JsonProperty("sell_quantity")
    public Long getSellQuantity() { return sellQuantity; }
    @JsonProperty("sell_quantity")
    public void setSellQuantity(Long value) { this.sellQuantity = value; }

    @JsonProperty("sell_value")
    public Long getSellValue() { return sellValue; }
    @JsonProperty("sell_value")
    public void setSellValue(Long value) { this.sellValue = value; }

    @JsonProperty("tradingsymbol")
    public String getTradingsymbol() { return tradingsymbol; }
    @JsonProperty("tradingsymbol")
    public void setTradingsymbol(String value) { this.tradingsymbol = value; }

    @JsonProperty("unrealised")
    public Long getUnrealised() { return unrealised; }
    @JsonProperty("unrealised")
    public void setUnrealised(Long value) { this.unrealised = value; }

    @JsonProperty("value")
    public Long getValue() { return value; }
    @JsonProperty("value")
    public void setValue(Long value) { this.value = value; }
}
