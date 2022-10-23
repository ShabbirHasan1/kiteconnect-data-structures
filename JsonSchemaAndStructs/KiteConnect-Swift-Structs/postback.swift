// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postback = try Postback(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.postbackTask(with: url) { postback, response, error in
//     if let postback = postback {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePostback { response in
//     if let postback = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Postback
struct Postback: Codable {
    let appID, averagePrice, cancelledQuantity: Int?
    let checksum: String?
    let disclosedQuantity: Int?
    let exchange, exchangeOrderID: String?
    let exchangeTimestamp, exchangeUpdateTimestamp: Date?
    let filledQuantity: Int?
    let guid: String?
    let instrumentToken, marketProtection: Int?
    let meta: Meta?
    let orderID: String?
    let orderTimestamp: Date?
    let orderType: String?
    let parentOrderID: JSONNull?
    let pendingQuantity: Int?
    let placedBy: String?
    let price: Int?
    let product: String?
    let quantity: Int?
    let status: String?
    let statusMessage, statusMessageRaw, tag: JSONNull?
    let tradingsymbol, transactionType: String?
    let triggerPrice, unfilledQuantity: Int?
    let userID, validity, variety: String?

    enum CodingKeys: String, CodingKey {
        case appID = "app_id"
        case averagePrice = "average_price"
        case cancelledQuantity = "cancelled_quantity"
        case checksum
        case disclosedQuantity = "disclosed_quantity"
        case exchange
        case exchangeOrderID = "exchange_order_id"
        case exchangeTimestamp = "exchange_timestamp"
        case exchangeUpdateTimestamp = "exchange_update_timestamp"
        case filledQuantity = "filled_quantity"
        case guid
        case instrumentToken = "instrument_token"
        case marketProtection = "market_protection"
        case meta
        case orderID = "order_id"
        case orderTimestamp = "order_timestamp"
        case orderType = "order_type"
        case parentOrderID = "parent_order_id"
        case pendingQuantity = "pending_quantity"
        case placedBy = "placed_by"
        case price, product, quantity, status
        case statusMessage = "status_message"
        case statusMessageRaw = "status_message_raw"
        case tag, tradingsymbol
        case transactionType = "transaction_type"
        case triggerPrice = "trigger_price"
        case unfilledQuantity = "unfilled_quantity"
        case userID = "user_id"
        case validity, variety
    }
}

// MARK: Postback convenience initializers and mutators

extension Postback {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Postback.self, from: data)
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
        appID: Int?? = nil,
        averagePrice: Int?? = nil,
        cancelledQuantity: Int?? = nil,
        checksum: String?? = nil,
        disclosedQuantity: Int?? = nil,
        exchange: String?? = nil,
        exchangeOrderID: String?? = nil,
        exchangeTimestamp: Date?? = nil,
        exchangeUpdateTimestamp: Date?? = nil,
        filledQuantity: Int?? = nil,
        guid: String?? = nil,
        instrumentToken: Int?? = nil,
        marketProtection: Int?? = nil,
        meta: Meta?? = nil,
        orderID: String?? = nil,
        orderTimestamp: Date?? = nil,
        orderType: String?? = nil,
        parentOrderID: JSONNull?? = nil,
        pendingQuantity: Int?? = nil,
        placedBy: String?? = nil,
        price: Int?? = nil,
        product: String?? = nil,
        quantity: Int?? = nil,
        status: String?? = nil,
        statusMessage: JSONNull?? = nil,
        statusMessageRaw: JSONNull?? = nil,
        tag: JSONNull?? = nil,
        tradingsymbol: String?? = nil,
        transactionType: String?? = nil,
        triggerPrice: Int?? = nil,
        unfilledQuantity: Int?? = nil,
        userID: String?? = nil,
        validity: String?? = nil,
        variety: String?? = nil
    ) -> Postback {
        return Postback(
            appID: appID ?? self.appID,
            averagePrice: averagePrice ?? self.averagePrice,
            cancelledQuantity: cancelledQuantity ?? self.cancelledQuantity,
            checksum: checksum ?? self.checksum,
            disclosedQuantity: disclosedQuantity ?? self.disclosedQuantity,
            exchange: exchange ?? self.exchange,
            exchangeOrderID: exchangeOrderID ?? self.exchangeOrderID,
            exchangeTimestamp: exchangeTimestamp ?? self.exchangeTimestamp,
            exchangeUpdateTimestamp: exchangeUpdateTimestamp ?? self.exchangeUpdateTimestamp,
            filledQuantity: filledQuantity ?? self.filledQuantity,
            guid: guid ?? self.guid,
            instrumentToken: instrumentToken ?? self.instrumentToken,
            marketProtection: marketProtection ?? self.marketProtection,
            meta: meta ?? self.meta,
            orderID: orderID ?? self.orderID,
            orderTimestamp: orderTimestamp ?? self.orderTimestamp,
            orderType: orderType ?? self.orderType,
            parentOrderID: parentOrderID ?? self.parentOrderID,
            pendingQuantity: pendingQuantity ?? self.pendingQuantity,
            placedBy: placedBy ?? self.placedBy,
            price: price ?? self.price,
            product: product ?? self.product,
            quantity: quantity ?? self.quantity,
            status: status ?? self.status,
            statusMessage: statusMessage ?? self.statusMessage,
            statusMessageRaw: statusMessageRaw ?? self.statusMessageRaw,
            tag: tag ?? self.tag,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            transactionType: transactionType ?? self.transactionType,
            triggerPrice: triggerPrice ?? self.triggerPrice,
            unfilledQuantity: unfilledQuantity ?? self.unfilledQuantity,
            userID: userID ?? self.userID,
            validity: validity ?? self.validity,
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

//
// To read values from URLs:
//
//   let task = URLSession.shared.metaTask(with: url) { meta, response, error in
//     if let meta = meta {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMeta { response in
//     if let meta = response.result.value {
//       ...
//     }
//   }

// MARK: - Meta
struct Meta: Codable {
}

// MARK: Meta convenience initializers and mutators

extension Meta {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Meta.self, from: data)
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
    ) -> Meta {
        return Meta(
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

    func postbackTask(with url: URL, completionHandler: @escaping (Postback?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responsePostback(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Postback>) -> Void) -> Self {
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
