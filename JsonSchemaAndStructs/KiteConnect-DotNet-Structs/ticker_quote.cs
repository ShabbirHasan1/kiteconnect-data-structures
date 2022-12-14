// <auto-generated />
//
// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using TickerQuote;
//
//    var tickerQuote = TickerQuote.FromJson(jsonString);

namespace TickerQuote
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class TickerQuote
    {
        [JsonProperty("average_price", NullValueHandling = NullValueHandling.Ignore)]
        public double? AveragePrice { get; set; }

        [JsonProperty("buy_quantity", NullValueHandling = NullValueHandling.Ignore)]
        public long? BuyQuantity { get; set; }

        [JsonProperty("change", NullValueHandling = NullValueHandling.Ignore)]
        public double? Change { get; set; }

        [JsonProperty("instrument_token", NullValueHandling = NullValueHandling.Ignore)]
        public long? InstrumentToken { get; set; }

        [JsonProperty("last_price", NullValueHandling = NullValueHandling.Ignore)]
        public double? LastPrice { get; set; }

        [JsonProperty("last_quantity", NullValueHandling = NullValueHandling.Ignore)]
        public long? LastQuantity { get; set; }

        [JsonProperty("mode", NullValueHandling = NullValueHandling.Ignore)]
        public string Mode { get; set; }

        [JsonProperty("ohlc", NullValueHandling = NullValueHandling.Ignore)]
        public Ohlc Ohlc { get; set; }

        [JsonProperty("sell_quantity", NullValueHandling = NullValueHandling.Ignore)]
        public long? SellQuantity { get; set; }

        [JsonProperty("tradable", NullValueHandling = NullValueHandling.Ignore)]
        public bool? Tradable { get; set; }

        [JsonProperty("volume", NullValueHandling = NullValueHandling.Ignore)]
        public long? Volume { get; set; }
    }

    public partial class Ohlc
    {
        [JsonProperty("close", NullValueHandling = NullValueHandling.Ignore)]
        public double? Close { get; set; }

        [JsonProperty("high", NullValueHandling = NullValueHandling.Ignore)]
        public long? High { get; set; }

        [JsonProperty("low", NullValueHandling = NullValueHandling.Ignore)]
        public double? Low { get; set; }

        [JsonProperty("open", NullValueHandling = NullValueHandling.Ignore)]
        public double? Open { get; set; }
    }

    public partial class TickerQuote
    {
        public static TickerQuote FromJson(string json) => JsonConvert.DeserializeObject<TickerQuote>(json, TickerQuote.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this TickerQuote self) => JsonConvert.SerializeObject(self, TickerQuote.Converter.Settings);
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
