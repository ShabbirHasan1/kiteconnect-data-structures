package MfSipInfo;

import com.fasterxml.jackson.annotation.*;

public class StepUp {
    private Long the1502;

    @JsonProperty("15-02")
    public Long getThe1502() { return the1502; }
    @JsonProperty("15-02")
    public void setThe1502(Long value) { this.the1502 = value; }
}
