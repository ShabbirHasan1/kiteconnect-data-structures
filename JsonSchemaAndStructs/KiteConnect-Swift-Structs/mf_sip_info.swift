// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mFSIPInfo = try MFSIPInfo(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.mFSIPInfoTask(with: url) { mFSIPInfo, response, error in
//     if let mFSIPInfo = mFSIPInfo {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMFSIPInfo { response in
//     if let mFSIPInfo = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - MFSIPInfo
struct MFSIPInfo: Codable {
    let data: DataClass?
    let status: String?
}

// MARK: MFSIPInfo convenience initializers and mutators

extension MFSIPInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MFSIPInfo.self, from: data)
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
    ) -> MFSIPInfo {
        return MFSIPInfo(
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
    let completedInstalments: Int?
    let created: Date?
    let dividendType, frequency, fund, fundSource: String?
    let instalmentAmount, instalmentDay, instalments: Int?
    let lastInstalment: Date?
    let nextInstalment: String?
    let pendingInstalments: Int?
    let sipID: String?
    let sipRegNum: JSONNull?
    let sipType, status: String?
    let stepUp: StepUp?
    let tag, tradingsymbol, transactionType: String?
    let triggerPrice: Int?

    enum CodingKeys: String, CodingKey {
        case completedInstalments = "completed_instalments"
        case created
        case dividendType = "dividend_type"
        case frequency, fund
        case fundSource = "fund_source"
        case instalmentAmount = "instalment_amount"
        case instalmentDay = "instalment_day"
        case instalments
        case lastInstalment = "last_instalment"
        case nextInstalment = "next_instalment"
        case pendingInstalments = "pending_instalments"
        case sipID = "sip_id"
        case sipRegNum = "sip_reg_num"
        case sipType = "sip_type"
        case status
        case stepUp = "step_up"
        case tag, tradingsymbol
        case transactionType = "transaction_type"
        case triggerPrice = "trigger_price"
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
        completedInstalments: Int?? = nil,
        created: Date?? = nil,
        dividendType: String?? = nil,
        frequency: String?? = nil,
        fund: String?? = nil,
        fundSource: String?? = nil,
        instalmentAmount: Int?? = nil,
        instalmentDay: Int?? = nil,
        instalments: Int?? = nil,
        lastInstalment: Date?? = nil,
        nextInstalment: String?? = nil,
        pendingInstalments: Int?? = nil,
        sipID: String?? = nil,
        sipRegNum: JSONNull?? = nil,
        sipType: String?? = nil,
        status: String?? = nil,
        stepUp: StepUp?? = nil,
        tag: String?? = nil,
        tradingsymbol: String?? = nil,
        transactionType: String?? = nil,
        triggerPrice: Int?? = nil
    ) -> DataClass {
        return DataClass(
            completedInstalments: completedInstalments ?? self.completedInstalments,
            created: created ?? self.created,
            dividendType: dividendType ?? self.dividendType,
            frequency: frequency ?? self.frequency,
            fund: fund ?? self.fund,
            fundSource: fundSource ?? self.fundSource,
            instalmentAmount: instalmentAmount ?? self.instalmentAmount,
            instalmentDay: instalmentDay ?? self.instalmentDay,
            instalments: instalments ?? self.instalments,
            lastInstalment: lastInstalment ?? self.lastInstalment,
            nextInstalment: nextInstalment ?? self.nextInstalment,
            pendingInstalments: pendingInstalments ?? self.pendingInstalments,
            sipID: sipID ?? self.sipID,
            sipRegNum: sipRegNum ?? self.sipRegNum,
            sipType: sipType ?? self.sipType,
            status: status ?? self.status,
            stepUp: stepUp ?? self.stepUp,
            tag: tag ?? self.tag,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol,
            transactionType: transactionType ?? self.transactionType,
            triggerPrice: triggerPrice ?? self.triggerPrice
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
//   let task = URLSession.shared.stepUpTask(with: url) { stepUp, response, error in
//     if let stepUp = stepUp {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseStepUp { response in
//     if let stepUp = response.result.value {
//       ...
//     }
//   }

// MARK: - StepUp
struct StepUp: Codable {
    let the1502: Int?

    enum CodingKeys: String, CodingKey {
        case the1502 = "15-02"
    }
}

// MARK: StepUp convenience initializers and mutators

extension StepUp {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(StepUp.self, from: data)
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
        the1502: Int?? = nil
    ) -> StepUp {
        return StepUp(
            the1502: the1502 ?? self.the1502
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

    func mFSIPInfoTask(with url: URL, completionHandler: @escaping (MFSIPInfo?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseMFSIPInfo(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<MFSIPInfo>) -> Void) -> Self {
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
