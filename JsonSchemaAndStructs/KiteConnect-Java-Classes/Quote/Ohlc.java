package Quote;

import com.fasterxml.jackson.annotation.*;

public class Ohlc {
    private Double close;
    private Double high;
    private Double low;
    private Long open;

    @JsonProperty("close")
    public Double getClose() { return close; }
    @JsonProperty("close")
    public void setClose(Double value) { this.close = value; }

    @JsonProperty("high")
    public Double getHigh() { return high; }
    @JsonProperty("high")
    public void setHigh(Double value) { this.high = value; }

    @JsonProperty("low")
    public Double getLow() { return low; }
    @JsonProperty("low")
    public void setLow(Double value) { this.low = value; }

    @JsonProperty("open")
    public Long getOpen() { return open; }
    @JsonProperty("open")
    public void setOpen(Long value) { this.open = value; }
}
