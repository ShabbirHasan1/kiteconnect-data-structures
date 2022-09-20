// To parse this JSON:
//
//   NSError *error;
//   HoldingsAuth * = [HoldingsAuth fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class HoldingsAuth;
@class HoldingsAuthData;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface HoldingsAuth : NSObject
@property (nonatomic, nullable, strong) HoldingsAuthData *data;
@property (nonatomic, nullable, copy)   NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface HoldingsAuthData : NSObject
@property (nonatomic, nullable, copy) NSString *requestID;
@end

NS_ASSUME_NONNULL_END
