// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let instrumentsNse = try InstrumentsNse(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.instrumentsNseElementTask(with: url) { instrumentsNseElement, response, error in
//     if let instrumentsNseElement = instrumentsNseElement {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseInstrumentsNseElement { response in
//     if let instrumentsNseElement = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - InstrumentsNseElement
struct InstrumentsNseElement: Codable {
    let exchange: Exchange?
    let exchangeToken: Int?
    let expiry: String?
    let instrumentToken: Int?
    let instrumentType: InstrumentType?
    let lastPrice, lotSize: Int?
    let name: String?
    let segment: Exchange?
    let strike: Int?
    let tickSize: Double?
    let tradingsymbol: String?

    enum CodingKeys: String, CodingKey {
        case exchange
        case exchangeToken = "exchange_token"
        case expiry
        case instrumentToken = "instrument_token"
        case instrumentType = "instrument_type"
        case lastPrice = "last_price"
        case lotSize = "lot_size"
        case name, segment, strike
        case tickSize = "tick_size"
        case tradingsymbol
    }
}

// MARK: InstrumentsNseElement convenience initializers and mutators

extension InstrumentsNseElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(InstrumentsNseElement.self, from: data)
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
        exchange: Exchange?? = nil,
        exchangeToken: Int?? = nil,
        expiry: String?? = nil,
        instrumentToken: Int?? = nil,
        instrumentType: InstrumentType?? = nil,
        lastPrice: Int?? = nil,
        lotSize: Int?? = nil,
        name: String?? = nil,
        segment: Exchange?? = nil,
        strike: Int?? = nil,
        tickSize: Double?? = nil,
        tradingsymbol: String?? = nil
    ) -> InstrumentsNseElement {
        return InstrumentsNseElement(
            exchange: exchange ?? self.exchange,
            exchangeToken: exchangeToken ?? self.exchangeToken,
            expiry: expiry ?? self.expiry,
            instrumentToken: instrumentToken ?? self.instrumentToken,
            instrumentType: instrumentType ?? self.instrumentType,
            lastPrice: lastPrice ?? self.lastPrice,
            lotSize: lotSize ?? self.lotSize,
            name: name ?? self.name,
            segment: segment ?? self.segment,
            strike: strike ?? self.strike,
            tickSize: tickSize ?? self.tickSize,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Exchange: String, Codable {
    case nse = "NSE"
}

enum InstrumentType: String, Codable {
    case eq = "EQ"
}

typealias InstrumentsNse = [InstrumentsNseElement]

extension Array where Element == InstrumentsNse.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(InstrumentsNse.self, from: data)
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

    func instrumentsNseTask(with url: URL, completionHandler: @escaping (InstrumentsNse?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseInstrumentsNse(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<InstrumentsNse>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
