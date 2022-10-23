// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let basketMargins = try BasketMargins(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.basketMarginsTask(with: url) { basketMargins, response, error in
//     if let basketMargins = basketMargins {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseBasketMargins { response in
//     if let basketMargins = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - BasketMargins
struct BasketMargins: Codable {
    let data: DataClass?
    let status: String?
}

// MARK: BasketMargins convenience initializers and mutators

extension BasketMargins {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(BasketMargins.self, from: data)
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
    ) -> BasketMargins {
        return BasketMargins(
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
    let dataFinal, initial: Final?
    let orders: [Final]?

    enum CodingKeys: String, CodingKey {
        case dataFinal = "final"
        case initial, orders
    }
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
        dataFinal: Final?? = nil,
        initial: Final?? = nil,
        orders: [Final]?? = nil
    ) -> DataClass {
        return DataClass(
            dataFinal: dataFinal ?? self.dataFinal,
            initial: initial ?? self.initial,
            orders: orders ?? self.orders
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
//   let task = URLSession.shared.finalTask(with: url) { final, response, error in
//     if let final = final {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseFinal { response in
//     if let final = response.result.value {
//       ...
//     }
//   }

// MARK: - Final
struct Final: Codable {
    let additional, bo, cash: Int?
    let exchange: String?
    let exposure, optionPremium: Double?
    let pnl: Pnl?
    let span, total: Double?
    let tradingsymbol, type: String?
    let finalVar: Int?

    enum CodingKeys: String, CodingKey {
        case additional, bo, cash, exchange, exposure
        case optionPremium = "option_premium"
        case pnl, span, total, tradingsymbol, type
        case finalVar = "var"
    }
}

// MARK: Final convenience initializers and mutators

extension Final {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Final.self, from: data)
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
        additional: Int?? = nil,
        bo: Int?? = nil,
        cash: Int?? = nil,
        exchange: String?? = nil,
        exposure: Double?? = nil,
        optionPremium: Double?? = nil,
        pnl: Pnl?? = nil,
        span: Double?? = nil,
        total: Double?? = nil,
        tradingsymbol: String?? = nil,
        type: String?? = nil,
        finalVar: Int?? = nil
    ) -> Final {
        return Final(
            additional: additional ?? self.additional,
            bo: bo ?? self.bo,
            cash: cash ?? self.cash,
            exchange: exchange ?? self.exchange,
            exposure: exposure ?? self.exposure,
            optionPremium: optionPremium ?? self.optionPremium,
            pnl: pnl ?? self.pnl,
            span: span ?? self.span,
            total: total ?? self.total,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            type: type ?? self.type,
            finalVar: finalVar ?? self.finalVar
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
//   let task = URLSession.shared.pnlTask(with: url) { pnl, response, error in
//     if let pnl = pnl {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePnl { response in
//     if let pnl = response.result.value {
//       ...
//     }
//   }

// MARK: - Pnl
struct Pnl: Codable {
    let realised, unrealised: Int?
}

// MARK: Pnl convenience initializers and mutators

extension Pnl {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Pnl.self, from: data)
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
        realised: Int?? = nil,
        unrealised: Int?? = nil
    ) -> Pnl {
        return Pnl(
            realised: realised ?? self.realised,
            unrealised: unrealised ?? self.unrealised
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

    func basketMarginsTask(with url: URL, completionHandler: @escaping (BasketMargins?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseBasketMargins(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<BasketMargins>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
