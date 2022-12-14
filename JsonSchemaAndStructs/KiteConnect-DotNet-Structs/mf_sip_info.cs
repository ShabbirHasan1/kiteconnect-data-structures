// <auto-generated />
//
// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using MfSipInfo;
//
//    var mfSipInfo = MfSipInfo.FromJson(jsonString);

namespace MfSipInfo
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class MfSipInfo
    {
        [JsonProperty("data", NullValueHandling = NullValueHandling.Ignore)]
        public Data Data { get; set; }

        [JsonProperty("status", NullValueHandling = NullValueHandling.Ignore)]
        public string Status { get; set; }
    }

    public partial class Data
    {
        [JsonProperty("completed_instalments", NullValueHandling = NullValueHandling.Ignore)]
        public long? CompletedInstalments { get; set; }

        [JsonProperty("created", NullValueHandling = NullValueHandling.Ignore)]
        public DateTimeOffset? Created { get; set; }

        [JsonProperty("dividend_type", NullValueHandling = NullValueHandling.Ignore)]
        public string DividendType { get; set; }

        [JsonProperty("frequency", NullValueHandling = NullValueHandling.Ignore)]
        public string Frequency { get; set; }

        [JsonProperty("fund", NullValueHandling = NullValueHandling.Ignore)]
        public string Fund { get; set; }

        [JsonProperty("fund_source", NullValueHandling = NullValueHandling.Ignore)]
        public string FundSource { get; set; }

        [JsonProperty("instalment_amount", NullValueHandling = NullValueHandling.Ignore)]
        public long? InstalmentAmount { get; set; }

        [JsonProperty("instalment_day", NullValueHandling = NullValueHandling.Ignore)]
        public long? InstalmentDay { get; set; }

        [JsonProperty("instalments", NullValueHandling = NullValueHandling.Ignore)]
        public long? Instalments { get; set; }

        [JsonProperty("last_instalment", NullValueHandling = NullValueHandling.Ignore)]
        public DateTimeOffset? LastInstalment { get; set; }

        [JsonProperty("next_instalment", NullValueHandling = NullValueHandling.Ignore)]
        public DateTimeOffset? NextInstalment { get; set; }

        [JsonProperty("pending_instalments", NullValueHandling = NullValueHandling.Ignore)]
        public long? PendingInstalments { get; set; }

        [JsonProperty("sip_id", NullValueHandling = NullValueHandling.Ignore)]
        public string SipId { get; set; }

        [JsonProperty("sip_reg_num")]
        public object SipRegNum { get; set; }

        [JsonProperty("sip_type", NullValueHandling = NullValueHandling.Ignore)]
        public string SipType { get; set; }

        [JsonProperty("status", NullValueHandling = NullValueHandling.Ignore)]
        public string Status { get; set; }

        [JsonProperty("step_up", NullValueHandling = NullValueHandling.Ignore)]
        public StepUp StepUp { get; set; }

        [JsonProperty("tag", NullValueHandling = NullValueHandling.Ignore)]
        public string Tag { get; set; }

        [JsonProperty("tradingsymbol", NullValueHandling = NullValueHandling.Ignore)]
        public string Tradingsymbol { get; set; }

        [JsonProperty("transaction_type", NullValueHandling = NullValueHandling.Ignore)]
        public string TransactionType { get; set; }

        [JsonProperty("trigger_price", NullValueHandling = NullValueHandling.Ignore)]
        public long? TriggerPrice { get; set; }
    }

    public partial class StepUp
    {
        [JsonProperty("15-02", NullValueHandling = NullValueHandling.Ignore)]
        public long? The1502 { get; set; }
    }

    public partial class MfSipInfo
    {
        public static MfSipInfo FromJson(string json) => JsonConvert.DeserializeObject<MfSipInfo>(json, MfSipInfo.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this MfSipInfo self) => JsonConvert.SerializeObject(self, MfSipInfo.Converter.Settings);
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
