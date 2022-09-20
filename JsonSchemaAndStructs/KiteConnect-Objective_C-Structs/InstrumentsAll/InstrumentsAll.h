// To parse this JSON:
//
//   NSError *error;
//   InstrumentsAll * = InstrumentsAllFromJSON(json, NSUTF8Encoding, &error);

#import <Foundation/Foundation.h>

@class InstrumentsAllElement;
@class InstrumentsAllExchange;
@class InstrumentsAllInstrumentType;
@class InstrumentsAllSegment;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Boxed enums

@interface InstrumentsAllExchange : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (InstrumentsAllExchange *)bse;
+ (InstrumentsAllExchange *)nfo;
+ (InstrumentsAllExchange *)nse;
@end

@interface InstrumentsAllInstrumentType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (InstrumentsAllInstrumentType *)ce;
+ (InstrumentsAllInstrumentType *)eq;
+ (InstrumentsAllInstrumentType *)pe;
@end

@interface InstrumentsAllSegment : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (InstrumentsAllSegment *)bse;
+ (InstrumentsAllSegment *)nfoOpt;
+ (InstrumentsAllSegment *)nse;
@end

typedef NSArray<InstrumentsAllElement *> InstrumentsAll;

#pragma mark - Top-level marshaling functions

InstrumentsAll *_Nullable InstrumentsAllFromData(NSData *data, NSError **error);
InstrumentsAll *_Nullable InstrumentsAllFromJSON(NSString *json, NSStringEncoding encoding, NSError **error);
NSData         *_Nullable InstrumentsAllToData(InstrumentsAll *, NSError **error);
NSString       *_Nullable InstrumentsAllToJSON(InstrumentsAll *, NSStringEncoding encoding, NSError **error);

#pragma mark - Object interfaces

@interface InstrumentsAllElement : NSObject
@property (nonatomic, nullable, assign) InstrumentsAllExchange *exchange;
@property (nonatomic, nullable, strong) NSNumber *exchangeToken;
@property (nonatomic, nullable, copy)   NSString *expiry;
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, assign) InstrumentsAllInstrumentType *instrumentType;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, strong) NSNumber *lotSize;
@property (nonatomic, nullable, copy)   NSString *name;
@property (nonatomic, nullable, assign) InstrumentsAllSegment *segment;
@property (nonatomic, nullable, strong) NSNumber *strike;
@property (nonatomic, nullable, strong) NSNumber *tickSize;
@property (nonatomic, nullable, copy)   NSString *tradingsymbol;
@end

NS_ASSUME_NONNULL_END
