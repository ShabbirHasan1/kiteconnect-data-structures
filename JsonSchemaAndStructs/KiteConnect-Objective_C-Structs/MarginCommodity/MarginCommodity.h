// To parse this JSON:
//
//   NSError *error;
//   MarginCommodity * = [MarginCommodity fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class MarginCommodity;
@class MarginCommodityData;
@class MarginCommodityAvailable;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface MarginCommodity : NSObject
@property (nonatomic, nullable, strong) MarginCommodityData *data;
@property (nonatomic, nullable, copy)   NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface MarginCommodityData : NSObject
@property (nonatomic, nullable, strong) MarginCommodityAvailable *available;
@property (nonatomic, nullable, strong) NSNumber *enabled;
@property (nonatomic, nullable, strong) NSNumber *net;
@property (nonatomic, nullable, copy)   NSDictionary<NSString *, NSNumber *> *utilised;
@end

@interface MarginCommodityAvailable : NSObject
@property (nonatomic, nullable, strong) NSNumber *adhocMargin;
@property (nonatomic, nullable, strong) NSNumber *cash;
@property (nonatomic, nullable, strong) NSNumber *collateral;
@property (nonatomic, nullable, strong) NSNumber *intradayPayin;
@property (nonatomic, nullable, strong) NSNumber *liveBalance;
@property (nonatomic, nullable, strong) NSNumber *openingBalance;
@end

NS_ASSUME_NONNULL_END
