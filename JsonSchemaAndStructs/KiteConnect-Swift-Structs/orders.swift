// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let orders = try Orders(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.ordersTask(with: url) { orders, response, error in
//     if let orders = orders {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseOrders { response in
//     if let orders = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Orders
struct Orders: Codable {
    let data: [Datum]?
    let status: String?
}

// MARK: Orders convenience initializers and mutators

extension Orders {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Orders.self, from: data)
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
    ) -> Orders {
        return Orders(
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
    let averagePrice, cancelledQuantity, disclosedQuantity: Int?
    let exchange: String?
    let exchangeOrderID: String?
    let exchangeTimestamp, exchangeUpdateTimestamp: Date?
    let filledQuantity: Int?
    let guid: String?
    let instrumentToken, marketProtection: Int?
    let meta: Meta?
    let modified: Bool?
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
    let statusMessage, statusMessageRaw, tag: String?
    let tags: [String]?
    let tradingsymbol, transactionType: String?
    let triggerPrice: Int?
    let validity: String?
    let validityTTL: Int?
    let variety: String?

    enum CodingKeys: String, CodingKey {
        case averagePrice = "average_price"
        case cancelledQuantity = "cancelled_quantity"
        case disclosedQuantity = "disclosed_quantity"
        case exchange
        case exchangeOrderID = "exchange_order_id"
        case exchangeTimestamp = "exchange_timestamp"
        case exchangeUpdateTimestamp = "exchange_update_timestamp"
        case filledQuantity = "filled_quantity"
        case guid
        case instrumentToken = "instrument_token"
        case marketProtection = "market_protection"
        case meta, modified
        case orderID = "order_id"
        case orderTimestamp = "order_timestamp"
        case orderType = "order_type"
        case parentOrderID = "parent_order_id"
        case pendingQuantity = "pending_quantity"
        case placedBy = "placed_by"
        case price, product, quantity, status
        case statusMessage = "status_message"
        case statusMessageRaw = "status_message_raw"
        case tag, tags, tradingsymbol
        case transactionType = "transaction_type"
        case triggerPrice = "trigger_price"
        case validity
        case validityTTL = "validity_ttl"
        case variety
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
        averagePrice: Int?? = nil,
        cancelledQuantity: Int?? = nil,
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
        modified: Bool?? = nil,
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
        statusMessage: String?? = nil,
        statusMessageRaw: String?? = nil,
        tag: String?? = nil,
        tags: [String]?? = nil,
        tradingsymbol: String?? = nil,
        transactionType: String?? = nil,
        triggerPrice: Int?? = nil,
        validity: String?? = nil,
        validityTTL: Int?? = nil,
        variety: String?? = nil
    ) -> Datum {
        return Datum(
            averagePrice: averagePrice ?? self.averagePrice,
            cancelledQuantity: cancelledQuantity ?? self.cancelledQuantity,
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
            modified: modified ?? self.modified,
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
            tags: tags ?? self.tags,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            transactionType: transactionType ?? self.transactionType,
            triggerPrice: triggerPrice ?? self.triggerPrice,
            validity: validity ?? self.validity,
            validityTTL: validityTTL ?? self.validityTTL,
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
    let iceberg: Iceberg?
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
        iceberg: Iceberg?? = nil
    ) -> Meta {
        return Meta(
            iceberg: iceberg ?? self.iceberg
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
//   let task = URLSession.shared.icebergTask(with: url) { iceberg, response, error in
//     if let iceberg = iceberg {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseIceberg { response in
//     if let iceberg = response.result.value {
//       ...
//     }
//   }

// MARK: - Iceberg
struct Iceberg: Codable {
    let leg, legQuantity, legs, remainingQuantity: Int?
    let totalQuantity: Int?

    enum CodingKeys: String, CodingKey {
        case leg
        case legQuantity = "leg_quantity"
        case legs
        case remainingQuantity = "remaining_quantity"
        case totalQuantity = "total_quantity"
    }
}

// MARK: Iceberg convenience initializers and mutators

extension Iceberg {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Iceberg.self, from: data)
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
        leg: Int?? = nil,
        legQuantity: Int?? = nil,
        legs: Int?? = nil,
        remainingQuantity: Int?? = nil,
        totalQuantity: Int?? = nil
    ) -> Iceberg {
        return Iceberg(
            leg: leg ?? self.leg,
            legQuantity: legQuantity ?? self.legQuantity,
            legs: legs ?? self.legs,
            remainingQuantity: remainingQuantity ?? self.remainingQuantity,
            totalQuantity: totalQuantity ?? self.totalQuantity
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

    func ordersTask(with url: URL, completionHandler: @escaping (Orders?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseOrders(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Orders>) -> Void) -> Self {
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
