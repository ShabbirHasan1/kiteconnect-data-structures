package Margins;

import com.fasterxml.jackson.annotation.*;

public class Data {
    private Ity commodity;
    private Ity equity;

    @JsonProperty("commodity")
    public Ity getCommodity() { return commodity; }
    @JsonProperty("commodity")
    public void setCommodity(Ity value) { this.commodity = value; }

    @JsonProperty("equity")
    public Ity getEquity() { return equity; }
    @JsonProperty("equity")
    public void setEquity(Ity value) { this.equity = value; }
}
