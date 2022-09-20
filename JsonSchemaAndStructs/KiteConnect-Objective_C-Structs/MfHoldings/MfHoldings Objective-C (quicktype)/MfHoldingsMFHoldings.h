// To parse this JSON:
//
//   NSError *error;
//   MfHoldingsMFHoldings *mFHoldings = [MfHoldingsMFHoldings fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class MfHoldingsMFHoldings;
@class MfHoldingsDatum;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface MfHoldingsMFHoldings : NSObject
@property (nonatomic, nullable, copy) NSArray<MfHoldingsDatum *> *data;
@property (nonatomic, nullable, copy) NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface MfHoldingsDatum : NSObject
@property (nonatomic, nullable, strong) NSNumber *averagePrice;
@property (nonatomic, nullable, copy)   NSString *folio;
@property (nonatomic, nullable, copy)   NSString *fund;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, copy)   NSString *lastPriceDate;
@property (nonatomic, nullable, strong) NSNumber *pledgedQuantity;
@property (nonatomic, nullable, strong) NSNumber *pnl;
@property (nonatomic, nullable, strong) NSNumber *quantity;
@property (nonatomic, nullable, copy)   NSString *tradingsymbol;
@end

NS_ASSUME_NONNULL_END
