package HoldingsAuth;

import com.fasterxml.jackson.annotation.*;

public class Data {
    private String requestID;

    @JsonProperty("request_id")
    public String getRequestID() { return requestID; }
    @JsonProperty("request_id")
    public void setRequestID(String value) { this.requestID = value; }
}
