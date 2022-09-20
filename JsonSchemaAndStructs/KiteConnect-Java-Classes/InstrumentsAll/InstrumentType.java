package InstrumentsAll;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum InstrumentType {
    CE, EQ, PE;

    @JsonValue
    public String toValue() {
        switch (this) {
            case CE: return "CE";
            case EQ: return "EQ";
            case PE: return "PE";
        }
        return null;
    }

    @JsonCreator
    public static InstrumentType forValue(String value) throws IOException {
        if (value.equals("CE")) return CE;
        if (value.equals("EQ")) return EQ;
        if (value.equals("PE")) return PE;
        throw new IOException("Cannot deserialize InstrumentType");
    }
}
