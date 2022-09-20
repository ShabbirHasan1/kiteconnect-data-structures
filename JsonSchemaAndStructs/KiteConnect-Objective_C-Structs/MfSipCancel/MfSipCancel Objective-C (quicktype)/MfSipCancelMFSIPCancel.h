// To parse this JSON:
//
//   NSError *error;
//   MfSipCancelMFSIPCancel *mFSIPCancel = [MfSipCancelMFSIPCancel fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class MfSipCancelMFSIPCancel;
@class MfSipCancelData;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface MfSipCancelMFSIPCancel : NSObject
@property (nonatomic, nullable, strong) MfSipCancelData *data;
@property (nonatomic, nullable, copy)   NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface MfSipCancelData : NSObject
@property (nonatomic, nullable, copy) NSString *sipID;
@end

NS_ASSUME_NONNULL_END
