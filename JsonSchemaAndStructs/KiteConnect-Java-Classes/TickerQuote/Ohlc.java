package TickerQuote;

import com.fasterxml.jackson.annotation.*;

public class Ohlc {
    private Double close;
    private Long high;
    private Double low;
    private Double open;

    @JsonProperty("close")
    public Double getClose() { return close; }
    @JsonProperty("close")
    public void setClose(Double value) { this.close = value; }

    @JsonProperty("high")
    public Long getHigh() { return high; }
    @JsonProperty("high")
    public void setHigh(Long value) { this.high = value; }

    @JsonProperty("low")
    public Double getLow() { return low; }
    @JsonProperty("low")
    public void setLow(Double value) { this.low = value; }

    @JsonProperty("open")
    public Double getOpen() { return open; }
    @JsonProperty("open")
    public void setOpen(Double value) { this.open = value; }
}
