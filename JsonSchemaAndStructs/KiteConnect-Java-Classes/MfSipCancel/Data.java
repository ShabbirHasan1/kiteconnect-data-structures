package MfSipCancel;

import com.fasterxml.jackson.annotation.*;

public class Data {
    private String sipID;

    @JsonProperty("sip_id")
    public String getSIPID() { return sipID; }
    @JsonProperty("sip_id")
    public void setSIPID(String value) { this.sipID = value; }
}
