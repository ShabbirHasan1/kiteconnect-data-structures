package InstrumentsAll;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum Exchange {
    BSE, NFO, NSE;

    @JsonValue
    public String toValue() {
        switch (this) {
            case BSE: return "BSE";
            case NFO: return "NFO";
            case NSE: return "NSE";
        }
        return null;
    }

    @JsonCreator
    public static Exchange forValue(String value) throws IOException {
        if (value.equals("BSE")) return BSE;
        if (value.equals("NFO")) return NFO;
        if (value.equals("NSE")) return NSE;
        throw new IOException("Cannot deserialize Exchange");
    }
}
