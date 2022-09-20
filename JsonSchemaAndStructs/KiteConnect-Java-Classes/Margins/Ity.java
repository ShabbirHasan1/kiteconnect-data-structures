package Margins;

import com.fasterxml.jackson.annotation.*;
import java.util.Map;

public class Ity {
    private Available available;
    private Boolean enabled;
    private Double net;
    private Map<String, Double> utilised;

    @JsonProperty("available")
    public Available getAvailable() { return available; }
    @JsonProperty("available")
    public void setAvailable(Available value) { this.available = value; }

    @JsonProperty("enabled")
    public Boolean getEnabled() { return enabled; }
    @JsonProperty("enabled")
    public void setEnabled(Boolean value) { this.enabled = value; }

    @JsonProperty("net")
    public Double getNet() { return net; }
    @JsonProperty("net")
    public void setNet(Double value) { this.net = value; }

    @JsonProperty("utilised")
    public Map<String, Double> getUtilised() { return utilised; }
    @JsonProperty("utilised")
    public void setUtilised(Map<String, Double> value) { this.utilised = value; }
}
