package Orders;

import com.fasterxml.jackson.annotation.*;

public class Iceberg {
    private Long leg;
    private Long legQuantity;
    private Long legs;
    private Long remainingQuantity;
    private Long totalQuantity;

    @JsonProperty("leg")
    public Long getLeg() { return leg; }
    @JsonProperty("leg")
    public void setLeg(Long value) { this.leg = value; }

    @JsonProperty("leg_quantity")
    public Long getLegQuantity() { return legQuantity; }
    @JsonProperty("leg_quantity")
    public void setLegQuantity(Long value) { this.legQuantity = value; }

    @JsonProperty("legs")
    public Long getLegs() { return legs; }
    @JsonProperty("legs")
    public void setLegs(Long value) { this.legs = value; }

    @JsonProperty("remaining_quantity")
    public Long getRemainingQuantity() { return remainingQuantity; }
    @JsonProperty("remaining_quantity")
    public void setRemainingQuantity(Long value) { this.remainingQuantity = value; }

    @JsonProperty("total_quantity")
    public Long getTotalQuantity() { return totalQuantity; }
    @JsonProperty("total_quantity")
    public void setTotalQuantity(Long value) { this.totalQuantity = value; }
}
