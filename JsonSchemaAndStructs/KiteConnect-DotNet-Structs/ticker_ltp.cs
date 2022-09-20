// <auto-generated />
//
// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using TickerLtp;
//
//    var tickerLtp = TickerLtp.FromJson(jsonString);

namespace TickerLtp
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class TickerLtp
    {
        [JsonProperty("instrument_token", NullValueHandling = NullValueHandling.Ignore)]
        public long? InstrumentToken { get; set; }

        [JsonProperty("last_price", NullValueHandling = NullValueHandling.Ignore)]
        public long? LastPrice { get; set; }

        [JsonProperty("mode", NullValueHandling = NullValueHandling.Ignore)]
        public string Mode { get; set; }

        [JsonProperty("tradable", NullValueHandling = NullValueHandling.Ignore)]
        public bool? Tradable { get; set; }
    }

    public partial class TickerLtp
    {
        public static TickerLtp[] FromJson(string json) => JsonConvert.DeserializeObject<TickerLtp[]>(json, TickerLtp.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this TickerLtp[] self) => JsonConvert.SerializeObject(self, TickerLtp.Converter.Settings);
    }

    internal static class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters =
            {
                new IsoDateTimeConverter { DateTimeStyles = DateTimeStyles.AssumeUniversal }
            },
        };
    }
}