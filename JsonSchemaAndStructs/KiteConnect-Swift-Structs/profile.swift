// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let profile = try Profile(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.profileTask(with: url) { profile, response, error in
//     if let profile = profile {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseProfile { response in
//     if let profile = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Profile
struct Profile: Codable {
    let data: DataClass?
    let status: String?
}

// MARK: Profile convenience initializers and mutators

extension Profile {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Profile.self, from: data)
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
    ) -> Profile {
        return Profile(
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
    let avatarURL: JSONNull?
    let broker, email: String?
    let exchanges: [String]?
    let meta: Meta?
    let orderTypes, products: [String]?
    let userID, userName, userShortname, userType: String?

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case broker, email, exchanges, meta
        case orderTypes = "order_types"
        case products
        case userID = "user_id"
        case userName = "user_name"
        case userShortname = "user_shortname"
        case userType = "user_type"
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
        avatarURL: JSONNull?? = nil,
        broker: String?? = nil,
        email: String?? = nil,
        exchanges: [String]?? = nil,
        meta: Meta?? = nil,
        orderTypes: [String]?? = nil,
        products: [String]?? = nil,
        userID: String?? = nil,
        userName: String?? = nil,
        userShortname: String?? = nil,
        userType: String?? = nil
    ) -> DataClass {
        return DataClass(
            avatarURL: avatarURL ?? self.avatarURL,
            broker: broker ?? self.broker,
            email: email ?? self.email,
            exchanges: exchanges ?? self.exchanges,
            meta: meta ?? self.meta,
            orderTypes: orderTypes ?? self.orderTypes,
            products: products ?? self.products,
            userID: userID ?? self.userID,
            userName: userName ?? self.userName,
            userShortname: userShortname ?? self.userShortname,
            userType: userType ?? self.userType
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
    let dematConsent: String?

    enum CodingKeys: String, CodingKey {
        case dematConsent = "demat_consent"
    }
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
        dematConsent: String?? = nil
    ) -> Meta {
        return Meta(
            dematConsent: dematConsent ?? self.dematConsent
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

    func profileTask(with url: URL, completionHandler: @escaping (Profile?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseProfile(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Profile>) -> Void) -> Self {
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
