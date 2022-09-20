// To parse this JSON:
//
//   NSError *error;
//   Positions * = [Positions fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class Positions;
@class PositionsData;
@class PositionsDay;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface Positions : NSObject
@property (nonatomic, nullable, strong) PositionsData *data;
@property (nonatomic, nullable, copy)   NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface PositionsData : NSObject
@property (nonatomic, nullable, copy) NSArray<PositionsDay *> *day;
@property (nonatomic, nullable, copy) NSArray<PositionsDay *> *net;
@end

@interface PositionsDay : NSObject
@property (nonatomic, nullable, strong) NSNumber *averagePrice;
@property (nonatomic, nullable, strong) NSNumber *buyM2M;
@property (nonatomic, nullable, strong) NSNumber *buyPrice;
@property (nonatomic, nullable, strong) NSNumber *buyQuantity;
@property (nonatomic, nullable, strong) NSNumber *buyValue;
@property (nonatomic, nullable, strong) NSNumber *closePrice;
@property (nonatomic, nullable, strong) NSNumber *dayBuyPrice;
@property (nonatomic, nullable, strong) NSNumber *dayBuyQuantity;
@property (nonatomic, nullable, strong) NSNumber *dayBuyValue;
@property (nonatomic, nullable, strong) NSNumber *daySellPrice;
@property (nonatomic, nullable, strong) NSNumber *daySellQuantity;
@property (nonatomic, nullable, strong) NSNumber *daySellValue;
@property (nonatomic, nullable, copy)   NSString *exchange;
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, strong) NSNumber *m2M;
@property (nonatomic, nullable, strong) NSNumber *multiplier;
@property (nonatomic, nullable, strong) NSNumber *overnightQuantity;
@property (nonatomic, nullable, strong) NSNumber *pnl;
@property (nonatomic, nullable, copy)   NSString *product;
@property (nonatomic, nullable, strong) NSNumber *quantity;
@property (nonatomic, nullable, strong) NSNumber *realised;
@property (nonatomic, nullable, strong) NSNumber *sellM2M;
@property (nonatomic, nullable, strong) NSNumber *sellPrice;
@property (nonatomic, nullable, strong) NSNumber *sellQuantity;
@property (nonatomic, nullable, strong) NSNumber *sellValue;
@property (nonatomic, nullable, copy)   NSString *tradingsymbol;
@property (nonatomic, nullable, strong) NSNumber *unrealised;
@property (nonatomic, nullable, strong) NSNumber *value;
@end

NS_ASSUME_NONNULL_END
