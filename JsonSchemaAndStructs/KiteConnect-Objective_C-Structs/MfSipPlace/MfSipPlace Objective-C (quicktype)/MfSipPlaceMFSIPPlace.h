// To parse this JSON:
//
//   NSError *error;
//   MfSipPlaceMFSIPPlace *mFSIPPlace = [MfSipPlaceMFSIPPlace fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class MfSipPlaceMFSIPPlace;
@class MfSipPlaceData;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface MfSipPlaceMFSIPPlace : NSObject
@property (nonatomic, nullable, strong) MfSipPlaceData *data;
@property (nonatomic, nullable, copy)   NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface MfSipPlaceData : NSObject
@property (nonatomic, nullable, copy) NSString *sipID;
@end

NS_ASSUME_NONNULL_END
