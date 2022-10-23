// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mFInstruments = try MFInstruments(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.mFInstrumentTask(with: url) { mFInstrument, response, error in
//     if let mFInstrument = mFInstrument {
//       ...
//     }
//   }
//   task.resume()
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMFInstrument { response in
//     if let mFInstrument = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - MFInstrument
struct MFInstrument: Codable {
    let amc: Amc?
    let dividendType: DividendType?
    let lastPrice: Double?
    let lastPriceDate: String?
    let minimumAdditionalPurchaseAmount, minimumPurchaseAmount: Int?
    let minimumRedemptionQuantity: Double?
    let name: String?
    let plan: Plan?
    let purchaseAllowed, purchaseAmountMultiplier, redemptionAllowed: Int?
    let redemptionQuantityMultiplier: Double?
    let schemeType: SchemeType?
    let settlementType: SettlementType?
    let tradingsymbol: String?

    enum CodingKeys: String, CodingKey {
        case amc
        case dividendType = "dividend_type"
        case lastPrice = "last_price"
        case lastPriceDate = "last_price_date"
        case minimumAdditionalPurchaseAmount = "minimum_additional_purchase_amount"
        case minimumPurchaseAmount = "minimum_purchase_amount"
        case minimumRedemptionQuantity = "minimum_redemption_quantity"
        case name, plan
        case purchaseAllowed = "purchase_allowed"
        case purchaseAmountMultiplier = "purchase_amount_multiplier"
        case redemptionAllowed = "redemption_allowed"
        case redemptionQuantityMultiplier = "redemption_quantity_multiplier"
        case schemeType = "scheme_type"
        case settlementType = "settlement_type"
        case tradingsymbol
    }
}

// MARK: MFInstrument convenience initializers and mutators

extension MFInstrument {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MFInstrument.self, from: data)
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
        amc: Amc?? = nil,
        dividendType: DividendType?? = nil,
        lastPrice: Double?? = nil,
        lastPriceDate: String?? = nil,
        minimumAdditionalPurchaseAmount: Int?? = nil,
        minimumPurchaseAmount: Int?? = nil,
        minimumRedemptionQuantity: Double?? = nil,
        name: String?? = nil,
        plan: Plan?? = nil,
        purchaseAllowed: Int?? = nil,
        purchaseAmountMultiplier: Int?? = nil,
        redemptionAllowed: Int?? = nil,
        redemptionQuantityMultiplier: Double?? = nil,
        schemeType: SchemeType?? = nil,
        settlementType: SettlementType?? = nil,
        tradingsymbol: String?? = nil
    ) -> MFInstrument {
        return MFInstrument(
            amc: amc ?? self.amc,
            dividendType: dividendType ?? self.dividendType,
            lastPrice: lastPrice ?? self.lastPrice,
            lastPriceDate: lastPriceDate ?? self.lastPriceDate,
            minimumAdditionalPurchaseAmount: minimumAdditionalPurchaseAmount ?? self.minimumAdditionalPurchaseAmount,
            minimumPurchaseAmount: minimumPurchaseAmount ?? self.minimumPurchaseAmount,
            minimumRedemptionQuantity: minimumRedemptionQuantity ?? self.minimumRedemptionQuantity,
            name: name ?? self.name,
            plan: plan ?? self.plan,
            purchaseAllowed: purchaseAllowed ?? self.purchaseAllowed,
            purchaseAmountMultiplier: purchaseAmountMultiplier ?? self.purchaseAmountMultiplier,
            redemptionAllowed: redemptionAllowed ?? self.redemptionAllowed,
            redemptionQuantityMultiplier: redemptionQuantityMultiplier ?? self.redemptionQuantityMultiplier,
            schemeType: schemeType ?? self.schemeType,
            settlementType: settlementType ?? self.settlementType,
            tradingsymbol: tradingsymbol ?? self.tradingsymbol
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Amc: String, Codable {
    case birlaSunLifeMutualFundMF = "BirlaSunLifeMutualFund_MF"
}

enum DividendType: String, Codable {
    case growth = "growth"
    case payout = "payout"
}

enum Plan: String, Codable {
    case direct = "direct"
    case regular = "regular"
}

enum SchemeType: String, Codable {
    case balanced = "balanced"
    case debt = "debt"
    case equity = "equity"
    case fof = "fof"
    case liquid = "liquid"
}

enum SettlementType: String, Codable {
    case t1 = "T1"
    case t3 = "T3"
    case t4 = "T4"
    case t6 = "T6"
}

typealias MFInstruments = [MFInstrument]

extension Array where Element == MFInstruments.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MFInstruments.self, from: data)
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

    func mFInstrumentsTask(with url: URL, completionHandler: @escaping (MFInstruments?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
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
    func responseMFInstruments(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<MFInstruments>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
