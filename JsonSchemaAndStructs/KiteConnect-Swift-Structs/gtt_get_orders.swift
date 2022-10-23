// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gttGetOrders = try GttGetOrders(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.gttGetOrdersTask(with: url) { gttGetOrders, response, error in
//     if let gttGetOrders = gttGetOrders {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseGttGetOrders { response in
//     if let gttGetOrders = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - GttGetOrders
struct GttGetOrders: Codable {
    let data: [Datum]?
    let status: String?
}

// MARK: GttGetOrders convenience initializers and mutators

extension GttGetOrders {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GttGetOrders.self, from: data)
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
    ) -> GttGetOrders {
        return GttGetOrders(
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
    let condition: Condition?
    let createdAt, expiresAt: Date?
    let id: Int?
    let meta: Meta?
    let orders: [Order]?
    let parentTrigger: JSONNull?
    let status, type: String?
    let updatedAt: Date?
    let userID: String?

    enum CodingKeys: String, CodingKey {
        case condition
        case createdAt = "created_at"
        case expiresAt = "expires_at"
        case id, meta, orders
        case parentTrigger = "parent_trigger"
        case status, type
        case updatedAt = "updated_at"
        case userID = "user_id"
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
        condition: Condition?? = nil,
        createdAt: Date?? = nil,
        expiresAt: Date?? = nil,
        id: Int?? = nil,
        meta: Meta?? = nil,
        orders: [Order]?? = nil,
        parentTrigger: JSONNull?? = nil,
        status: String?? = nil,
        type: String?? = nil,
        updatedAt: Date?? = nil,
        userID: String?? = nil
    ) -> Datum {
        return Datum(
            condition: condition ?? self.condition,
            createdAt: createdAt ?? self.createdAt,
            expiresAt: expiresAt ?? self.expiresAt,
            id: id ?? self.id,
            meta: meta ?? self.meta,
            orders: orders ?? self.orders,
            parentTrigger: parentTrigger ?? self.parentTrigger,
            status: status ?? self.status,
            type: type ?? self.type,
            updatedAt: updatedAt ?? self.updatedAt,
            userID: userID ?? self.userID
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
//   let task = URLSession.shared.conditionTask(with: url) { condition, response, error in
//     if let condition = condition {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCondition { response in
//     if let condition = response.result.value {
//       ...
//     }
//   }

// MARK: - Condition
struct Condition: Codable {
    let exchange: String?
    let instrumentToken: Int?
    let lastPrice: Double?
    let tradingsymbol: String?
    let triggerValues: [Double]?

    enum CodingKeys: String, CodingKey {
        case exchange
        case instrumentToken = "instrument_token"
        case lastPrice = "last_price"
        case tradingsymbol
        case triggerValues = "trigger_values"
    }
}

// MARK: Condition convenience initializers and mutators

extension Condition {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Condition.self, from: data)
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
        exchange: String?? = nil,
        instrumentToken: Int?? = nil,
        lastPrice: Double?? = nil,
        tradingsymbol: String?? = nil,
        triggerValues: [Double]?? = nil
    ) -> Condition {
        return Condition(
            exchange: exchange ?? self.exchange,
            instrumentToken: instrumentToken ?? self.instrumentToken,
            lastPrice: lastPrice ?? self.lastPrice,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            triggerValues: triggerValues ?? self.triggerValues
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

//
// To read values from URLs:
//
//   let task = URLSession.shared.orderTask(with: url) { order, response, error in
//     if let order = order {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseOrder { response in
//     if let order = response.result.value {
//       ...
//     }
//   }

// MARK: - Order
struct Order: Codable {
    let exchange, orderType: String?
    let price: Double?
    let product: String?
    let quantity: Int?
    let result: Result?
    let tradingsymbol, transactionType: String?

    enum CodingKeys: String, CodingKey {
        case exchange
        case orderType = "order_type"
        case price, product, quantity, result, tradingsymbol
        case transactionType = "transaction_type"
    }
}

// MARK: Order convenience initializers and mutators

extension Order {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Order.self, from: data)
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
        exchange: String?? = nil,
        orderType: String?? = nil,
        price: Double?? = nil,
        product: String?? = nil,
        quantity: Int?? = nil,
        result: Result?? = nil,
        tradingsymbol: String?? = nil,
        transactionType: String?? = nil
    ) -> Order {
        return Order(
            exchange: exchange ?? self.exchange,
            orderType: orderType ?? self.orderType,
            price: price ?? self.price,
            product: product ?? self.product,
            quantity: quantity ?? self.quantity,
            result: result ?? self.result,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            transactionType: transactionType ?? self.transactionType
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
//   let task = URLSession.shared.resultTask(with: url) { result, response, error in
//     if let result = result {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseResult { response in
//     if let result = response.result.value {
//       ...
//     }
//   }

// MARK: - Result
struct Result: Codable {
    let accountID, exchange, meta: String?
    let orderResult: OrderResult?
    let orderType: String?
    let price: Int?
    let product: String?
    let quantity: Int?
    let timestamp: Date?
    let tradingsymbol, transactionType: String?
    let triggeredAt: Double?
    let validity: String?

    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case exchange, meta
        case orderResult = "order_result"
        case orderType = "order_type"
        case price, product, quantity, timestamp, tradingsymbol
        case transactionType = "transaction_type"
        case triggeredAt = "triggered_at"
        case validity
    }
}

// MARK: Result convenience initializers and mutators

extension Result {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Result.self, from: data)
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
        accountID: String?? = nil,
        exchange: String?? = nil,
        meta: String?? = nil,
        orderResult: OrderResult?? = nil,
        orderType: String?? = nil,
        price: Int?? = nil,
        product: String?? = nil,
        quantity: Int?? = nil,
        timestamp: Date?? = nil,
        tradingsymbol: String?? = nil,
        transactionType: String?? = nil,
        triggeredAt: Double?? = nil,
        validity: String?? = nil
    ) -> Result {
        return Result(
            accountID: accountID ?? self.accountID,
            exchange: exchange ?? self.exchange,
            meta: meta ?? self.meta,
            orderResult: orderResult ?? self.orderResult,
            orderType: orderType ?? self.orderType,
            price: price ?? self.price,
            product: product ?? self.product,
            quantity: quantity ?? self.quantity,
            timestamp: timestamp ?? self.timestamp,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            transactionType: transactionType ?? self.transactionType,
            triggeredAt: triggeredAt ?? self.triggeredAt,
            validity: validity ?? self.validity
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
//   let task = URLSession.shared.orderResultTask(with: url) { orderResult, response, error in
//     if let orderResult = orderResult {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseOrderResult { response in
//     if let orderResult = response.result.value {
//       ...
//     }
//   }

// MARK: - OrderResult
struct OrderResult: Codable {
    let orderID, rejectionReason, status: String?

    enum CodingKeys: String, CodingKey {
        case orderID = "order_id"
        case rejectionReason = "rejection_reason"
        case status
    }
}

// MARK: OrderResult convenience initializers and mutators

extension OrderResult {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(OrderResult.self, from: data)
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
        orderID: String?? = nil,
        rejectionReason: String?? = nil,
        status: String?? = nil
    ) -> OrderResult {
        return OrderResult(
            orderID: orderID ?? self.orderID,
            rejectionReason: rejectionReason ?? self.rejectionReason,
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

    func gttGetOrdersTask(with url: URL, completionHandler: @escaping (GttGetOrders?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseGttGetOrders(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<GttGetOrders>) -> Void) -> Self {
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
