package Quote;

import com.fasterxml.jackson.annotation.*;
import java.util.Map;

public class Quote {
    private Map<String, Datum> data;
    private String status;

    @JsonProperty("data")
    public Map<String, Datum> getData() { return data; }
    @JsonProperty("data")
    public void setData(Map<String, Datum> value) { this.data = value; }

    @JsonProperty("status")
    public String getStatus() { return status; }
    @JsonProperty("status")
    public void setStatus(String value) { this.status = value; }
}
