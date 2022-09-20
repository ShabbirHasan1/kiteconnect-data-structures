// To parse this JSON:
//
//   NSError *error;
//   MarginsEquity * = [MarginsEquity fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class MarginsEquity;
@class MarginsEquityData;
@class MarginsEquityAvailable;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface MarginsEquity : NSObject
@property (nonatomic, nullable, strong) MarginsEquityData *data;
@property (nonatomic, nullable, copy)   NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface MarginsEquityData : NSObject
@property (nonatomic, nullable, strong) MarginsEquityAvailable *available;
@property (nonatomic, nullable, strong) NSNumber *enabled;
@property (nonatomic, nullable, strong) NSNumber *net;
@property (nonatomic, nullable, copy)   NSDictionary<NSString *, NSNumber *> *utilised;
@end

@interface MarginsEquityAvailable : NSObject
@property (nonatomic, nullable, strong) NSNumber *adhocMargin;
@property (nonatomic, nullable, strong) NSNumber *cash;
@property (nonatomic, nullable, strong) NSNumber *collateral;
@property (nonatomic, nullable, strong) NSNumber *intradayPayin;
@property (nonatomic, nullable, strong) NSNumber *liveBalance;
@property (nonatomic, nullable, strong) NSNumber *openingBalance;
@end

NS_ASSUME_NONNULL_END
