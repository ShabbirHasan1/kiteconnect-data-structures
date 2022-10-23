// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let holdings = try Holdings(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.holdingsTask(with: url) { holdings, response, error in
//     if let holdings = holdings {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseHoldings { response in
//     if let holdings = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Holdings
struct Holdings: Codable {
    let data: [Datum]?
    let status: String?
}

// MARK: Holdings convenience initializers and mutators

extension Holdings {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Holdings.self, from: data)
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
    ) -> Holdings {
        return Holdings(
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
    let authorisedDate: Date?
    let authorisedQuantity: Int?
    let averagePrice, closePrice: Double?
    let collateralQuantity: Int?
    let collateralType: String?
    let dayChange, dayChangePercentage: Double?
    let discrepancy: Bool?
    let exchange: String?
    let instrumentToken: Int?
    let isin: String?
    let lastPrice: Double?
    let openingQuantity: Int?
    let pnl: Double?
    let price: Int?
    let product: String?
    let quantity, realisedQuantity, t1Quantity: Int?
    let tradingsymbol: String?
    let usedQuantity: Int?

    enum CodingKeys: String, CodingKey {
        case authorisedDate = "authorised_date"
        case authorisedQuantity = "authorised_quantity"
        case averagePrice = "average_price"
        case closePrice = "close_price"
        case collateralQuantity = "collateral_quantity"
        case collateralType = "collateral_type"
        case dayChange = "day_change"
        case dayChangePercentage = "day_change_percentage"
        case discrepancy, exchange
        case instrumentToken = "instrument_token"
        case isin
        case lastPrice = "last_price"
        case openingQuantity = "opening_quantity"
        case pnl, price, product, quantity
        case realisedQuantity = "realised_quantity"
        case t1Quantity = "t1_quantity"
        case tradingsymbol
        case usedQuantity = "used_quantity"
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
        authorisedDate: Date?? = nil,
        authorisedQuantity: Int?? = nil,
        averagePrice: Double?? = nil,
        closePrice: Double?? = nil,
        collateralQuantity: Int?? = nil,
        collateralType: String?? = nil,
        dayChange: Double?? = nil,
        dayChangePercentage: Double?? = nil,
        discrepancy: Bool?? = nil,
        exchange: String?? = nil,
        instrumentToken: Int?? = nil,
        isin: String?? = nil,
        lastPrice: Double?? = nil,
        openingQuantity: Int?? = nil,
        pnl: Double?? = nil,
        price: Int?? = nil,
        product: String?? = nil,
        quantity: Int?? = nil,
        realisedQuantity: Int?? = nil,
        t1Quantity: Int?? = nil,
        tradingsymbol: String?? = nil,
        usedQuantity: Int?? = nil
    ) -> Datum {
        return Datum(
            authorisedDate: authorisedDate ?? self.authorisedDate,
            authorisedQuantity: authorisedQuantity ?? self.authorisedQuantity,
            averagePrice: averagePrice ?? self.averagePrice,
            closePrice: closePrice ?? self.closePrice,
            collateralQuantity: collateralQuantity ?? self.collateralQuantity,
            collateralType: collateralType ?? self.collateralType,
            dayChange: dayChange ?? self.dayChange,
            dayChangePercentage: dayChangePercentage ?? self.dayChangePercentage,
            discrepancy: discrepancy ?? self.discrepancy,
            exchange: exchange ?? self.exchange,
            instrumentToken: instrumentToken ?? self.instrumentToken,
            isin: isin ?? self.isin,
            lastPrice: lastPrice ?? self.lastPrice,
            openingQuantity: openingQuantity ?? self.openingQuantity,
            pnl: pnl ?? self.pnl,
            price: price ?? self.price,
            product: product ?? self.product,
            quantity: quantity ?? self.quantity,
            realisedQuantity: realisedQuantity ?? self.realisedQuantity,
            t1Quantity: t1Quantity ?? self.t1Quantity,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            usedQuantity: usedQuantity ?? self.usedQuantity
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

    func holdingsTask(with url: URL, completionHandler: @escaping (Holdings?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseHoldings(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Holdings>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
