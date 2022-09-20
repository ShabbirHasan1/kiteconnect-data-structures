package MfInstruments;

import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum SchemeType {
    BALANCED, DEBT, EQUITY, FOF, LIQUID;

    @JsonValue
    public String toValue() {
        switch (this) {
            case BALANCED: return "balanced";
            case DEBT: return "debt";
            case EQUITY: return "equity";
            case FOF: return "fof";
            case LIQUID: return "liquid";
        }
        return null;
    }

    @JsonCreator
    public static SchemeType forValue(String value) throws IOException {
        if (value.equals("balanced")) return BALANCED;
        if (value.equals("debt")) return DEBT;
        if (value.equals("equity")) return EQUITY;
        if (value.equals("fof")) return FOF;
        if (value.equals("liquid")) return LIQUID;
        throw new IOException("Cannot deserialize SchemeType");
    }
}
