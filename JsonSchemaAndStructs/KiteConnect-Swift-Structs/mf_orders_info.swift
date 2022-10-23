// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mFOrdersInfo = try MFOrdersInfo(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.mFOrdersInfoTask(with: url) { mFOrdersInfo, response, error in
//     if let mFOrdersInfo = mFOrdersInfo {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMFOrdersInfo { response in
//     if let mFOrdersInfo = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - MFOrdersInfo
struct MFOrdersInfo: Codable {
    let data: DataClass?
    let status: String?
}

// MARK: MFOrdersInfo convenience initializers and mutators

extension MFOrdersInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MFOrdersInfo.self, from: data)
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
    ) -> MFOrdersInfo {
        return MFOrdersInfo(
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
    let amount, averagePrice: Int?
    let exchangeOrderID, exchangeTimestamp, folio: JSONNull?
    let fund: String?
    let lastPrice: Double?
    let lastPriceDate, orderID: String?
    let orderTimestamp: Date?
    let placedBy, purchaseType: String?
    let quantity: Int?
    let settlementID: JSONNull?
    let status, statusMessage: String?
    let tag: JSONNull?
    let tradingsymbol, transactionType, variety: String?

    enum CodingKeys: String, CodingKey {
        case amount
        case averagePrice = "average_price"
        case exchangeOrderID = "exchange_order_id"
        case exchangeTimestamp = "exchange_timestamp"
        case folio, fund
        case lastPrice = "last_price"
        case lastPriceDate = "last_price_date"
        case orderID = "order_id"
        case orderTimestamp = "order_timestamp"
        case placedBy = "placed_by"
        case purchaseType = "purchase_type"
        case quantity
        case settlementID = "settlement_id"
        case status
        case statusMessage = "status_message"
        case tag, tradingsymbol
        case transactionType = "transaction_type"
        case variety
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
        amount: Int?? = nil,
        averagePrice: Int?? = nil,
        exchangeOrderID: JSONNull?? = nil,
        exchangeTimestamp: JSONNull?? = nil,
        folio: JSONNull?? = nil,
        fund: String?? = nil,
        lastPrice: Double?? = nil,
        lastPriceDate: String?? = nil,
        orderID: String?? = nil,
        orderTimestamp: Date?? = nil,
        placedBy: String?? = nil,
        purchaseType: String?? = nil,
        quantity: Int?? = nil,
        settlementID: JSONNull?? = nil,
        status: String?? = nil,
        statusMessage: String?? = nil,
        tag: JSONNull?? = nil,
        tradingsymbol: String?? = nil,
        transactionType: String?? = nil,
        variety: String?? = nil
    ) -> DataClass {
        return DataClass(
            amount: amount ?? self.amount,
            averagePrice: averagePrice ?? self.averagePrice,
            exchangeOrderID: exchangeOrderID ?? self.exchangeOrderID,
            exchangeTimestamp: exchangeTimestamp ?? self.exchangeTimestamp,
            folio: folio ?? self.folio,
            fund: fund ?? self.fund,
            lastPrice: lastPrice ?? self.lastPrice,
            lastPriceDate: lastPriceDate ?? self.lastPriceDate,
            orderID: orderID ?? self.orderID,
            orderTimestamp: orderTimestamp ?? self.orderTimestamp,
            placedBy: placedBy ?? self.placedBy,
            purchaseType: purchaseType ?? self.purchaseType,
            quantity: quantity ?? self.quantity,
            settlementID: settlementID ?? self.settlementID,
            status: status ?? self.status,
            statusMessage: statusMessage ?? self.statusMessage,
            tag: tag ?? self.tag,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            transactionType: transactionType ?? self.transactionType,
            variety: variety ?? self.variety
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

    func mFOrdersInfoTask(with url: URL, completionHandler: @escaping (MFOrdersInfo?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseMFOrdersInfo(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<MFOrdersInfo>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

// MARK: - Encode/decode helpers

@objcMembers class JSONNull: NSObject, Codable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    override public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
