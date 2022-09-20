package MfInstruments;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;

public class MFInstruments {
    private Amc amc;
    private DividendType dividendType;
    private Double lastPrice;
    private LocalDate lastPriceDate;
    private Long minimumAdditionalPurchaseAmount;
    private Long minimumPurchaseAmount;
    private Double minimumRedemptionQuantity;
    private String name;
    private Plan plan;
    private Long purchaseAllowed;
    private Long purchaseAmountMultiplier;
    private Long redemptionAllowed;
    private Double redemptionQuantityMultiplier;
    private SchemeType schemeType;
    private SettlementType settlementType;
    private String tradingsymbol;

    @JsonProperty("amc")
    public Amc getAmc() { return amc; }
    @JsonProperty("amc")
    public void setAmc(Amc value) { this.amc = value; }

    @JsonProperty("dividend_type")
    public DividendType getDividendType() { return dividendType; }
    @JsonProperty("dividend_type")
    public void setDividendType(DividendType value) { this.dividendType = value; }

    @JsonProperty("last_price")
    public Double getLastPrice() { return lastPrice; }
    @JsonProperty("last_price")
    public void setLastPrice(Double value) { this.lastPrice = value; }

    @JsonProperty("last_price_date")
    public LocalDate getLastPriceDate() { return lastPriceDate; }
    @JsonProperty("last_price_date")
    public void setLastPriceDate(LocalDate value) { this.lastPriceDate = value; }

    @JsonProperty("minimum_additional_purchase_amount")
    public Long getMinimumAdditionalPurchaseAmount() { return minimumAdditionalPurchaseAmount; }
    @JsonProperty("minimum_additional_purchase_amount")
    public void setMinimumAdditionalPurchaseAmount(Long value) { this.minimumAdditionalPurchaseAmount = value; }

    @JsonProperty("minimum_purchase_amount")
    public Long getMinimumPurchaseAmount() { return minimumPurchaseAmount; }
    @JsonProperty("minimum_purchase_amount")
    public void setMinimumPurchaseAmount(Long value) { this.minimumPurchaseAmount = value; }

    @JsonProperty("minimum_redemption_quantity")
    public Double getMinimumRedemptionQuantity() { return minimumRedemptionQuantity; }
    @JsonProperty("minimum_redemption_quantity")
    public void setMinimumRedemptionQuantity(Double value) { this.minimumRedemptionQuantity = value; }

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("plan")
    public Plan getPlan() { return plan; }
    @JsonProperty("plan")
    public void setPlan(Plan value) { this.plan = value; }

    @JsonProperty("purchase_allowed")
    public Long getPurchaseAllowed() { return purchaseAllowed; }
    @JsonProperty("purchase_allowed")
    public void setPurchaseAllowed(Long value) { this.purchaseAllowed = value; }

    @JsonProperty("purchase_amount_multiplier")
    public Long getPurchaseAmountMultiplier() { return purchaseAmountMultiplier; }
    @JsonProperty("purchase_amount_multiplier")
    public void setPurchaseAmountMultiplier(Long value) { this.purchaseAmountMultiplier = value; }

    @JsonProperty("redemption_allowed")
    public Long getRedemptionAllowed() { return redemptionAllowed; }
    @JsonProperty("redemption_allowed")
    public void setRedemptionAllowed(Long value) { this.redemptionAllowed = value; }

    @JsonProperty("redemption_quantity_multiplier")
    public Double getRedemptionQuantityMultiplier() { return redemptionQuantityMultiplier; }
    @JsonProperty("redemption_quantity_multiplier")
    public void setRedemptionQuantityMultiplier(Double value) { this.redemptionQuantityMultiplier = value; }

    @JsonProperty("scheme_type")
    public SchemeType getSchemeType() { return schemeType; }
    @JsonProperty("scheme_type")
    public void setSchemeType(SchemeType value) { this.schemeType = value; }

    @JsonProperty("settlement_type")
    public SettlementType getSettlementType() { return settlementType; }
    @JsonProperty("settlement_type")
    public void setSettlementType(SettlementType value) { this.settlementType = value; }

    @JsonProperty("tradingsymbol")
    public String getTradingsymbol() { return tradingsymbol; }
    @JsonProperty("tradingsymbol")
    public void setTradingsymbol(String value) { this.tradingsymbol = value; }
}
