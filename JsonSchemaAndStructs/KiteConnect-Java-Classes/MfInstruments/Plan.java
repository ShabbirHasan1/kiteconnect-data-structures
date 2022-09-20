package MfInstruments;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum Plan {
    DIRECT, REGULAR;

    @JsonValue
    public String toValue() {
        switch (this) {
            case DIRECT: return "direct";
            case REGULAR: return "regular";
        }
        return null;
    }

    @JsonCreator
    public static Plan forValue(String value) throws IOException {
        if (value.equals("direct")) return DIRECT;
        if (value.equals("regular")) return REGULAR;
        throw new IOException("Cannot deserialize Plan");
    }
}
