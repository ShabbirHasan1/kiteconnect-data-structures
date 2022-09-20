// To parse this JSON:
//
//   NSError *error;
//   Quote * = [Quote fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class Quote;
@class QuoteDatum;
@class QuoteDepth;
@class QuoteBuy;
@class QuoteOhlc;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface Quote : NSObject
@property (nonatomic, nullable, copy) NSDictionary<NSString *, QuoteDatum *> *data;
@property (nonatomic, nullable, copy) NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QuoteDatum : NSObject
@property (nonatomic, nullable, strong) NSNumber *averagePrice;
@property (nonatomic, nullable, strong) NSNumber *buyQuantity;
@property (nonatomic, nullable, strong) QuoteDepth *depth;
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, strong) NSNumber *lastQuantity;
@property (nonatomic, nullable, copy)   NSString *lastTradeTime;
@property (nonatomic, nullable, strong) NSNumber *lowerCircuitLimit;
@property (nonatomic, nullable, strong) NSNumber *netChange;
@property (nonatomic, nullable, strong) QuoteOhlc *ohlc;
@property (nonatomic, nullable, strong) NSNumber *oi;
@property (nonatomic, nullable, strong) NSNumber *oiDayHigh;
@property (nonatomic, nullable, strong) NSNumber *oiDayLow;
@property (nonatomic, nullable, strong) NSNumber *sellQuantity;
@property (nonatomic, nullable, copy)   NSString *timestamp;
@property (nonatomic, nullable, strong) NSNumber *upperCircuitLimit;
@property (nonatomic, nullable, strong) NSNumber *volume;
@end

@interface QuoteDepth : NSObject
@property (nonatomic, nullable, copy) NSArray<QuoteBuy *> *buy;
@property (nonatomic, nullable, copy) NSArray<QuoteBuy *> *sell;
@end

@interface QuoteBuy : NSObject
@property (nonatomic, nullable, strong) NSNumber *orders;
@property (nonatomic, nullable, strong) NSNumber *price;
@property (nonatomic, nullable, strong) NSNumber *quantity;
@end

@interface QuoteOhlc : NSObject
@property (nonatomic, nullable, strong) NSNumber *close;
@property (nonatomic, nullable, strong) NSNumber *high;
@property (nonatomic, nullable, strong) NSNumber *low;
@property (nonatomic, nullable, strong) NSNumber *open;
@end

NS_ASSUME_NONNULL_END
