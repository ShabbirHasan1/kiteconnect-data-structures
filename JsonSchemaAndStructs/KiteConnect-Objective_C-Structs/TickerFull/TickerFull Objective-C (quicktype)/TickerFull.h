// To parse this JSON:
//
//   NSError *error;
//   TickerFull * = [TickerFull fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class TickerFull;
@class TickerFullDepth;
@class TickerFullBuy;
@class TickerFullOhlc;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface TickerFull : NSObject
@property (nonatomic, nullable, strong) NSNumber *averagePrice;
@property (nonatomic, nullable, strong) NSNumber *buyQuantity;
@property (nonatomic, nullable, strong) NSNumber *change;
@property (nonatomic, nullable, strong) TickerFullDepth *depth;
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, strong) NSNumber *lastQuantity;
@property (nonatomic, nullable, copy)   NSString *lastTradeTime;
@property (nonatomic, nullable, copy)   NSString *mode;
@property (nonatomic, nullable, strong) TickerFullOhlc *ohlc;
@property (nonatomic, nullable, strong) NSNumber *oi;
@property (nonatomic, nullable, strong) NSNumber *oiDayHigh;
@property (nonatomic, nullable, strong) NSNumber *oiDayLow;
@property (nonatomic, nullable, strong) NSNumber *sellQuantity;
@property (nonatomic, nullable, copy)   NSString *timestamp;
@property (nonatomic, nullable, strong) NSNumber *tradable;
@property (nonatomic, nullable, strong) NSNumber *volume;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface TickerFullDepth : NSObject
@property (nonatomic, nullable, copy) NSArray<TickerFullBuy *> *buy;
@property (nonatomic, nullable, copy) NSArray<TickerFullBuy *> *sell;
@end

@interface TickerFullBuy : NSObject
@property (nonatomic, nullable, strong) NSNumber *orders;
@property (nonatomic, nullable, strong) NSNumber *price;
@property (nonatomic, nullable, strong) NSNumber *quantity;
@end

@interface TickerFullOhlc : NSObject
@property (nonatomic, nullable, strong) NSNumber *close;
@property (nonatomic, nullable, strong) NSNumber *high;
@property (nonatomic, nullable, strong) NSNumber *low;
@property (nonatomic, nullable, strong) NSNumber *open;
@end

NS_ASSUME_NONNULL_END
