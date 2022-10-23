// To parse this JSON:
//
//   NSError *error;
//   TickerLtp * = [TickerLtp fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class TickerLtp;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface TickerLtp : NSObject
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, copy)   NSString *mode;
@property (nonatomic, nullable, strong) NSNumber *tradable;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

NS_ASSUME_NONNULL_END
