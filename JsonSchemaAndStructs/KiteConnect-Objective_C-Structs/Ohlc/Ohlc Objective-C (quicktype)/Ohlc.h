// To parse this JSON:
//
//   NSError *error;
//   Ohlc * = [Ohlc fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class Ohlc;
@class OhlcDatum;
@class OhlcClass;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface Ohlc : NSObject
@property (nonatomic, nullable, copy) NSDictionary<NSString *, OhlcDatum *> *data;
@property (nonatomic, nullable, copy) NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface OhlcDatum : NSObject
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, strong) OhlcClass *ohlc;
@end

@interface OhlcClass : NSObject
@property (nonatomic, nullable, strong) NSNumber *close;
@property (nonatomic, nullable, strong) NSNumber *high;
@property (nonatomic, nullable, strong) NSNumber *low;
@property (nonatomic, nullable, strong) NSNumber *open;
@end

NS_ASSUME_NONNULL_END
