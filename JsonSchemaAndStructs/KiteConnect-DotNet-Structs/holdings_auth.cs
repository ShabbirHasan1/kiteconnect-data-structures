// <auto-generated />
//
// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using HoldingsAuth;
//
//    var holdingsAuth = HoldingsAuth.FromJson(jsonString);

namespace HoldingsAuth
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class HoldingsAuth
    {
        [JsonProperty("data", NullValueHandling = NullValueHandling.Ignore)]
        public Data Data { get; set; }

        [JsonProperty("status", NullValueHandling = NullValueHandling.Ignore)]
        public string Status { get; set; }
    }

    public partial class Data
    {
        [JsonProperty("request_id", NullValueHandling = NullValueHandling.Ignore)]
        public string RequestId { get; set; }
    }

    public partial class HoldingsAuth
    {
        public static HoldingsAuth FromJson(string json) => JsonConvert.DeserializeObject<HoldingsAuth>(json, HoldingsAuth.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this HoldingsAuth self) => JsonConvert.SerializeObject(self, HoldingsAuth.Converter.Settings);
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
