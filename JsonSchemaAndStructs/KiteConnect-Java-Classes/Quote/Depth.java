package Quote;

import com.fasterxml.jackson.annotation.*;

public class Depth {
    private Buy[] buy;
    private Buy[] sell;

    @JsonProperty("buy")
    public Buy[] getBuy() { return buy; }
    @JsonProperty("buy")
    public void setBuy(Buy[] value) { this.buy = value; }

    @JsonProperty("sell")
    public Buy[] getSell() { return sell; }
    @JsonProperty("sell")
    public void setSell(Buy[] value) { this.sell = value; }
}
