package InstrumentsNse;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum Exchange {
    NSE;

    @JsonValue
    public String toValue() {
        switch (this) {
            case NSE: return "NSE";
        }
        return null;
    }

    @JsonCreator
    public static Exchange forValue(String value) throws IOException {
        if (value.equals("NSE")) return NSE;
        throw new IOException("Cannot deserialize Exchange");
    }
}
