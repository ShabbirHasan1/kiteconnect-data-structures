// To parse this JSON data, do
//
//     final tickerLtp = tickerLtpFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class TickerLtp {
    TickerLtp({
        @required this.instrumentToken,
        @required this.lastPrice,
        @required this.mode,
        @required this.tradable,
    });

    final int instrumentToken;
    final double lastPrice;
    final String mode;
    final bool tradable;

    TickerLtp copyWith({
        int instrumentToken,
        double lastPrice,
        String mode,
        bool tradable,
    }) => 
        TickerLtp(
            instrumentToken: instrumentToken ?? this.instrumentToken,
            lastPrice: lastPrice ?? this.lastPrice,
            mode: mode ?? this.mode,
            tradable: tradable ?? this.tradable,
        );

    factory TickerLtp.fromJson(String str) => TickerLtp.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TickerLtp.fromMap(Map<String, dynamic> json) => TickerLtp(
        instrumentToken: json["instrument_token"] == null ? null : json["instrument_token"],
        lastPrice: json["last_price"] == null ? null : json["last_price"].toDouble(),
        mode: json["mode"] == null ? null : json["mode"],
        tradable: json["tradable"] == null ? null : json["tradable"],
    );

    Map<String, dynamic> toMap() => {
        "instrument_token": instrumentToken == null ? null : instrumentToken,
        "last_price": lastPrice == null ? null : lastPrice,
        "mode": mode == null ? null : mode,
        "tradable": tradable == null ? null : tradable,
    };
}
