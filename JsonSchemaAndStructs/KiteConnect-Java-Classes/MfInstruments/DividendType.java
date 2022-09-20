package MfInstruments;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum DividendType {
    GROWTH, PAYOUT;

    @JsonValue
    public String toValue() {
        switch (this) {
            case GROWTH: return "growth";
            case PAYOUT: return "payout";
        }
        return null;
    }

    @JsonCreator
    public static DividendType forValue(String value) throws IOException {
        if (value.equals("growth")) return GROWTH;
        if (value.equals("payout")) return PAYOUT;
        throw new IOException("Cannot deserialize DividendType");
    }
}
