// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let generateSession = try GenerateSession(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.generateSessionTask(with: url) { generateSession, response, error in
//     if let generateSession = generateSession {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseGenerateSession { response in
//     if let generateSession = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - GenerateSession
struct GenerateSession: Codable {
    let data: DataClass?
    let status: String?
}

// MARK: GenerateSession convenience initializers and mutators

extension GenerateSession {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GenerateSession.self, from: data)
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
    ) -> GenerateSession {
        return GenerateSession(
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
    let accessToken, apiKey, avatarURL, broker: String?
    let email, enctoken: String?
    let exchanges: [String]?
    let loginTime: Date?
    let meta: Meta?
    let orderTypes, products: [String]?
    let publicToken, refreshToken, silo, userID: String?
    let userName, userShortname, userType: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case apiKey = "api_key"
        case avatarURL = "avatar_url"
        case broker, email, enctoken, exchanges
        case loginTime = "login_time"
        case meta
        case orderTypes = "order_types"
        case products
        case publicToken = "public_token"
        case refreshToken = "refresh_token"
        case silo
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
        accessToken: String?? = nil,
        apiKey: String?? = nil,
        avatarURL: String?? = nil,
        broker: String?? = nil,
        email: String?? = nil,
        enctoken: String?? = nil,
        exchanges: [String]?? = nil,
        loginTime: Date?? = nil,
        meta: Meta?? = nil,
        orderTypes: [String]?? = nil,
        products: [String]?? = nil,
        publicToken: String?? = nil,
        refreshToken: String?? = nil,
        silo: String?? = nil,
        userID: String?? = nil,
        userName: String?? = nil,
        userShortname: String?? = nil,
        userType: String?? = nil
    ) -> DataClass {
        return DataClass(
            accessToken: accessToken ?? self.accessToken,
            apiKey: apiKey ?? self.apiKey,
            avatarURL: avatarURL ?? self.avatarURL,
            broker: broker ?? self.broker,
            email: email ?? self.email,
            enctoken: enctoken ?? self.enctoken,
            exchanges: exchanges ?? self.exchanges,
            loginTime: loginTime ?? self.loginTime,
            meta: meta ?? self.meta,
            orderTypes: orderTypes ?? self.orderTypes,
            products: products ?? self.products,
            publicToken: publicToken ?? self.publicToken,
            refreshToken: refreshToken ?? self.refreshToken,
            silo: silo ?? self.silo,
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

    func generateSessionTask(with url: URL, completionHandler: @escaping (GenerateSession?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseGenerateSession(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<GenerateSession>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
