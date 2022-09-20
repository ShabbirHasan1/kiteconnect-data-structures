package Orders;

import com.fasterxml.jackson.annotation.*;

public class Meta {
    private Iceberg iceberg;

    @JsonProperty("iceberg")
    public Iceberg getIceberg() { return iceberg; }
    @JsonProperty("iceberg")
    public void setIceberg(Iceberg value) { this.iceberg = value; }
}
