// To parse this JSON:
//
//   NSError *error;
//   MfInstrumentsMFInstruments *mFInstruments = MfInstrumentsMFInstrumentsFromJSON(json, NSUTF8Encoding, &error);

#import <Foundation/Foundation.h>

@class MfInstrumentsMFInstrument;
@class MfInstrumentsAmc;
@class MfInstrumentsDividendType;
@class MfInstrumentsPlan;
@class MfInstrumentsSchemeType;
@class MfInstrumentsSettlementType;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Boxed enums

@interface MfInstrumentsAmc : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (MfInstrumentsAmc *)birlaSunLifeMutualFundMF;
@end

@interface MfInstrumentsDividendType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (MfInstrumentsDividendType *)growth;
+ (MfInstrumentsDividendType *)payout;
@end

@interface MfInstrumentsPlan : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (MfInstrumentsPlan *)direct;
+ (MfInstrumentsPlan *)regular;
@end

@interface MfInstrumentsSchemeType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (MfInstrumentsSchemeType *)balanced;
+ (MfInstrumentsSchemeType *)debt;
+ (MfInstrumentsSchemeType *)equity;
+ (MfInstrumentsSchemeType *)fof;
+ (MfInstrumentsSchemeType *)liquid;
@end

@interface MfInstrumentsSettlementType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (MfInstrumentsSettlementType *)t1;
+ (MfInstrumentsSettlementType *)t3;
+ (MfInstrumentsSettlementType *)t4;
+ (MfInstrumentsSettlementType *)t6;
@end

typedef NSArray<MfInstrumentsMFInstrument *> MfInstrumentsMFInstruments;

#pragma mark - Top-level marshaling functions

MfInstrumentsMFInstruments *_Nullable MfInstrumentsMFInstrumentsFromData(NSData *data, NSError **error);
MfInstrumentsMFInstruments *_Nullable MfInstrumentsMFInstrumentsFromJSON(NSString *json, NSStringEncoding encoding, NSError **error);
NSData                     *_Nullable MfInstrumentsMFInstrumentsToData(MfInstrumentsMFInstruments *mFInstruments, NSError **error);
NSString                   *_Nullable MfInstrumentsMFInstrumentsToJSON(MfInstrumentsMFInstruments *mFInstruments, NSStringEncoding encoding, NSError **error);

#pragma mark - Object interfaces

@interface MfInstrumentsMFInstrument : NSObject
@property (nonatomic, nullable, assign) MfInstrumentsAmc *amc;
@property (nonatomic, nullable, assign) MfInstrumentsDividendType *dividendType;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, copy)   NSString *lastPriceDate;
@property (nonatomic, nullable, strong) NSNumber *minimumAdditionalPurchaseAmount;
@property (nonatomic, nullable, strong) NSNumber *minimumPurchaseAmount;
@property (nonatomic, nullable, strong) NSNumber *minimumRedemptionQuantity;
@property (nonatomic, nullable, copy)   NSString *name;
@property (nonatomic, nullable, assign) MfInstrumentsPlan *plan;
@property (nonatomic, nullable, strong) NSNumber *purchaseAllowed;
@property (nonatomic, nullable, strong) NSNumber *purchaseAmountMultiplier;
@property (nonatomic, nullable, strong) NSNumber *redemptionAllowed;
@property (nonatomic, nullable, strong) NSNumber *redemptionQuantityMultiplier;
@property (nonatomic, nullable, assign) MfInstrumentsSchemeType *schemeType;
@property (nonatomic, nullable, assign) MfInstrumentsSettlementType *settlementType;
@property (nonatomic, nullable, copy)   NSString *tradingsymbol;
@end

NS_ASSUME_NONNULL_END
