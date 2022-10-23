// To parse this JSON data, do
//
//     final tickerQuote = tickerQuoteFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class TickerQuote {
    TickerQuote({
        @required this.averagePrice,
        @required this.buyQuantity,
        @required this.change,
        @required this.instrumentToken,
        @required this.lastPrice,
        @required this.lastQuantity,
        @required this.mode,
        @required this.ohlc,
        @required this.sellQuantity,
        @required this.tradable,
        @required this.volume,
    });

    final double averagePrice;
    final int buyQuantity;
    final double change;
    final int instrumentToken;
    final double lastPrice;
    final int lastQuantity;
    final String mode;
    final Ohlc ohlc;
    final int sellQuantity;
    final bool tradable;
    final int volume;

    TickerQuote copyWith({
        double averagePrice,
        int buyQuantity,
        double change,
        int instrumentToken,
        double lastPrice,
        int lastQuantity,
        String mode,
        Ohlc ohlc,
        int sellQuantity,
        bool tradable,
        int volume,
    }) => 
        TickerQuote(
            averagePrice: averagePrice ?? this.averagePrice,
            buyQuantity: buyQuantity ?? this.buyQuantity,
            change: change ?? this.change,
            instrumentToken: instrumentToken ?? this.instrumentToken,
            lastPrice: lastPrice ?? this.lastPrice,
            lastQuantity: lastQuantity ?? this.lastQuantity,
            mode: mode ?? this.mode,
            ohlc: ohlc ?? this.ohlc,
            sellQuantity: sellQuantity ?? this.sellQuantity,
            tradable: tradable ?? this.tradable,
            volume: volume ?? this.volume,
        );

    factory TickerQuote.fromJson(String str) => TickerQuote.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TickerQuote.fromMap(Map<String, dynamic> json) => TickerQuote(
        averagePrice: json["average_price"] == null ? null : json["average_price"].toDouble(),
        buyQuantity: json["buy_quantity"] == null ? null : json["buy_quantity"],
        change: json["change"] == null ? null : json["change"].toDouble(),
        instrumentToken: json["instrument_token"] == null ? null : json["instrument_token"],
        lastPrice: json["last_price"] == null ? null : json["last_price"].toDouble(),
        lastQuantity: json["last_quantity"] == null ? null : json["last_quantity"],
        mode: json["mode"] == null ? null : json["mode"],
        ohlc: json["ohlc"] == null ? null : Ohlc.fromMap(json["ohlc"]),
        sellQuantity: json["sell_quantity"] == null ? null : json["sell_quantity"],
        tradable: json["tradable"] == null ? null : json["tradable"],
        volume: json["volume"] == null ? null : json["volume"],
    );

    Map<String, dynamic> toMap() => {
        "average_price": averagePrice == null ? null : averagePrice,
        "buy_quantity": buyQuantity == null ? null : buyQuantity,
        "change": change == null ? null : change,
        "instrument_token": instrumentToken == null ? null : instrumentToken,
        "last_price": lastPrice == null ? null : lastPrice,
        "last_quantity": lastQuantity == null ? null : lastQuantity,
        "mode": mode == null ? null : mode,
        "ohlc": ohlc == null ? null : ohlc.toMap(),
        "sell_quantity": sellQuantity == null ? null : sellQuantity,
        "tradable": tradable == null ? null : tradable,
        "volume": volume == null ? null : volume,
    };
}

class Ohlc {
    Ohlc({
        @required this.close,
        @required this.high,
        @required this.low,
        @required this.open,
    });

    final double close;
    final int high;
    final double low;
    final double open;

    Ohlc copyWith({
        double close,
        int high,
        double low,
        double open,
    }) => 
        Ohlc(
            close: close ?? this.close,
            high: high ?? this.high,
            low: low ?? this.low,
            open: open ?? this.open,
        );

    factory Ohlc.fromJson(String str) => Ohlc.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ohlc.fromMap(Map<String, dynamic> json) => Ohlc(
        close: json["close"] == null ? null : json["close"].toDouble(),
        high: json["high"] == null ? null : json["high"],
        low: json["low"] == null ? null : json["low"].toDouble(),
        open: json["open"] == null ? null : json["open"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "close": close == null ? null : close,
        "high": high == null ? null : high,
        "low": low == null ? null : low,
        "open": open == null ? null : open,
    };
}
