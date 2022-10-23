// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let margins = try Margins(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.marginsTask(with: url) { margins, response, error in
//     if let margins = margins {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMargins { response in
//     if let margins = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Margins
struct Margins: Codable {
    let data: DataClass?
    let status: String?
}

// MARK: Margins convenience initializers and mutators

extension Margins {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Margins.self, from: data)
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
        data: DataClass?? = nil,
        status: String?? = nil
    ) -> Margins {
        return Margins(
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
//   let task = URLSession.shared.dataClassTask(with: url) { dataClass, response, error in
//     if let dataClass = dataClass {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDataClass { response in
//     if let dataClass = response.result.value {
//       ...
//     }
//   }

// MARK: - DataClass
struct DataClass: Codable {
    let commodity, equity: Ity?
}

// MARK: DataClass convenience initializers and mutators

extension DataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DataClass.self, from: data)
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
        commodity: Ity?? = nil,
        equity: Ity?? = nil
    ) -> DataClass {
        return DataClass(
            commodity: commodity ?? self.commodity,
            equity: equity ?? self.equity
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
//   let task = URLSession.shared.ityTask(with: url) { ity, response, error in
//     if let ity = ity {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseIty { response in
//     if let ity = response.result.value {
//       ...
//     }
//   }

// MARK: - Ity
struct Ity: Codable {
    let available: Available?
    let enabled: Bool?
    let net: Double?
    let utilised: [String: Double]?
}

// MARK: Ity convenience initializers and mutators

extension Ity {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Ity.self, from: data)
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
        available: Available?? = nil,
        enabled: Bool?? = nil,
        net: Double?? = nil,
        utilised: [String: Double]?? = nil
    ) -> Ity {
        return Ity(
            available: available ?? self.available,
            enabled: enabled ?? self.enabled,
            net: net ?? self.net,
            utilised: utilised ?? self.utilised
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
//   let task = URLSession.shared.availableTask(with: url) { available, response, error in
//     if let available = available {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseAvailable { response in
//     if let available = response.result.value {
//       ...
//     }
//   }

// MARK: - Available
struct Available: Codable {
    let adhocMargin: Int?
    let cash: Double?
    let collateral, intradayPayin: Int?
    let liveBalance, openingBalance: Double?

    enum CodingKeys: String, CodingKey {
        case adhocMargin = "adhoc_margin"
        case cash, collateral
        case intradayPayin = "intraday_payin"
        case liveBalance = "live_balance"
        case openingBalance = "opening_balance"
    }
}

// MARK: Available convenience initializers and mutators

extension Available {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Available.self, from: data)
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
        adhocMargin: Int?? = nil,
        cash: Double?? = nil,
        collateral: Int?? = nil,
        intradayPayin: Int?? = nil,
        liveBalance: Double?? = nil,
        openingBalance: Double?? = nil
    ) -> Available {
        return Available(
            adhocMargin: adhocMargin ?? self.adhocMargin,
            cash: cash ?? self.cash,
            collateral: collateral ?? self.collateral,
            intradayPayin: intradayPayin ?? self.intradayPayin,
            liveBalance: liveBalance ?? self.liveBalance,
            openingBalance: openingBalance ?? self.openingBalance
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

    func marginsTask(with url: URL, completionHandler: @escaping (Margins?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseMargins(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Margins>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
