// <auto-generated />
//
// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using HistoricalOi;
//
//    var historicalOi = HistoricalOi.FromJson(jsonString);

namespace HistoricalOi
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class HistoricalOi
    {
        [JsonProperty("data", NullValueHandling = NullValueHandling.Ignore)]
        public Data Data { get; set; }

        [JsonProperty("status", NullValueHandling = NullValueHandling.Ignore)]
        public string Status { get; set; }
    }

    public partial class Data
    {
        [JsonProperty("candles", NullValueHandling = NullValueHandling.Ignore)]
        public Candle[][] Candles { get; set; }
    }

    public partial struct Candle
    {
        public double? Double;
        public string String;

        public static implicit operator Candle(double Double) => new Candle { Double = Double };
        public static implicit operator Candle(string String) => new Candle { String = String };
    }

    public partial class HistoricalOi
    {
        public static HistoricalOi FromJson(string json) => JsonConvert.DeserializeObject<HistoricalOi>(json, HistoricalOi.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this HistoricalOi self) => JsonConvert.SerializeObject(self, HistoricalOi.Converter.Settings);
    }

    internal static class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters =
            {
                CandleConverter.Singleton,
                new IsoDateTimeConverter { DateTimeStyles = DateTimeStyles.AssumeUniversal }
            },
        };
    }

    internal class CandleConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(Candle) || t == typeof(Candle?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            switch (reader.TokenType)
            {
                case JsonToken.Integer:
                case JsonToken.Float:
                    var doubleValue = serializer.Deserialize<double>(reader);
                    return new Candle { Double = doubleValue };
                case JsonToken.String:
                case JsonToken.Date:
                    var stringValue = serializer.Deserialize<string>(reader);
                    return new Candle { String = stringValue };
            }
            throw new Exception("Cannot unmarshal type Candle");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            var value = (Candle)untypedValue;
            if (value.Double != null)
            {
                serializer.Serialize(writer, value.Double.Value);
                return;
            }
            if (value.String != null)
            {
                serializer.Serialize(writer, value.String);
                return;
            }
            throw new Exception("Cannot marshal type Candle");
        }

        public static readonly CandleConverter Singleton = new CandleConverter();
    }
}
