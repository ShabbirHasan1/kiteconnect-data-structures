package MfOrders;

import com.fasterxml.jackson.annotation.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.UUID;

public class Datum {
    private Long amount;
    private Long averagePrice;
    private String exchangeOrderID;
    private LocalDate exchangeTimestamp;
    private Object folio;
    private String fund;
    private Double lastPrice;
    private LocalDate lastPriceDate;
    private UUID orderID;
    private OffsetDateTime orderTimestamp;
    private String placedBy;
    private String purchaseType;
    private Long quantity;
    private String settlementID;
    private String status;
    private String statusMessage;
    private String tag;
    private String tradingsymbol;
    private String transactionType;
    private String variety;

    @JsonProperty("amount")
    public Long getAmount() { return amount; }
    @JsonProperty("amount")
    public void setAmount(Long value) { this.amount = value; }

    @JsonProperty("average_price")
    public Long getAveragePrice() { return averagePrice; }
    @JsonProperty("average_price")
    public void setAveragePrice(Long value) { this.averagePrice = value; }

    @JsonProperty("exchange_order_id")
    public String getExchangeOrderID() { return exchangeOrderID; }
    @JsonProperty("exchange_order_id")
    public void setExchangeOrderID(String value) { this.exchangeOrderID = value; }

    @JsonProperty("exchange_timestamp")
    public LocalDate getExchangeTimestamp() { return exchangeTimestamp; }
    @JsonProperty("exchange_timestamp")
    public void setExchangeTimestamp(LocalDate value) { this.exchangeTimestamp = value; }

    @JsonProperty("folio")
    public Object getFolio() { return folio; }
    @JsonProperty("folio")
    public void setFolio(Object value) { this.folio = value; }

    @JsonProperty("fund")
    public String getFund() { return fund; }
    @JsonProperty("fund")
    public void setFund(String value) { this.fund = value; }

    @JsonProperty("last_price")
    public Double getLastPrice() { return lastPrice; }
    @JsonProperty("last_price")
    public void setLastPrice(Double value) { this.lastPrice = value; }

    @JsonProperty("last_price_date")
    public LocalDate getLastPriceDate() { return lastPriceDate; }
    @JsonProperty("last_price_date")
    public void setLastPriceDate(LocalDate value) { this.lastPriceDate = value; }

    @JsonProperty("order_id")
    public UUID getOrderID() { return orderID; }
    @JsonProperty("order_id")
    public void setOrderID(UUID value) { this.orderID = value; }

    @JsonProperty("order_timestamp")
    public OffsetDateTime getOrderTimestamp() { return orderTimestamp; }
    @JsonProperty("order_timestamp")
    public void setOrderTimestamp(OffsetDateTime value) { this.orderTimestamp = value; }

    @JsonProperty("placed_by")
    public String getPlacedBy() { return placedBy; }
    @JsonProperty("placed_by")
    public void setPlacedBy(String value) { this.placedBy = value; }

    @JsonProperty("purchase_type")
    public String getPurchaseType() { return purchaseType; }
    @JsonProperty("purchase_type")
    public void setPurchaseType(String value) { this.purchaseType = value; }

    @JsonProperty("quantity")
    public Long getQuantity() { return quantity; }
    @JsonProperty("quantity")
    public void setQuantity(Long value) { this.quantity = value; }

    @JsonProperty("settlement_id")
    public String getSettlementID() { return settlementID; }
    @JsonProperty("settlement_id")
    public void setSettlementID(String value) { this.settlementID = value; }

    @JsonProperty("status")
    public String getStatus() { return status; }
    @JsonProperty("status")
    public void setStatus(String value) { this.status = value; }

    @JsonProperty("status_message")
    public String getStatusMessage() { return statusMessage; }
    @JsonProperty("status_message")
    public void setStatusMessage(String value) { this.statusMessage = value; }

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

    @JsonProperty("variety")
    public String getVariety() { return variety; }
    @JsonProperty("variety")
    public void setVariety(String value) { this.variety = value; }
}
