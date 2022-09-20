package MfOrderCancel;

import com.fasterxml.jackson.annotation.*;
import java.util.UUID;

public class Data {
    private UUID orderID;

    @JsonProperty("order_id")
    public UUID getOrderID() { return orderID; }
    @JsonProperty("order_id")
    public void setOrderID(UUID value) { this.orderID = value; }
}
