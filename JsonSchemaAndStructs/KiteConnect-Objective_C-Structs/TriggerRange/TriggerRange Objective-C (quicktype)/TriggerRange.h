// To parse this JSON:
//
//   NSError *error;
//   TriggerRange * = [TriggerRange fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class TriggerRange;
@class TriggerRangeDatum;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface TriggerRange : NSObject
@property (nonatomic, nullable, copy) NSDictionary<NSString *, TriggerRangeDatum *> *data;
@property (nonatomic, nullable, copy) NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface TriggerRangeDatum : NSObject
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *lower;
@property (nonatomic, nullable, strong) NSNumber *upper;
@end

NS_ASSUME_NONNULL_END
