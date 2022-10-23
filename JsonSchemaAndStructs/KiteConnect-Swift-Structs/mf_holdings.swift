// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mFHoldings = try MFHoldings(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.mFHoldingsTask(with: url) { mFHoldings, response, error in
//     if let mFHoldings = mFHoldings {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMFHoldings { response in
//     if let mFHoldings = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - MFHoldings
struct MFHoldings: Codable {
    let data: [Datum]?
    let status: String?
}

// MARK: MFHoldings convenience initializers and mutators

extension MFHoldings {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MFHoldings.self, from: data)
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
    ) -> MFHoldings {
        return MFHoldings(
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
    let folio, fund: String?
    let lastPrice: Double?
    let lastPriceDate: String?
    let pledgedQuantity, pnl: Int?
    let quantity: Double?
    let tradingsymbol: String?

    enum CodingKeys: String, CodingKey {
        case averagePrice = "average_price"
        case folio, fund
        case lastPrice = "last_price"
        case lastPriceDate = "last_price_date"
        case pledgedQuantity = "pledged_quantity"
        case pnl, quantity, tradingsymbol
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
        folio: String?? = nil,
        fund: String?? = nil,
        lastPrice: Double?? = nil,
        lastPriceDate: String?? = nil,
        pledgedQuantity: Int?? = nil,
        pnl: Int?? = nil,
        quantity: Double?? = nil,
        tradingsymbol: String?? = nil
    ) -> Datum {
        return Datum(
            averagePrice: averagePrice ?? self.averagePrice,
            folio: folio ?? self.folio,
            fund: fund ?? self.fund,
            lastPrice: lastPrice ?? self.lastPrice,
            lastPriceDate: lastPriceDate ?? self.lastPriceDate,
            pledgedQuantity: pledgedQuantity ?? self.pledgedQuantity,
            pnl: pnl ?? self.pnl,
            quantity: quantity ?? self.quantity,
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

    func mFHoldingsTask(with url: URL, completionHandler: @escaping (MFHoldings?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseMFHoldings(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<MFHoldings>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
