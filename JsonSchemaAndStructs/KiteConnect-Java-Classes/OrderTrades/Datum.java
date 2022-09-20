package OrderTrades;

import com.fasterxml.jackson.annotation.*;
import java.time.OffsetDateTime;
import java.time.OffsetTime;

public class Datum {
    private Long averagePrice;
    private String exchange;
    private String exchangeOrderID;
    private OffsetDateTime exchangeTimestamp;
    private OffsetDateTime fillTimestamp;
    private Long instrumentToken;
    private String orderID;
    private OffsetTime orderTimestamp;
    private String product;
    private Long quantity;
    private String tradeID;
    private String tradingsymbol;
    private String transactionType;

    @JsonProperty("average_price")
    public Long getAveragePrice() { return averagePrice; }
    @JsonProperty("average_price")
    public void setAveragePrice(Long value) { this.averagePrice = value; }

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

    @JsonProperty("fill_timestamp")
    public OffsetDateTime getFillTimestamp() { return fillTimestamp; }
    @JsonProperty("fill_timestamp")
    public void setFillTimestamp(OffsetDateTime value) { this.fillTimestamp = value; }

    @JsonProperty("instrument_token")
    public Long getInstrumentToken() { return instrumentToken; }
    @JsonProperty("instrument_token")
    public void setInstrumentToken(Long value) { this.instrumentToken = value; }

    @JsonProperty("order_id")
    public String getOrderID() { return orderID; }
    @JsonProperty("order_id")
    public void setOrderID(String value) { this.orderID = value; }

    @JsonProperty("order_timestamp")
    public OffsetTime getOrderTimestamp() { return orderTimestamp; }
    @JsonProperty("order_timestamp")
    public void setOrderTimestamp(OffsetTime value) { this.orderTimestamp = value; }

    @JsonProperty("product")
    public String getProduct() { return product; }
    @JsonProperty("product")
    public void setProduct(String value) { this.product = value; }

    @JsonProperty("quantity")
    public Long getQuantity() { return quantity; }
    @JsonProperty("quantity")
    public void setQuantity(Long value) { this.quantity = value; }

    @JsonProperty("trade_id")
    public String getTradeID() { return tradeID; }
    @JsonProperty("trade_id")
    public void setTradeID(String value) { this.tradeID = value; }

    @JsonProperty("tradingsymbol")
    public String getTradingsymbol() { return tradingsymbol; }
    @JsonProperty("tradingsymbol")
    public void setTradingsymbol(String value) { this.tradingsymbol = value; }

    @JsonProperty("transaction_type")
    public String getTransactionType() { return transactionType; }
    @JsonProperty("transaction_type")
    public void setTransactionType(String value) { this.transactionType = value; }
}
