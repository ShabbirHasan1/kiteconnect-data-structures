package TickerQuote;

import com.fasterxml.jackson.annotation.*;

public class Ohlc {
    private Long close;
    private Long high;
    private Long low;
    private Long open;

    @JsonProperty("close")
    public Long getClose() { return close; }
    @JsonProperty("close")
    public void setClose(Long value) { this.close = value; }

    @JsonProperty("high")
    public Long getHigh() { return high; }
    @JsonProperty("high")
    public void setHigh(Long value) { this.high = value; }

    @JsonProperty("low")
    public Long getLow() { return low; }
    @JsonProperty("low")
    public void setLow(Long value) { this.low = value; }

    @JsonProperty("open")
    public Long getOpen() { return open; }
    @JsonProperty("open")
    public void setOpen(Long value) { this.open = value; }
}
