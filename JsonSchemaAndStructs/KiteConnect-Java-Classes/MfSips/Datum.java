package MfSips;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.Map;

public class Datum {
    private Long completedInstalments;
    private OffsetDateTime created;
    private String dividendType;
    private String frequency;
    private String fund;
    private Long instalmentAmount;
    private Long instalmentDay;
    private Long instalments;
    private OffsetDateTime lastInstalment;
    private LocalDate nextInstalment;
    private Long pendingInstalments;
    private String sipID;
    private String sipRegNum;
    private String sipType;
    private String status;
    private Map<String, Long> stepUp;
    private String tag;
    private String tradingsymbol;
    private String transactionType;
    private Long triggerPrice;

    @JsonProperty("completed_instalments")
    public Long getCompletedInstalments() { return completedInstalments; }
    @JsonProperty("completed_instalments")
    public void setCompletedInstalments(Long value) { this.completedInstalments = value; }

    @JsonProperty("created")
    public OffsetDateTime getCreated() { return created; }
    @JsonProperty("created")
    public void setCreated(OffsetDateTime value) { this.created = value; }

    @JsonProperty("dividend_type")
    public String getDividendType() { return dividendType; }
    @JsonProperty("dividend_type")
    public void setDividendType(String value) { this.dividendType = value; }

    @JsonProperty("frequency")
    public String getFrequency() { return frequency; }
    @JsonProperty("frequency")
    public void setFrequency(String value) { this.frequency = value; }

    @JsonProperty("fund")
    public String getFund() { return fund; }
    @JsonProperty("fund")
    public void setFund(String value) { this.fund = value; }

    @JsonProperty("instalment_amount")
    public Long getInstalmentAmount() { return instalmentAmount; }
    @JsonProperty("instalment_amount")
    public void setInstalmentAmount(Long value) { this.instalmentAmount = value; }

    @JsonProperty("instalment_day")
    public Long getInstalmentDay() { return instalmentDay; }
    @JsonProperty("instalment_day")
    public void setInstalmentDay(Long value) { this.instalmentDay = value; }

    @JsonProperty("instalments")
    public Long getInstalments() { return instalments; }
    @JsonProperty("instalments")
    public void setInstalments(Long value) { this.instalments = value; }

    @JsonProperty("last_instalment")
    public OffsetDateTime getLastInstalment() { return lastInstalment; }
    @JsonProperty("last_instalment")
    public void setLastInstalment(OffsetDateTime value) { this.lastInstalment = value; }

    @JsonProperty("next_instalment")
    public LocalDate getNextInstalment() { return nextInstalment; }
    @JsonProperty("next_instalment")
    public void setNextInstalment(LocalDate value) { this.nextInstalment = value; }

    @JsonProperty("pending_instalments")
    public Long getPendingInstalments() { return pendingInstalments; }
    @JsonProperty("pending_instalments")
    public void setPendingInstalments(Long value) { this.pendingInstalments = value; }

    @JsonProperty("sip_id")
    public String getSIPID() { return sipID; }
    @JsonProperty("sip_id")
    public void setSIPID(String value) { this.sipID = value; }

    @JsonProperty("sip_reg_num")
    public String getSIPRegNum() { return sipRegNum; }
    @JsonProperty("sip_reg_num")
    public void setSIPRegNum(String value) { this.sipRegNum = value; }

    @JsonProperty("sip_type")
    public String getSIPType() { return sipType; }
    @JsonProperty("sip_type")
    public void setSIPType(String value) { this.sipType = value; }

    @JsonProperty("status")
    public String getStatus() { return status; }
    @JsonProperty("status")
    public void setStatus(String value) { this.status = value; }

    @JsonProperty("step_up")
    public Map<String, Long> getStepUp() { return stepUp; }
    @JsonProperty("step_up")
    public void setStepUp(Map<String, Long> value) { this.stepUp = value; }

    @JsonProperty("tag")
    public String getTag() { return tag; }
    @JsonProperty("tag")
    public void setTag(String value) { this.tag = value; }

    @JsonProperty("tradingsymbol")
    public String getTradingsymbol() { return tradingsymbol; }
    @JsonProperty("tradingsymbol")
    public void setTradingsymbol(String value) { this.tradingsymbol = value; }

    @JsonProperty("transaction_type")
    public String getTransactionType() { return transactionType; }
    @JsonProperty("transaction_type")
    public void setTransactionType(String value) { this.transactionType = value; }

    @JsonProperty("trigger_price")
    public Long getTriggerPrice() { return triggerPrice; }
    @JsonProperty("trigger_price")
    public void setTriggerPrice(Long value) { this.triggerPrice = value; }
}
