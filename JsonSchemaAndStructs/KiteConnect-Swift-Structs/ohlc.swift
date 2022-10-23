// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ohlc = try Ohlc(json)

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

import Foundation
import Alamofire

// MARK: - Ohlc
struct Ohlc: Codable {
    let data: [String: Datum]?
    let status: String?
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
        data: [String: Datum]?? = nil,
        status: String?? = nil
    ) -> Ohlc {
        return Ohlc(
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
    let instrumentToken, lastPrice: Int?
    let ohlc: OhlcClass?

    enum CodingKeys: String, CodingKey {
        case instrumentToken = "instrument_token"
        case lastPrice = "last_price"
        case ohlc
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
        instrumentToken: Int?? = nil,
        lastPrice: Int?? = nil,
        ohlc: OhlcClass?? = nil
    ) -> Datum {
        return Datum(
            instrumentToken: instrumentToken ?? self.instrumentToken,
            lastPrice: lastPrice ?? self.lastPrice,
            ohlc: ohlc ?? self.ohlc
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
//   let task = URLSession.shared.ohlcClassTask(with: url) { ohlcClass, response, error in
//     if let ohlcClass = ohlcClass {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseOhlcClass { response in
//     if let ohlcClass = response.result.value {
//       ...
//     }
//   }

// MARK: - OhlcClass
struct OhlcClass: Codable {
    let close, high, low, ohlcClassOpen: Double?

    enum CodingKeys: String, CodingKey {
        case close, high, low
        case ohlcClassOpen = "open"
    }
}

// MARK: OhlcClass convenience initializers and mutators

extension OhlcClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(OhlcClass.self, from: data)
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
        ohlcClassOpen: Double?? = nil
    ) -> OhlcClass {
        return OhlcClass(
            close: close ?? self.close,
            high: high ?? self.high,
            low: low ?? self.low,
            ohlcClassOpen: ohlcClassOpen ?? self.ohlcClassOpen
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

    func ohlcTask(with url: URL, completionHandler: @escaping (Ohlc?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseOhlc(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Ohlc>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
