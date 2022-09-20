// To parse this JSON:
//
//   NSError *error;
//   Profile * = [Profile fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class Profile;
@class ProfileData;
@class ProfileMeta;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface Profile : NSObject
@property (nonatomic, nullable, strong) ProfileData *data;
@property (nonatomic, nullable, copy)   NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface ProfileData : NSObject
@property (nonatomic, nullable, copy)   id avatarURL;
@property (nonatomic, nullable, copy)   NSString *broker;
@property (nonatomic, nullable, copy)   NSString *email;
@property (nonatomic, nullable, copy)   NSArray<NSString *> *exchanges;
@property (nonatomic, nullable, strong) ProfileMeta *meta;
@property (nonatomic, nullable, copy)   NSArray<NSString *> *orderTypes;
@property (nonatomic, nullable, copy)   NSArray<NSString *> *products;
@property (nonatomic, nullable, copy)   NSString *userID;
@property (nonatomic, nullable, copy)   NSString *userName;
@property (nonatomic, nullable, copy)   NSString *userShortname;
@property (nonatomic, nullable, copy)   NSString *userType;
@end

@interface ProfileMeta : NSObject
@property (nonatomic, nullable, copy) NSString *dematConsent;
@end

NS_ASSUME_NONNULL_END
