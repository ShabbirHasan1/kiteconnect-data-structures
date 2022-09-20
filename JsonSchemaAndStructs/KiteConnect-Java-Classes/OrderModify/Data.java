package OrderModify;

import com.fasterxml.jackson.annotation.*;

public class Data {
    private String orderID;

    @JsonProperty("order_id")
    public String getOrderID() { return orderID; }
    @JsonProperty("order_id")
    public void setOrderID(String value) { this.orderID = value; }
}
