// To parse this JSON data, do
//
//     final tickerFull = tickerFullFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class TickerFull {
    TickerFull({
        @required this.averagePrice,
        @required this.buyQuantity,
        @required this.change,
        @required this.depth,
        @required this.instrumentToken,
        @required this.lastPrice,
        @required this.lastQuantity,
        @required this.lastTradeTime,
        @required this.mode,
        @required this.ohlc,
        @required this.oi,
        @required this.oiDayHigh,
        @required this.oiDayLow,
        @required this.sellQuantity,
        @required this.timestamp,
        @required this.tradable,
        @required this.volume,
    });

    final double averagePrice;
    final int buyQuantity;
    final double change;
    final Depth depth;
    final int instrumentToken;
    final double lastPrice;
    final int lastQuantity;
    final DateTime lastTradeTime;
    final String mode;
    final Ohlc ohlc;
    final int oi;
    final int oiDayHigh;
    final int oiDayLow;
    final int sellQuantity;
    final DateTime timestamp;
    final bool tradable;
    final int volume;

    TickerFull copyWith({
        double averagePrice,
        int buyQuantity,
        double change,
        Depth depth,
        int instrumentToken,
        double lastPrice,
        int lastQuantity,
        DateTime lastTradeTime,
        String mode,
        Ohlc ohlc,
        int oi,
        int oiDayHigh,
        int oiDayLow,
        int sellQuantity,
        DateTime timestamp,
        bool tradable,
        int volume,
    }) => 
        TickerFull(
            averagePrice: averagePrice ?? this.averagePrice,
            buyQuantity: buyQuantity ?? this.buyQuantity,
            change: change ?? this.change,
            depth: depth ?? this.depth,
            instrumentToken: instrumentToken ?? this.instrumentToken,
            lastPrice: lastPrice ?? this.lastPrice,
            lastQuantity: lastQuantity ?? this.lastQuantity,
            lastTradeTime: lastTradeTime ?? this.lastTradeTime,
            mode: mode ?? this.mode,
            ohlc: ohlc ?? this.ohlc,
            oi: oi ?? this.oi,
            oiDayHigh: oiDayHigh ?? this.oiDayHigh,
            oiDayLow: oiDayLow ?? this.oiDayLow,
            sellQuantity: sellQuantity ?? this.sellQuantity,
            timestamp: timestamp ?? this.timestamp,
            tradable: tradable ?? this.tradable,
            volume: volume ?? this.volume,
        );

    factory TickerFull.fromJson(String str) => TickerFull.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TickerFull.fromMap(Map<String, dynamic> json) => TickerFull(
        averagePrice: json["average_price"] == null ? null : json["average_price"].toDouble(),
        buyQuantity: json["buy_quantity"] == null ? null : json["buy_quantity"],
        change: json["change"] == null ? null : json["change"].toDouble(),
        depth: json["depth"] == null ? null : Depth.fromMap(json["depth"]),
        instrumentToken: json["instrument_token"] == null ? null : json["instrument_token"],
        lastPrice: json["last_price"] == null ? null : json["last_price"].toDouble(),
        lastQuantity: json["last_quantity"] == null ? null : json["last_quantity"],
        lastTradeTime: json["last_trade_time"] == null ? null : DateTime.parse(json["last_trade_time"]),
        mode: json["mode"] == null ? null : json["mode"],
        ohlc: json["ohlc"] == null ? null : Ohlc.fromMap(json["ohlc"]),
        oi: json["oi"] == null ? null : json["oi"],
        oiDayHigh: json["oi_day_high"] == null ? null : json["oi_day_high"],
        oiDayLow: json["oi_day_low"] == null ? null : json["oi_day_low"],
        sellQuantity: json["sell_quantity"] == null ? null : json["sell_quantity"],
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
        tradable: json["tradable"] == null ? null : json["tradable"],
        volume: json["volume"] == null ? null : json["volume"],
    );

    Map<String, dynamic> toMap() => {
        "average_price": averagePrice == null ? null : averagePrice,
        "buy_quantity": buyQuantity == null ? null : buyQuantity,
        "change": change == null ? null : change,
        "depth": depth == null ? null : depth.toMap(),
        "instrument_token": instrumentToken == null ? null : instrumentToken,
        "last_price": lastPrice == null ? null : lastPrice,
        "last_quantity": lastQuantity == null ? null : lastQuantity,
        "last_trade_time": lastTradeTime == null ? null : lastTradeTime.toIso8601String(),
        "mode": mode == null ? null : mode,
        "ohlc": ohlc == null ? null : ohlc.toMap(),
        "oi": oi == null ? null : oi,
        "oi_day_high": oiDayHigh == null ? null : oiDayHigh,
        "oi_day_low": oiDayLow == null ? null : oiDayLow,
        "sell_quantity": sellQuantity == null ? null : sellQuantity,
        "timestamp": timestamp == null ? null : timestamp.toIso8601String(),
        "tradable": tradable == null ? null : tradable,
        "volume": volume == null ? null : volume,
    };
}

class Depth {
    Depth({
        @required this.buy,
        @required this.sell,
    });

    final List<Buy> buy;
    final List<Buy> sell;

    Depth copyWith({
        List<Buy> buy,
        List<Buy> sell,
    }) => 
        Depth(
            buy: buy ?? this.buy,
            sell: sell ?? this.sell,
        );

    factory Depth.fromJson(String str) => Depth.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Depth.fromMap(Map<String, dynamic> json) => Depth(
        buy: json["buy"] == null ? null : List<Buy>.from(json["buy"].map((x) => Buy.fromMap(x))),
        sell: json["sell"] == null ? null : List<Buy>.from(json["sell"].map((x) => Buy.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "buy": buy == null ? null : List<dynamic>.from(buy.map((x) => x.toMap())),
        "sell": sell == null ? null : List<dynamic>.from(sell.map((x) => x.toMap())),
    };
}

class Buy {
    Buy({
        @required this.orders,
        @required this.price,
        @required this.quantity,
    });

    final int orders;
    final double price;
    final int quantity;

    Buy copyWith({
        int orders,
        double price,
        int quantity,
    }) => 
        Buy(
            orders: orders ?? this.orders,
            price: price ?? this.price,
            quantity: quantity ?? this.quantity,
        );

    factory Buy.fromJson(String str) => Buy.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Buy.fromMap(Map<String, dynamic> json) => Buy(
        orders: json["orders"] == null ? null : json["orders"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        quantity: json["quantity"] == null ? null : json["quantity"],
    );

    Map<String, dynamic> toMap() => {
        "orders": orders == null ? null : orders,
        "price": price == null ? null : price,
        "quantity": quantity == null ? null : quantity,
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
