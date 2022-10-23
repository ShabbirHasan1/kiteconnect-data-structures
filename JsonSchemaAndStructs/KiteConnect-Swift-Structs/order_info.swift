// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let orderInfo = try OrderInfo(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.orderInfoTask(with: url) { orderInfo, response, error in
//     if let orderInfo = orderInfo {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseOrderInfo { response in
//     if let orderInfo = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - OrderInfo
struct OrderInfo: Codable {
    let data: [Datum]?
    let status: String?
}

// MARK: OrderInfo convenience initializers and mutators

extension OrderInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(OrderInfo.self, from: data)
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
    ) -> OrderInfo {
        return OrderInfo(
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
    let exchangeTimestamp: Date?
    let filledQuantity, instrumentToken: Int?
    let orderID: String?
    let orderTimestamp: Date?
    let orderType: String?
    let parentOrderID: JSONNull?
    let pendingQuantity: Int?
    let placedBy: String?
    let price: Double?
    let product: String?
    let quantity: Int?
    let status: String?
    let statusMessage, tag: JSONNull?
    let tradingsymbol, transactionType: String?
    let triggerPrice: Int?
    let validity, variety: String?

    enum CodingKeys: String, CodingKey {
        case averagePrice = "average_price"
        case cancelledQuantity = "cancelled_quantity"
        case disclosedQuantity = "disclosed_quantity"
        case exchange
        case exchangeOrderID = "exchange_order_id"
        case exchangeTimestamp = "exchange_timestamp"
        case filledQuantity = "filled_quantity"
        case instrumentToken = "instrument_token"
        case orderID = "order_id"
        case orderTimestamp = "order_timestamp"
        case orderType = "order_type"
        case parentOrderID = "parent_order_id"
        case pendingQuantity = "pending_quantity"
        case placedBy = "placed_by"
        case price, product, quantity, status
        case statusMessage = "status_message"
        case tag, tradingsymbol
        case transactionType = "transaction_type"
        case triggerPrice = "trigger_price"
        case validity, variety
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
        filledQuantity: Int?? = nil,
        instrumentToken: Int?? = nil,
        orderID: String?? = nil,
        orderTimestamp: Date?? = nil,
        orderType: String?? = nil,
        parentOrderID: JSONNull?? = nil,
        pendingQuantity: Int?? = nil,
        placedBy: String?? = nil,
        price: Double?? = nil,
        product: String?? = nil,
        quantity: Int?? = nil,
        status: String?? = nil,
        statusMessage: JSONNull?? = nil,
        tag: JSONNull?? = nil,
        tradingsymbol: String?? = nil,
        transactionType: String?? = nil,
        triggerPrice: Int?? = nil,
        validity: String?? = nil,
        variety: String?? = nil
    ) -> Datum {
        return Datum(
            averagePrice: averagePrice ?? self.averagePrice,
            cancelledQuantity: cancelledQuantity ?? self.cancelledQuantity,
            disclosedQuantity: disclosedQuantity ?? self.disclosedQuantity,
            exchange: exchange ?? self.exchange,
            exchangeOrderID: exchangeOrderID ?? self.exchangeOrderID,
            exchangeTimestamp: exchangeTimestamp ?? self.exchangeTimestamp,
            filledQuantity: filledQuantity ?? self.filledQuantity,
            instrumentToken: instrumentToken ?? self.instrumentToken,
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
            tag: tag ?? self.tag,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            transactionType: transactionType ?? self.transactionType,
            triggerPrice: triggerPrice ?? self.triggerPrice,
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

    func orderInfoTask(with url: URL, completionHandler: @escaping (OrderInfo?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseOrderInfo(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<OrderInfo>) -> Void) -> Self {
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
