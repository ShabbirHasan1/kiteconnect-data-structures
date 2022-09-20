package TickerFull;

import com.fasterxml.jackson.annotation.*;

public class Buy {
    private Long orders;
    private Long price;
    private Long quantity;

    @JsonProperty("orders")
    public Long getOrders() { return orders; }
    @JsonProperty("orders")
    public void setOrders(Long value) { this.orders = value; }

    @JsonProperty("price")
    public Long getPrice() { return price; }
    @JsonProperty("price")
    public void setPrice(Long value) { this.price = value; }

    @JsonProperty("quantity")
    public Long getQuantity() { return quantity; }
    @JsonProperty("quantity")
    public void setQuantity(Long value) { this.quantity = value; }
}
