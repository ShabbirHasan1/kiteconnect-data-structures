// To parse this JSON:
//
//   NSError *error;
//   TickerQuote * = [TickerQuote fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class TickerQuote;
@class TickerQuoteOhlc;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface TickerQuote : NSObject
@property (nonatomic, nullable, strong) NSNumber *averagePrice;
@property (nonatomic, nullable, strong) NSNumber *buyQuantity;
@property (nonatomic, nullable, strong) NSNumber *change;
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, strong) NSNumber *lastQuantity;
@property (nonatomic, nullable, copy)   NSString *mode;
@property (nonatomic, nullable, strong) TickerQuoteOhlc *ohlc;
@property (nonatomic, nullable, strong) NSNumber *sellQuantity;
@property (nonatomic, nullable, strong) NSNumber *tradable;
@property (nonatomic, nullable, strong) NSNumber *volume;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface TickerQuoteOhlc : NSObject
@property (nonatomic, nullable, strong) NSNumber *close;
@property (nonatomic, nullable, strong) NSNumber *high;
@property (nonatomic, nullable, strong) NSNumber *low;
@property (nonatomic, nullable, strong) NSNumber *open;
@end

NS_ASSUME_NONNULL_END
