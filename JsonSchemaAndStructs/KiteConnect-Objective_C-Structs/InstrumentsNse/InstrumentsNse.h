// To parse this JSON:
//
//   NSError *error;
//   InstrumentsNse * = InstrumentsNseFromJSON(json, NSUTF8Encoding, &error);

#import <Foundation/Foundation.h>

@class InstrumentsNseElement;
@class InstrumentsNseExchange;
@class InstrumentsNseInstrumentType;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Boxed enums

@interface InstrumentsNseExchange : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (InstrumentsNseExchange *)nse;
@end

@interface InstrumentsNseInstrumentType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (InstrumentsNseInstrumentType *)eq;
@end

typedef NSArray<InstrumentsNseElement *> InstrumentsNse;

#pragma mark - Top-level marshaling functions

InstrumentsNse *_Nullable InstrumentsNseFromData(NSData *data, NSError **error);
InstrumentsNse *_Nullable InstrumentsNseFromJSON(NSString *json, NSStringEncoding encoding, NSError **error);
NSData         *_Nullable InstrumentsNseToData(InstrumentsNse *, NSError **error);
NSString       *_Nullable InstrumentsNseToJSON(InstrumentsNse *, NSStringEncoding encoding, NSError **error);

#pragma mark - Object interfaces

@interface InstrumentsNseElement : NSObject
@property (nonatomic, nullable, assign) InstrumentsNseExchange *exchange;
@property (nonatomic, nullable, strong) NSNumber *exchangeToken;
@property (nonatomic, nullable, copy)   NSString *expiry;
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, assign) InstrumentsNseInstrumentType *instrumentType;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, strong) NSNumber *lotSize;
@property (nonatomic, nullable, copy)   NSString *name;
@property (nonatomic, nullable, assign) InstrumentsNseExchange *segment;
@property (nonatomic, nullable, strong) NSNumber *strike;
@property (nonatomic, nullable, strong) NSNumber *tickSize;
@property (nonatomic, nullable, copy)   NSString *tradingsymbol;
@end

NS_ASSUME_NONNULL_END
