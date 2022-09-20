// To parse this JSON:
//
//   NSError *error;
//   TickerLtp * = TickerLtpFromJSON(json, NSUTF8Encoding, &error);

#import <Foundation/Foundation.h>

@class TickerLtpTriggerRangeElement;

NS_ASSUME_NONNULL_BEGIN

typedef NSArray<TickerLtpTriggerRangeElement *> TickerLtp;

#pragma mark - Top-level marshaling functions

TickerLtp *_Nullable TickerLtpFromData(NSData *data, NSError **error);
TickerLtp *_Nullable TickerLtpFromJSON(NSString *json, NSStringEncoding encoding, NSError **error);
NSData    *_Nullable TickerLtpToData(TickerLtp *, NSError **error);
NSString  *_Nullable TickerLtpToJSON(TickerLtp *, NSStringEncoding encoding, NSError **error);

#pragma mark - Object interfaces

@interface TickerLtpTriggerRangeElement : NSObject
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, copy)   NSString *mode;
@property (nonatomic, nullable, strong) NSNumber *tradable;
@end

NS_ASSUME_NONNULL_END
