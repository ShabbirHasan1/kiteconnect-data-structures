package MfHoldings;

import com.fasterxml.jackson.annotation.*;

public class Datum {
    private Double averagePrice;
    private String folio;
    private String fund;
    private Double lastPrice;
    private String lastPriceDate;
    private Long pledgedQuantity;
    private Long pnl;
    private Double quantity;
    private String tradingsymbol;

    @JsonProperty("average_price")
    public Double getAveragePrice() { return averagePrice; }
    @JsonProperty("average_price")
    public void setAveragePrice(Double value) { this.averagePrice = value; }

    @JsonProperty("folio")
    public String getFolio() { return folio; }
    @JsonProperty("folio")
    public void setFolio(String value) { this.folio = value; }

    @JsonProperty("fund")
    public String getFund() { return fund; }
    @JsonProperty("fund")
    public void setFund(String value) { this.fund = value; }

    @JsonProperty("last_price")
    public Double getLastPrice() { return lastPrice; }
    @JsonProperty("last_price")
    public void setLastPrice(Double value) { this.lastPrice = value; }

    @JsonProperty("last_price_date")
    public String getLastPriceDate() { return lastPriceDate; }
    @JsonProperty("last_price_date")
    public void setLastPriceDate(String value) { this.lastPriceDate = value; }

    @JsonProperty("pledged_quantity")
    public Long getPledgedQuantity() { return pledgedQuantity; }
    @JsonProperty("pledged_quantity")
    public void setPledgedQuantity(Long value) { this.pledgedQuantity = value; }

    @JsonProperty("pnl")
    public Long getPnl() { return pnl; }
    @JsonProperty("pnl")
    public void setPnl(Long value) { this.pnl = value; }

    @JsonProperty("quantity")
    public Double getQuantity() { return quantity; }
    @JsonProperty("quantity")
    public void setQuantity(Double value) { this.quantity = value; }

    @JsonProperty("tradingsymbol")
    public String getTradingsymbol() { return tradingsymbol; }
    @JsonProperty("tradingsymbol")
    public void setTradingsymbol(String value) { this.tradingsymbol = value; }
}
