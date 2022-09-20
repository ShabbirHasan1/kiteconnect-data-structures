package MfInstruments;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum Amc {
    BIRLA_SUN_LIFE_MUTUAL_FUND_MF;

    @JsonValue
    public String toValue() {
        switch (this) {
            case BIRLA_SUN_LIFE_MUTUAL_FUND_MF: return "BirlaSunLifeMutualFund_MF";
        }
        return null;
    }

    @JsonCreator
    public static Amc forValue(String value) throws IOException {
        if (value.equals("BirlaSunLifeMutualFund_MF")) return BIRLA_SUN_LIFE_MUTUAL_FUND_MF;
        throw new IOException("Cannot deserialize Amc");
    }
}
