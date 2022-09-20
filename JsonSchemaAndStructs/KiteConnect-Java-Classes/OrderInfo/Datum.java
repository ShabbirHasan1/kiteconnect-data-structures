package OrderInfo;

import com.fasterxml.jackson.annotation.*;
import java.time.OffsetDateTime;

public class Datum {
    private Long averagePrice;
    private Long cancelledQuantity;
    private Long disclosedQuantity;
    private String exchange;
    private String exchangeOrderID;
    private OffsetDateTime exchangeTimestamp;
    private Long filledQuantity;
    private Long instrumentToken;
    private String orderID;
    private OffsetDateTime orderTimestamp;
    private String orderType;
    private Object parentOrderID;
    private Long pendingQuantity;
    private String placedBy;
    private Double price;
    private String product;
    private Long quantity;
    private String status;
    private Object statusMessage;
    private Object tag;
    private String tradingsymbol;
    private String transactionType;
    private Long triggerPrice;
    private String validity;
    private String variety;

    @JsonProperty("average_price")
    public Long getAveragePrice() { return averagePrice; }
    @JsonProperty("average_price")
    public void setAveragePrice(Long value) { this.averagePrice = value; }

    @JsonProperty("cancelled_quantity")
    public Long getCancelledQuantity() { return cancelledQuantity; }
    @JsonProperty("cancelled_quantity")
    public void setCancelledQuantity(Long value) { this.cancelledQuantity = value; }

    @JsonProperty("disclosed_quantity")
    public Long getDisclosedQuantity() { return disclosedQuantity; }
    @JsonProperty("disclosed_quantity")
    public void setDisclosedQuantity(Long value) { this.disclosedQuantity = value; }

    @JsonProperty("exchange")
    public String getExchange() { return exchange; }
    @JsonProperty("exchange")
    public void setExchange(String value) { this.exchange = value; }

    @JsonProperty("exchange_order_id")
    public String getExchangeOrderID() { return exchangeOrderID; }
    @JsonProperty("exchange_order_id")
    public void setExchangeOrderID(String value) { this.exchangeOrderID = value; }

    @JsonProperty("exchange_timestamp")
    public OffsetDateTime getExchangeTimestamp() { return exchangeTimestamp; }
    @JsonProperty("exchange_timestamp")
    public void setExchangeTimestamp(OffsetDateTime value) { this.exchangeTimestamp = value; }

    @JsonProperty("filled_quantity")
    public Long getFilledQuantity() { return filledQuantity; }
    @JsonProperty("filled_quantity")
    public void setFilledQuantity(Long value) { this.filledQuantity = value; }

    @JsonProperty("instrument_token")
    public Long getInstrumentToken() { return instrumentToken; }
    @JsonProperty("instrument_token")
    public void setInstrumentToken(Long value) { this.instrumentToken = value; }

    @JsonProperty("order_id")
    public String getOrderID() { return orderID; }
    @JsonProperty("order_id")
    public void setOrderID(String value) { this.orderID = value; }

    @JsonProperty("order_timestamp")
    public OffsetDateTime getOrderTimestamp() { return orderTimestamp; }
    @JsonProperty("order_timestamp")
    public void setOrderTimestamp(OffsetDateTime value) { this.orderTimestamp = value; }

    @JsonProperty("order_type")
    public String getOrderType() { return orderType; }
    @JsonProperty("order_type")
    public void setOrderType(String value) { this.orderType = value; }

    @JsonProperty("parent_order_id")
    public Object getParentOrderID() { return parentOrderID; }
    @JsonProperty("parent_order_id")
    public void setParentOrderID(Object value) { this.parentOrderID = value; }

    @JsonProperty("pending_quantity")
    public Long getPendingQuantity() { return pendingQuantity; }
    @JsonProperty("pending_quantity")
    public void setPendingQuantity(Long value) { this.pendingQuantity = value; }

    @JsonProperty("placed_by")
    public String getPlacedBy() { return placedBy; }
    @JsonProperty("placed_by")
    public void setPlacedBy(String value) { this.placedBy = value; }

    @JsonProperty("price")
    public Double getPrice() { return price; }
    @JsonProperty("price")
    public void setPrice(Double value) { this.price = value; }

    @JsonProperty("product")
    public String getProduct() { return product; }
    @JsonProperty("product")
    public void setProduct(String value) { this.product = value; }

    @JsonProperty("quantity")
    public Long getQuantity() { return quantity; }
    @JsonProperty("quantity")
    public void setQuantity(Long value) { this.quantity = value; }

    @JsonProperty("status")
    public String getStatus() { return status; }
    @JsonProperty("status")
    public void setStatus(String value) { this.status = value; }

    @JsonProperty("status_message")
    public Object getStatusMessage() { return statusMessage; }
    @JsonProperty("status_message")
    public void setStatusMessage(Object value) { this.statusMessage = value; }

    @JsonProperty("tag")
    public Object getTag() { return tag; }
    @JsonProperty("tag")
    public void setTag(Object value) { this.tag = value; }

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

    @JsonProperty("validity")
    public String getValidity() { return validity; }
    @JsonProperty("validity")
    public void setValidity(String value) { this.validity = value; }

    @JsonProperty("variety")
    public String getVariety() { return variety; }
    @JsonProperty("variety")
    public void setVariety(String value) { this.variety = value; }
}
