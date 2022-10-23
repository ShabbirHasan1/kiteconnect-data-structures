// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let positions = try Positions(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.positionsTask(with: url) { positions, response, error in
//     if let positions = positions {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePositions { response in
//     if let positions = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Positions
struct Positions: Codable {
    let data: DataClass?
    let status: String?
}

// MARK: Positions convenience initializers and mutators

extension Positions {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Positions.self, from: data)
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
    ) -> Positions {
        return Positions(
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
    let day, net: [Day]?
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
        day: [Day]?? = nil,
        net: [Day]?? = nil
    ) -> DataClass {
        return DataClass(
            day: day ?? self.day,
            net: net ?? self.net
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
//   let task = URLSession.shared.dayTask(with: url) { day, response, error in
//     if let day = day {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDay { response in
//     if let day = response.result.value {
//       ...
//     }
//   }

// MARK: - Day
struct Day: Codable {
    let averagePrice: Double?
    let buyM2M: Int?
    let buyPrice: Double?
    let buyQuantity, buyValue, closePrice: Int?
    let dayBuyPrice: Double?
    let dayBuyQuantity, dayBuyValue, daySellPrice, daySellQuantity: Int?
    let daySellValue: Int?
    let exchange: String?
    let instrumentToken: Int?
    let lastPrice: Double?
    let m2M, multiplier, overnightQuantity, pnl: Int?
    let product: String?
    let quantity, realised, sellM2M, sellPrice: Int?
    let sellQuantity, sellValue: Int?
    let tradingsymbol: String?
    let unrealised, value: Int?

    enum CodingKeys: String, CodingKey {
        case averagePrice = "average_price"
        case buyM2M = "buy_m2m"
        case buyPrice = "buy_price"
        case buyQuantity = "buy_quantity"
        case buyValue = "buy_value"
        case closePrice = "close_price"
        case dayBuyPrice = "day_buy_price"
        case dayBuyQuantity = "day_buy_quantity"
        case dayBuyValue = "day_buy_value"
        case daySellPrice = "day_sell_price"
        case daySellQuantity = "day_sell_quantity"
        case daySellValue = "day_sell_value"
        case exchange
        case instrumentToken = "instrument_token"
        case lastPrice = "last_price"
        case m2M = "m2m"
        case multiplier
        case overnightQuantity = "overnight_quantity"
        case pnl, product, quantity, realised
        case sellM2M = "sell_m2m"
        case sellPrice = "sell_price"
        case sellQuantity = "sell_quantity"
        case sellValue = "sell_value"
        case tradingsymbol, unrealised, value
    }
}

// MARK: Day convenience initializers and mutators

extension Day {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Day.self, from: data)
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
        buyM2M: Int?? = nil,
        buyPrice: Double?? = nil,
        buyQuantity: Int?? = nil,
        buyValue: Int?? = nil,
        closePrice: Int?? = nil,
        dayBuyPrice: Double?? = nil,
        dayBuyQuantity: Int?? = nil,
        dayBuyValue: Int?? = nil,
        daySellPrice: Int?? = nil,
        daySellQuantity: Int?? = nil,
        daySellValue: Int?? = nil,
        exchange: String?? = nil,
        instrumentToken: Int?? = nil,
        lastPrice: Double?? = nil,
        m2M: Int?? = nil,
        multiplier: Int?? = nil,
        overnightQuantity: Int?? = nil,
        pnl: Int?? = nil,
        product: String?? = nil,
        quantity: Int?? = nil,
        realised: Int?? = nil,
        sellM2M: Int?? = nil,
        sellPrice: Int?? = nil,
        sellQuantity: Int?? = nil,
        sellValue: Int?? = nil,
        tradingsymbol: String?? = nil,
        unrealised: Int?? = nil,
        value: Int?? = nil
    ) -> Day {
        return Day(
            averagePrice: averagePrice ?? self.averagePrice,
            buyM2M: buyM2M ?? self.buyM2M,
            buyPrice: buyPrice ?? self.buyPrice,
            buyQuantity: buyQuantity ?? self.buyQuantity,
            buyValue: buyValue ?? self.buyValue,
            closePrice: closePrice ?? self.closePrice,
            dayBuyPrice: dayBuyPrice ?? self.dayBuyPrice,
            dayBuyQuantity: dayBuyQuantity ?? self.dayBuyQuantity,
            dayBuyValue: dayBuyValue ?? self.dayBuyValue,
            daySellPrice: daySellPrice ?? self.daySellPrice,
            daySellQuantity: daySellQuantity ?? self.daySellQuantity,
            daySellValue: daySellValue ?? self.daySellValue,
            exchange: exchange ?? self.exchange,
            instrumentToken: instrumentToken ?? self.instrumentToken,
            lastPrice: lastPrice ?? self.lastPrice,
            m2M: m2M ?? self.m2M,
            multiplier: multiplier ?? self.multiplier,
            overnightQuantity: overnightQuantity ?? self.overnightQuantity,
            pnl: pnl ?? self.pnl,
            product: product ?? self.product,
            quantity: quantity ?? self.quantity,
            realised: realised ?? self.realised,
            sellM2M: sellM2M ?? self.sellM2M,
            sellPrice: sellPrice ?? self.sellPrice,
            sellQuantity: sellQuantity ?? self.sellQuantity,
            sellValue: sellValue ?? self.sellValue,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            unrealised: unrealised ?? self.unrealised,
            value: value ?? self.value
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

    func positionsTask(with url: URL, completionHandler: @escaping (Positions?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responsePositions(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Positions>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
