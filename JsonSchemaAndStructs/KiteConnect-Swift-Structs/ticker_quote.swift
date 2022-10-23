// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tickerQuote = try TickerQuote(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.tickerQuoteTask(with: url) { tickerQuote, response, error in
//     if let tickerQuote = tickerQuote {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTickerQuote { response in
//     if let tickerQuote = response.result.value {
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

// MARK: - TickerQuote
public struct TickerQuote: Codable, Hashable {
    public let averagePrice: Double?
    public let buyQuantity: Int?
    public let change: Double?
    public let instrumentToken: Int?
    public let lastPrice: Double?
    public let lastQuantity: Int?
    public let mode: String?
    public let ohlc: TickerQuoteOhlc?
    public let sellQuantity: Int?
    public let tradable: Bool?
    public let volume: Int?

    enum CodingKeys: String, CodingKey {
        case averagePrice = "average_price"
        case buyQuantity = "buy_quantity"
        case change
        case instrumentToken = "instrument_token"
        case lastPrice = "last_price"
        case lastQuantity = "last_quantity"
        case mode, ohlc
        case sellQuantity = "sell_quantity"
        case tradable, volume
    }

    public init(averagePrice: Double?, buyQuantity: Int?, change: Double?, instrumentToken: Int?, lastPrice: Double?, lastQuantity: Int?, mode: String?, ohlc: TickerQuoteOhlc?, sellQuantity: Int?, tradable: Bool?, volume: Int?) {
        self.averagePrice = averagePrice
        self.buyQuantity = buyQuantity
        self.change = change
        self.instrumentToken = instrumentToken
        self.lastPrice = lastPrice
        self.lastQuantity = lastQuantity
        self.mode = mode
        self.ohlc = ohlc
        self.sellQuantity = sellQuantity
        self.tradable = tradable
        self.volume = volume
    }
}

// MARK: TickerQuote convenience initializers and mutators

public extension TickerQuote {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TickerQuote.self, from: data)
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
        instrumentToken: Int?? = nil,
        lastPrice: Double?? = nil,
        lastQuantity: Int?? = nil,
        mode: String?? = nil,
        ohlc: TickerQuoteOhlc?? = nil,
        sellQuantity: Int?? = nil,
        tradable: Bool?? = nil,
        volume: Int?? = nil
    ) -> TickerQuote {
        return TickerQuote(
            averagePrice: averagePrice ?? self.averagePrice,
            buyQuantity: buyQuantity ?? self.buyQuantity,
            change: change ?? self.change,
            instrumentToken: instrumentToken ?? self.instrumentToken,
            lastPrice: lastPrice ?? self.lastPrice,
            lastQuantity: lastQuantity ?? self.lastQuantity,
            mode: mode ?? self.mode,
            ohlc: ohlc ?? self.ohlc,
            sellQuantity: sellQuantity ?? self.sellQuantity,
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
//   let task = URLSession.shared.tickerQuoteOhlcTask(with: url) { tickerQuoteOhlc, response, error in
//     if let tickerQuoteOhlc = tickerQuoteOhlc {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTickerQuoteOhlc { response in
//     if let tickerQuoteOhlc = response.result.value {
//       ...
//     }
//   }
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - TickerQuoteOhlc
public struct TickerQuoteOhlc: Codable, Hashable {
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

// MARK: TickerQuoteOhlc convenience initializers and mutators

public extension TickerQuoteOhlc {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TickerQuoteOhlc.self, from: data)
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
    ) -> TickerQuoteOhlc {
        return TickerQuoteOhlc(
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

    func tickerQuoteTask(with url: URL, completionHandler: @escaping (TickerQuote?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseTickerQuote(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<TickerQuote>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
