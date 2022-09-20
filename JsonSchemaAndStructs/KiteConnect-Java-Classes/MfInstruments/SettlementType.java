package MfInstruments;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum SettlementType {
    T1, T3, T4, T6;

    @JsonValue
    public String toValue() {
        switch (this) {
            case T1: return "T1";
            case T3: return "T3";
            case T4: return "T4";
            case T6: return "T6";
        }
        return null;
    }

    @JsonCreator
    public static SettlementType forValue(String value) throws IOException {
        if (value.equals("T1")) return T1;
        if (value.equals("T3")) return T3;
        if (value.equals("T4")) return T4;
        if (value.equals("T6")) return T6;
        throw new IOException("Cannot deserialize SettlementType");
    }
}
