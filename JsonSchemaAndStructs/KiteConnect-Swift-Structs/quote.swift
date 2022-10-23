// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let quote = try Quote(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.quoteTask(with: url) { quote, response, error in
//     if let quote = quote {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseQuote { response in
//     if let quote = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Quote
struct Quote: Codable {
    let data: [String: Datum]?
    let status: String?
}

// MARK: Quote convenience initializers and mutators

extension Quote {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Quote.self, from: data)
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
        data: [String: Datum]?? = nil,
        status: String?? = nil
    ) -> Quote {
        return Quote(
            data: data ?? self.data,
            status: status ?? self.status
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
//   let task = URLSession.shared.datumTask(with: url) { datum, response, error in
//     if let datum = datum {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDatum { response in
//     if let datum = response.result.value {
//       ...
//     }
//   }

// MARK: - Datum
struct Datum: Codable {
    let averagePrice: Double?
    let buyQuantity: Int?
    let depth: Depth?
    let instrumentToken: Int?
    let lastPrice: Double?
    let lastQuantity: Int?
    let lastTradeTime: Date?
    let lowerCircuitLimit: Double?
    let netChange: Int?
    let ohlc: Ohlc?
    let oi, oiDayHigh, oiDayLow, sellQuantity: Int?
    let timestamp: Date?
    let upperCircuitLimit: Double?
    let volume: Int?

    enum CodingKeys: String, CodingKey {
        case averagePrice = "average_price"
        case buyQuantity = "buy_quantity"
        case depth
        case instrumentToken = "instrument_token"
        case lastPrice = "last_price"
        case lastQuantity = "last_quantity"
        case lastTradeTime = "last_trade_time"
        case lowerCircuitLimit = "lower_circuit_limit"
        case netChange = "net_change"
        case ohlc, oi
        case oiDayHigh = "oi_day_high"
        case oiDayLow = "oi_day_low"
        case sellQuantity = "sell_quantity"
        case timestamp
        case upperCircuitLimit = "upper_circuit_limit"
        case volume
    }
}

// MARK: Datum convenience initializers and mutators

extension Datum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Datum.self, from: data)
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
        depth: Depth?? = nil,
        instrumentToken: Int?? = nil,
        lastPrice: Double?? = nil,
        lastQuantity: Int?? = nil,
        lastTradeTime: Date?? = nil,
        lowerCircuitLimit: Double?? = nil,
        netChange: Int?? = nil,
        ohlc: Ohlc?? = nil,
        oi: Int?? = nil,
        oiDayHigh: Int?? = nil,
        oiDayLow: Int?? = nil,
        sellQuantity: Int?? = nil,
        timestamp: Date?? = nil,
        upperCircuitLimit: Double?? = nil,
        volume: Int?? = nil
    ) -> Datum {
        return Datum(
            averagePrice: averagePrice ?? self.averagePrice,
            buyQuantity: buyQuantity ?? self.buyQuantity,
            depth: depth ?? self.depth,
            instrumentToken: instrumentToken ?? self.instrumentToken,
            lastPrice: lastPrice ?? self.lastPrice,
            lastQuantity: lastQuantity ?? self.lastQuantity,
            lastTradeTime: lastTradeTime ?? self.lastTradeTime,
            lowerCircuitLimit: lowerCircuitLimit ?? self.lowerCircuitLimit,
            netChange: netChange ?? self.netChange,
            ohlc: ohlc ?? self.ohlc,
            oi: oi ?? self.oi,
            oiDayHigh: oiDayHigh ?? self.oiDayHigh,
            oiDayLow: oiDayLow ?? self.oiDayLow,
            sellQuantity: sellQuantity ?? self.sellQuantity,
            timestamp: timestamp ?? self.timestamp,
            upperCircuitLimit: upperCircuitLimit ?? self.upperCircuitLimit,
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
//   let task = URLSession.shared.depthTask(with: url) { depth, response, error in
//     if let depth = depth {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDepth { response in
//     if let depth = response.result.value {
//       ...
//     }
//   }

// MARK: - Depth
struct Depth: Codable {
    let buy, sell: [Buy]?
}

// MARK: Depth convenience initializers and mutators

extension Depth {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Depth.self, from: data)
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
        buy: [Buy]?? = nil,
        sell: [Buy]?? = nil
    ) -> Depth {
        return Depth(
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
//   let task = URLSession.shared.buyTask(with: url) { buy, response, error in
//     if let buy = buy {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseBuy { response in
//     if let buy = response.result.value {
//       ...
//     }
//   }

// MARK: - Buy
struct Buy: Codable {
    let orders: Int?
    let price: Double?
    let quantity: Int?
}

// MARK: Buy convenience initializers and mutators

extension Buy {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Buy.self, from: data)
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
    ) -> Buy {
        return Buy(
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
//   let task = URLSession.shared.ohlcTask(with: url) { ohlc, response, error in
//     if let ohlc = ohlc {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseOhlc { response in
//     if let ohlc = response.result.value {
//       ...
//     }
//   }

// MARK: - Ohlc
struct Ohlc: Codable {
    let close, high, low: Double?
    let ohlcOpen: Int?

    enum CodingKeys: String, CodingKey {
        case close, high, low
        case ohlcOpen = "open"
    }
}

// MARK: Ohlc convenience initializers and mutators

extension Ohlc {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Ohlc.self, from: data)
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
        high: Double?? = nil,
        low: Double?? = nil,
        ohlcOpen: Int?? = nil
    ) -> Ohlc {
        return Ohlc(
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

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func quoteTask(with url: URL, completionHandler: @escaping (Quote?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

// MARK: - Alamofire response handlers

extension DataRequest {
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
    func responseQuote(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Quote>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
