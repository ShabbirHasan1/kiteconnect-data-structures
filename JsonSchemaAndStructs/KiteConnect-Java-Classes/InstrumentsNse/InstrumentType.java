package InstrumentsNse;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum InstrumentType {
    EQ;

    @JsonValue
    public String toValue() {
        switch (this) {
            case EQ: return "EQ";
        }
        return null;
    }

    @JsonCreator
    public static InstrumentType forValue(String value) throws IOException {
        if (value.equals("EQ")) return EQ;
        throw new IOException("Cannot deserialize InstrumentType");
    }
}
