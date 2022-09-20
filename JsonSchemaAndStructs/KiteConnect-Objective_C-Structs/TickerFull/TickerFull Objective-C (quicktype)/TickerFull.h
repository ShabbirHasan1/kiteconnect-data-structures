// To parse this JSON:
//
//   NSError *error;
//   TickerFull * = TickerFullFromJSON(json, NSUTF8Encoding, &error);

#import <Foundation/Foundation.h>

@class TickerFullTriggerRangeElement;
@class TickerFullDepth;
@class TickerFullBuy;
@class TickerFullOhlc;

NS_ASSUME_NONNULL_BEGIN

typedef NSArray<TickerFullTriggerRangeElement *> TickerFull;

#pragma mark - Top-level marshaling functions

TickerFull *_Nullable TickerFullFromData(NSData *data, NSError **error);
TickerFull *_Nullable TickerFullFromJSON(NSString *json, NSStringEncoding encoding, NSError **error);
NSData     *_Nullable TickerFullToData(TickerFull *, NSError **error);
NSString   *_Nullable TickerFullToJSON(TickerFull *, NSStringEncoding encoding, NSError **error);

#pragma mark - Object interfaces

@interface TickerFullTriggerRangeElement : NSObject
@property (nonatomic, nullable, strong) NSNumber *averageTradedPrice;
@property (nonatomic, nullable, strong) NSNumber *change;
@property (nonatomic, nullable, strong) TickerFullDepth *depth;
@property (nonatomic, nullable, copy)   NSString *exchangeTimestamp;
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, copy)   NSString *lastTradeTime;
@property (nonatomic, nullable, strong) NSNumber *lastTradedQuantity;
@property (nonatomic, nullable, copy)   NSString *mode;
@property (nonatomic, nullable, strong) TickerFullOhlc *ohlc;
@property (nonatomic, nullable, strong) NSNumber *oi;
@property (nonatomic, nullable, strong) NSNumber *oiDayHigh;
@property (nonatomic, nullable, strong) NSNumber *oiDayLow;
@property (nonatomic, nullable, strong) NSNumber *totalBuyQuantity;
@property (nonatomic, nullable, strong) NSNumber *totalSellQuantity;
@property (nonatomic, nullable, strong) NSNumber *tradable;
@property (nonatomic, nullable, strong) NSNumber *volumeTraded;
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
