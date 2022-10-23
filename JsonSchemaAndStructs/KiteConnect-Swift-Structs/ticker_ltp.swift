// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tickerQuoteTickerLtp = try TickerQuoteTickerLtp(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.tickerQuoteTickerLtpTask(with: url) { tickerQuoteTickerLtp, response, error in
//     if let tickerQuoteTickerLtp = tickerQuoteTickerLtp {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTickerQuoteTickerLtp { response in
//     if let tickerQuoteTickerLtp = response.result.value {
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

// MARK: - TickerQuoteTickerLtp
public struct TickerQuoteTickerLtp: Codable, Hashable {
    public let instrumentToken: Int?
    public let lastPrice: Double?
    public let mode: String?
    public let tradable: Bool?

    enum CodingKeys: String, CodingKey {
        case instrumentToken = "instrument_token"
        case lastPrice = "last_price"
        case mode, tradable
    }

    public init(instrumentToken: Int?, lastPrice: Double?, mode: String?, tradable: Bool?) {
        self.instrumentToken = instrumentToken
        self.lastPrice = lastPrice
        self.mode = mode
        self.tradable = tradable
    }
}

// MARK: TickerQuoteTickerLtp convenience initializers and mutators

public extension TickerQuoteTickerLtp {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TickerQuoteTickerLtp.self, from: data)
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
        instrumentToken: Int?? = nil,
        lastPrice: Double?? = nil,
        mode: String?? = nil,
        tradable: Bool?? = nil
    ) -> TickerQuoteTickerLtp {
        return TickerQuoteTickerLtp(
            instrumentToken: instrumentToken ?? self.instrumentToken,
            lastPrice: lastPrice ?? self.lastPrice,
            mode: mode ?? self.mode,
            tradable: tradable ?? self.tradable
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

    func tickerQuoteTickerLtpTask(with url: URL, completionHandler: @escaping (TickerQuoteTickerLtp?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseTickerQuoteTickerLtp(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<TickerQuoteTickerLtp>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
