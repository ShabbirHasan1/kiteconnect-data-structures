// To parse this JSON:
//
//   NSError *error;
//   TickerQuote * = TickerQuoteFromJSON(json, NSUTF8Encoding, &error);

#import <Foundation/Foundation.h>

@class TickerQuoteTriggerRangeElement;
@class TickerQuoteOhlc;

NS_ASSUME_NONNULL_BEGIN

typedef NSArray<TickerQuoteTriggerRangeElement *> TickerQuote;

#pragma mark - Top-level marshaling functions

TickerQuote *_Nullable TickerQuoteFromData(NSData *data, NSError **error);
TickerQuote *_Nullable TickerQuoteFromJSON(NSString *json, NSStringEncoding encoding, NSError **error);
NSData      *_Nullable TickerQuoteToData(TickerQuote *, NSError **error);
NSString    *_Nullable TickerQuoteToJSON(TickerQuote *, NSStringEncoding encoding, NSError **error);

#pragma mark - Object interfaces

@interface TickerQuoteTriggerRangeElement : NSObject
@property (nonatomic, nullable, strong) NSNumber *averageTradedPrice;
@property (nonatomic, nullable, strong) NSNumber *change;
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, strong) NSNumber *lastTradedQuantity;
@property (nonatomic, nullable, copy)   NSString *mode;
@property (nonatomic, nullable, strong) TickerQuoteOhlc *ohlc;
@property (nonatomic, nullable, strong) NSNumber *totalBuyQuantity;
@property (nonatomic, nullable, strong) NSNumber *totalSellQuantity;
@property (nonatomic, nullable, strong) NSNumber *tradable;
@property (nonatomic, nullable, strong) NSNumber *volumeTraded;
@end

@interface TickerQuoteOhlc : NSObject
@property (nonatomic, nullable, strong) NSNumber *close;
@property (nonatomic, nullable, strong) NSNumber *high;
@property (nonatomic, nullable, strong) NSNumber *low;
@property (nonatomic, nullable, strong) NSNumber *open;
@end

NS_ASSUME_NONNULL_END
