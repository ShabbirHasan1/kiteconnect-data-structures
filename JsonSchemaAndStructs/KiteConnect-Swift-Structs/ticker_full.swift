// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tickerFull = try TickerFull(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.tickerFullTask(with: url) { tickerFull, response, error in
//     if let tickerFull = tickerFull {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTickerFull { response in
//     if let tickerFull = response.result.value {
//       ...
//     }
//   }
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation
import Alamofire

// MARK: - TickerFull
public struct TickerFull: Codable, Hashable {
    public let averagePrice: Double?
    public let buyQuantity: Int?
    public let change: Double?
    public let depth: TickerFullDepth?
    public let instrumentToken: Int?
    public let lastPrice: Double?
    public let lastQuantity: Int?
    public let lastTradeTime: Date?
    public let mode: String?
    public let ohlc: TickerFullOhlc?
    public let oi, oiDayHigh, oiDayLow, sellQuantity: Int?
    public let timestamp: Date?
    public let tradable: Bool?
    public let volume: Int?

    enum CodingKeys: String, CodingKey {
        case averagePrice = "average_price"
        case buyQuantity = "buy_quantity"
        case change, depth
        case instrumentToken = "instrument_token"
        case lastPrice = "last_price"
        case lastQuantity = "last_quantity"
        case lastTradeTime = "last_trade_time"
        case mode, ohlc, oi
        case oiDayHigh = "oi_day_high"
        case oiDayLow = "oi_day_low"
        case sellQuantity = "sell_quantity"
        case timestamp, tradable, volume
    }

    public init(averagePrice: Double?, buyQuantity: Int?, change: Double?, depth: TickerFullDepth?, instrumentToken: Int?, lastPrice: Double?, lastQuantity: Int?, lastTradeTime: Date?, mode: String?, ohlc: TickerFullOhlc?, oi: Int?, oiDayHigh: Int?, oiDayLow: Int?, sellQuantity: Int?, timestamp: Date?, tradable: Bool?, volume: Int?) {
        self.averagePrice = averagePrice
        self.buyQuantity = buyQuantity
        self.change = change
        self.depth = depth
        self.instrumentToken = instrumentToken
        self.lastPrice = lastPrice
        self.lastQuantity = lastQuantity
        self.lastTradeTime = lastTradeTime
        self.mode = mode
        self.ohlc = ohlc
        self.oi = oi
        self.oiDayHigh = oiDayHigh
        self.oiDayLow = oiDayLow
        self.sellQuantity = sellQuantity
        self.timestamp = timestamp
        self.tradable = tradable
        self.volume = volume
    }
}

// MARK: TickerFull convenience initializers and mutators

public extension TickerFull {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TickerFull.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        averagePrice: Double?? = nil,
        buyQuantity: Int?? = nil,
        change: Double?? = nil,
        depth: TickerFullDepth?? = nil,
        instrumentToken: Int?? = nil,
        lastPrice: Double?? = nil,
        lastQuantity: Int?? = nil,
        lastTradeTime: Date?? = nil,
        mode: String?? = nil,
        ohlc: TickerFullOhlc?? = nil,
        oi: Int?? = nil,
        oiDayHigh: Int?? = nil,
        oiDayLow: Int?? = nil,
        sellQuantity: Int?? = nil,
        timestamp: Date?? = nil,
        tradable: Bool?? = nil,
        volume: Int?? = nil
    ) -> TickerFull {
        return TickerFull(
            averagePrice: averagePrice ?? self.averagePrice,
            buyQuantity: buyQuantity ?? self.buyQuantity,
            change: change ?? self.change,
            depth: depth ?? self.depth,
            instrumentToken: instrumentToken ?? self.instrumentToken,
            lastPrice: lastPrice ?? self.lastPrice,
            lastQuantity: lastQuantity ?? self.lastQuantity,
            lastTradeTime: lastTradeTime ?? self.lastTradeTime,
            mode: mode ?? self.mode,
            ohlc: ohlc ?? self.ohlc,
            oi: oi ?? self.oi,
            oiDayHigh: oiDayHigh ?? self.oiDayHigh,
            oiDayLow: oiDayLow ?? self.oiDayLow,
            sellQuantity: sellQuantity ?? self.sellQuantity,
            timestamp: timestamp ?? self.timestamp,
            tradable: tradable ?? self.tradable,
            volume: volume ?? self.volume
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.tickerFullDepthTask(with: url) { tickerFullDepth, response, error in
//     if let tickerFullDepth = tickerFullDepth {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTickerFullDepth { response in
//     if let tickerFullDepth = response.result.value {
//       ...
//     }
//   }
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - TickerFullDepth
public struct TickerFullDepth: Codable, Hashable {
    public let buy, sell: [TickerFullBuy]?

    public init(buy: [TickerFullBuy]?, sell: [TickerFullBuy]?) {
        self.buy = buy
        self.sell = sell
    }
}

// MARK: TickerFullDepth convenience initializers and mutators

public extension TickerFullDepth {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TickerFullDepth.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        buy: [TickerFullBuy]?? = nil,
        sell: [TickerFullBuy]?? = nil
    ) -> TickerFullDepth {
        return TickerFullDepth(
            buy: buy ?? self.buy,
            sell: sell ?? self.sell
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.tickerFullBuyTask(with: url) { tickerFullBuy, response, error in
//     if let tickerFullBuy = tickerFullBuy {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTickerFullBuy { response in
//     if let tickerFullBuy = response.result.value {
//       ...
//     }
//   }
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - TickerFullBuy
public struct TickerFullBuy: Codable, Hashable {
    public let orders: Int?
    public let price: Double?
    public let quantity: Int?

    public init(orders: Int?, price: Double?, quantity: Int?) {
        self.orders = orders
        self.price = price
        self.quantity = quantity
    }
}

// MARK: TickerFullBuy convenience initializers and mutators

public extension TickerFullBuy {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TickerFullBuy.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        orders: Int?? = nil,
        price: Double?? = nil,
        quantity: Int?? = nil
    ) -> TickerFullBuy {
        return TickerFullBuy(
            orders: orders ?? self.orders,
            price: price ?? self.price,
            quantity: quantity ?? self.quantity
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.tickerFullOhlcTask(with: url) { tickerFullOhlc, response, error in
//     if let tickerFullOhlc = tickerFullOhlc {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTickerFullOhlc { response in
//     if let tickerFullOhlc = response.result.value {
//       ...
//     }
//   }
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - TickerFullOhlc
public struct TickerFullOhlc: Codable, Hashable {
    public let close: Double?
    public let high: Int?
    public let low, ohlcOpen: Double?

    enum CodingKeys: String, CodingKey {
        case close, high, low
        case ohlcOpen = "open"
    }

    public init(close: Double?, high: Int?, low: Double?, ohlcOpen: Double?) {
        self.close = close
        self.high = high
        self.low = low
        self.ohlcOpen = ohlcOpen
    }
}

// MARK: TickerFullOhlc convenience initializers and mutators

public extension TickerFullOhlc {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TickerFullOhlc.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        close: Double?? = nil,
        high: Int?? = nil,
        low: Double?? = nil,
        ohlcOpen: Double?? = nil
    ) -> TickerFullOhlc {
        return TickerFullOhlc(
            close: close ?? self.close,
            high: high ?? self.high,
            low: low ?? self.low,
            ohlcOpen: ohlcOpen ?? self.ohlcOpen
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

public extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func tickerFullTask(with url: URL, completionHandler: @escaping (TickerFull?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

// MARK: - Alamofire response handlers

public extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }

            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }

            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }

    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }

    @discardableResult
    func responseTickerFull(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<TickerFull>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
