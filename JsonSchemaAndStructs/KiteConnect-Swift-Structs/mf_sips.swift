// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mFSips = try MFSips(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.mFSipsTask(with: url) { mFSips, response, error in
//     if let mFSips = mFSips {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMFSips { response in
//     if let mFSips = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - MFSips
struct MFSips: Codable {
    let data: [Datum]?
}

// MARK: MFSips convenience initializers and mutators

extension MFSips {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MFSips.self, from: data)
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
        data: [Datum]?? = nil
    ) -> MFSips {
        return MFSips(
            data: data ?? self.data
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
    let completedInstalments: Int?
    let created: Date?
    let dividendType, frequency, fund: String?
    let instalmentAmount, instalmentDay, instalments: Int?
    let lastInstalment: Date?
    let nextInstalment: String?
    let pendingInstalments: Int?
    let sipID: String?
    let sipRegNum: String?
    let sipType, status: String?
    let stepUp: [String: Int]?
    let tag, tradingsymbol, transactionType: String?
    let triggerPrice: Int?

    enum CodingKeys: String, CodingKey {
        case completedInstalments = "completed_instalments"
        case created
        case dividendType = "dividend_type"
        case frequency, fund
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
        completedInstalments: Int?? = nil,
        created: Date?? = nil,
        dividendType: String?? = nil,
        frequency: String?? = nil,
        fund: String?? = nil,
        instalmentAmount: Int?? = nil,
        instalmentDay: Int?? = nil,
        instalments: Int?? = nil,
        lastInstalment: Date?? = nil,
        nextInstalment: String?? = nil,
        pendingInstalments: Int?? = nil,
        sipID: String?? = nil,
        sipRegNum: String?? = nil,
        sipType: String?? = nil,
        status: String?? = nil,
        stepUp: [String: Int]?? = nil,
        tag: String?? = nil,
        tradingsymbol: String?? = nil,
        transactionType: String?? = nil,
        triggerPrice: Int?? = nil
    ) -> Datum {
        return Datum(
            completedInstalments: completedInstalments ?? self.completedInstalments,
            created: created ?? self.created,
            dividendType: dividendType ?? self.dividendType,
            frequency: frequency ?? self.frequency,
            fund: fund ?? self.fund,
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

    func mFSipsTask(with url: URL, completionHandler: @escaping (MFSips?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseMFSips(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<MFSips>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
