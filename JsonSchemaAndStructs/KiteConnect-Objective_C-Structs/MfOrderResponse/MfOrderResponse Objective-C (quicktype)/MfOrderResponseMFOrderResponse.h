// To parse this JSON:
//
//   NSError *error;
//   MfOrderResponseMFOrderResponse *mFOrderResponse = [MfOrderResponseMFOrderResponse fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class MfOrderResponseMFOrderResponse;
@class MfOrderResponseData;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface MfOrderResponseMFOrderResponse : NSObject
@property (nonatomic, nullable, strong) MfOrderResponseData *data;
@property (nonatomic, nullable, copy)   NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface MfOrderResponseData : NSObject
@property (nonatomic, nullable, copy) NSString *orderID;
@end

NS_ASSUME_NONNULL_END
