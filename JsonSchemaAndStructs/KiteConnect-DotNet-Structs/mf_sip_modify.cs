// <auto-generated />
//
// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using MfSipModify;
//
//    var mfSipModify = MfSipModify.FromJson(jsonString);

namespace MfSipModify
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class MfSipModify
    {
        [JsonProperty("data", NullValueHandling = NullValueHandling.Ignore)]
        public Data Data { get; set; }

        [JsonProperty("status", NullValueHandling = NullValueHandling.Ignore)]
        public string Status { get; set; }
    }

    public partial class Data
    {
        [JsonProperty("sip_id", NullValueHandling = NullValueHandling.Ignore)]
        public string SipId { get; set; }
    }

    public partial class MfSipModify
    {
        public static MfSipModify FromJson(string json) => JsonConvert.DeserializeObject<MfSipModify>(json, MfSipModify.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this MfSipModify self) => JsonConvert.SerializeObject(self, MfSipModify.Converter.Settings);
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
