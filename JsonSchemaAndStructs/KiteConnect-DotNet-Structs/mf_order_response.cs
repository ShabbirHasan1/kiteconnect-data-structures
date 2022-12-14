// <auto-generated />
//
// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using MfOrderResponse;
//
//    var mfOrderResponse = MfOrderResponse.FromJson(jsonString);

namespace MfOrderResponse
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class MfOrderResponse
    {
        [JsonProperty("data", NullValueHandling = NullValueHandling.Ignore)]
        public Data Data { get; set; }

        [JsonProperty("status", NullValueHandling = NullValueHandling.Ignore)]
        public string Status { get; set; }
    }

    public partial class Data
    {
        [JsonProperty("order_id", NullValueHandling = NullValueHandling.Ignore)]
        public Guid? OrderId { get; set; }
    }

    public partial class MfOrderResponse
    {
        public static MfOrderResponse FromJson(string json) => JsonConvert.DeserializeObject<MfOrderResponse>(json, MfOrderResponse.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this MfOrderResponse self) => JsonConvert.SerializeObject(self, MfOrderResponse.Converter.Settings);
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
