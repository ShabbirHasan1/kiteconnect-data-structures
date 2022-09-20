// To parse this JSON:
//
//   NSError *error;
//   MfOrderCancelMFOrderCancel *mFOrderCancel = [MfOrderCancelMFOrderCancel fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class MfOrderCancelMFOrderCancel;
@class MfOrderCancelData;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface MfOrderCancelMFOrderCancel : NSObject
@property (nonatomic, nullable, strong) MfOrderCancelData *data;
@property (nonatomic, nullable, copy)   NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface MfOrderCancelData : NSObject
@property (nonatomic, nullable, copy) NSString *orderID;
@end

NS_ASSUME_NONNULL_END
