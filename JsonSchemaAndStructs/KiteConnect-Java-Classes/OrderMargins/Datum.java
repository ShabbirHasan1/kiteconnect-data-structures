package OrderMargins;

import com.fasterxml.jackson.annotation.*;

public class Datum {
    private Long additional;
    private Long bo;
    private Long cash;
    private String exchange;
    private Long exposure;
    private Long optionPremium;
    private Pnl pnl;
    private Long span;
    private Double total;
    private String tradingsymbol;
    private String type;
    private Double var;

    @JsonProperty("additional")
    public Long getAdditional() { return additional; }
    @JsonProperty("additional")
    public void setAdditional(Long value) { this.additional = value; }

    @JsonProperty("bo")
    public Long getBo() { return bo; }
    @JsonProperty("bo")
    public void setBo(Long value) { this.bo = value; }

    @JsonProperty("cash")
    public Long getCash() { return cash; }
    @JsonProperty("cash")
    public void setCash(Long value) { this.cash = value; }

    @JsonProperty("exchange")
    public String getExchange() { return exchange; }
    @JsonProperty("exchange")
    public void setExchange(String value) { this.exchange = value; }

    @JsonProperty("exposure")
    public Long getExposure() { return exposure; }
    @JsonProperty("exposure")
    public void setExposure(Long value) { this.exposure = value; }

    @JsonProperty("option_premium")
    public Long getOptionPremium() { return optionPremium; }
    @JsonProperty("option_premium")
    public void setOptionPremium(Long value) { this.optionPremium = value; }

    @JsonProperty("pnl")
    public Pnl getPnl() { return pnl; }
    @JsonProperty("pnl")
    public void setPnl(Pnl value) { this.pnl = value; }

    @JsonProperty("span")
    public Long getSpan() { return span; }
    @JsonProperty("span")
    public void setSpan(Long value) { this.span = value; }

    @JsonProperty("total")
    public Double getTotal() { return total; }
    @JsonProperty("total")
    public void setTotal(Double value) { this.total = value; }

    @JsonProperty("tradingsymbol")
    public String getTradingsymbol() { return tradingsymbol; }
    @JsonProperty("tradingsymbol")
    public void setTradingsymbol(String value) { this.tradingsymbol = value; }

    @JsonProperty("type")
    public String getType() { return type; }
    @JsonProperty("type")
    public void setType(String value) { this.type = value; }

    @JsonProperty("var")
    public Double getVar() { return var; }
    @JsonProperty("var")
    public void setVar(Double value) { this.var = value; }
}
