package MarginsEquity;

import com.fasterxml.jackson.annotation.*;

public class Available {
    private Long adhocMargin;
    private Double cash;
    private Long collateral;
    private Long intradayPayin;
    private Double liveBalance;
    private Double openingBalance;

    @JsonProperty("adhoc_margin")
    public Long getAdhocMargin() { return adhocMargin; }
    @JsonProperty("adhoc_margin")
    public void setAdhocMargin(Long value) { this.adhocMargin = value; }

    @JsonProperty("cash")
    public Double getCash() { return cash; }
    @JsonProperty("cash")
    public void setCash(Double value) { this.cash = value; }

    @JsonProperty("collateral")
    public Long getCollateral() { return collateral; }
    @JsonProperty("collateral")
    public void setCollateral(Long value) { this.collateral = value; }

    @JsonProperty("intraday_payin")
    public Long getIntradayPayin() { return intradayPayin; }
    @JsonProperty("intraday_payin")
    public void setIntradayPayin(Long value) { this.intradayPayin = value; }

    @JsonProperty("live_balance")
    public Double getLiveBalance() { return liveBalance; }
    @JsonProperty("live_balance")
    public void setLiveBalance(Double value) { this.liveBalance = value; }

    @JsonProperty("opening_balance")
    public Double getOpeningBalance() { return openingBalance; }
    @JsonProperty("opening_balance")
    public void setOpeningBalance(Double value) { this.openingBalance = value; }
}
