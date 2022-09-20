package MfSips;

import com.fasterxml.jackson.annotation.*;

public class MFSips {
    private Datum[] data;

    @JsonProperty("data")
    public Datum[] getData() { return data; }
    @JsonProperty("data")
    public void setData(Datum[] value) { this.data = value; }
}
