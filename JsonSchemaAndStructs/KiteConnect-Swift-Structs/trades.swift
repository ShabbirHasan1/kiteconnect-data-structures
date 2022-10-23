// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trades = try Trades(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.tradesTask(with: url) { trades, response, error in
//     if let trades = trades {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTrades { response in
//     if let trades = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Trades
struct Trades: Codable {
    let data: [Datum]?
    let status: String?
}

// MARK: Trades convenience initializers and mutators

extension Trades {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Trades.self, from: data)
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
        data: [Datum]?? = nil,
        status: String?? = nil
    ) -> Trades {
        return Trades(
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
    let exchange, exchangeOrderID: String?
    let exchangeTimestamp, fillTimestamp: Date?
    let instrumentToken: Int?
    let orderID, orderTimestamp, product: String?
    let quantity: Int?
    let tradeID, tradingsymbol, transactionType: String?

    enum CodingKeys: String, CodingKey {
        case averagePrice = "average_price"
        case exchange
        case exchangeOrderID = "exchange_order_id"
        case exchangeTimestamp = "exchange_timestamp"
        case fillTimestamp = "fill_timestamp"
        case instrumentToken = "instrument_token"
        case orderID = "order_id"
        case orderTimestamp = "order_timestamp"
        case product, quantity
        case tradeID = "trade_id"
        case tradingsymbol
        case transactionType = "transaction_type"
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
        exchange: String?? = nil,
        exchangeOrderID: String?? = nil,
        exchangeTimestamp: Date?? = nil,
        fillTimestamp: Date?? = nil,
        instrumentToken: Int?? = nil,
        orderID: String?? = nil,
        orderTimestamp: String?? = nil,
        product: String?? = nil,
        quantity: Int?? = nil,
        tradeID: String?? = nil,
        tradingsymbol: String?? = nil,
        transactionType: String?? = nil
    ) -> Datum {
        return Datum(
            averagePrice: averagePrice ?? self.averagePrice,
            exchange: exchange ?? self.exchange,
            exchangeOrderID: exchangeOrderID ?? self.exchangeOrderID,
            exchangeTimestamp: exchangeTimestamp ?? self.exchangeTimestamp,
            fillTimestamp: fillTimestamp ?? self.fillTimestamp,
            instrumentToken: instrumentToken ?? self.instrumentToken,
            orderID: orderID ?? self.orderID,
            orderTimestamp: orderTimestamp ?? self.orderTimestamp,
            product: product ?? self.product,
            quantity: quantity ?? self.quantity,
            tradeID: tradeID ?? self.tradeID,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            transactionType: transactionType ?? self.transactionType
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

    func tradesTask(with url: URL, completionHandler: @escaping (Trades?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseTrades(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Trades>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
