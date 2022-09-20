package InstrumentsAll;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum Segment {
    BSE, NFO_OPT, NSE;

    @JsonValue
    public String toValue() {
        switch (this) {
            case BSE: return "BSE";
            case NFO_OPT: return "NFO-OPT";
            case NSE: return "NSE";
        }
        return null;
    }

    @JsonCreator
    public static Segment forValue(String value) throws IOException {
        if (value.equals("BSE")) return BSE;
        if (value.equals("NFO-OPT")) return NFO_OPT;
        if (value.equals("NSE")) return NSE;
        throw new IOException("Cannot deserialize Segment");
    }
}
