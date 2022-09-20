package Positions;

import com.fasterxml.jackson.annotation.*;

public class Data {
    private Day[] day;
    private Day[] net;

    @JsonProperty("day")
    public Day[] getDay() { return day; }
    @JsonProperty("day")
    public void setDay(Day[] value) { this.day = value; }

    @JsonProperty("net")
    public Day[] getNet() { return net; }
    @JsonProperty("net")
    public void setNet(Day[] value) { this.net = value; }
}
