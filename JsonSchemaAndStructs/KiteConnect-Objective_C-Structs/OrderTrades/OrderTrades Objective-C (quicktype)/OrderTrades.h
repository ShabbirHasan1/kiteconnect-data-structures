// To parse this JSON:
//
//   NSError *error;
//   OrderTrades * = [OrderTrades fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class OrderTrades;
@class OrderTradesDatum;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface OrderTrades : NSObject
@property (nonatomic, nullable, copy) NSArray<OrderTradesDatum *> *data;
@property (nonatomic, nullable, copy) NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface OrderTradesDatum : NSObject
@property (nonatomic, nullable, strong) NSNumber *averagePrice;
@property (nonatomic, nullable, copy)   NSString *exchange;
@property (nonatomic, nullable, copy)   NSString *exchangeOrderID;
@property (nonatomic, nullable, copy)   NSString *exchangeTimestamp;
@property (nonatomic, nullable, copy)   NSString *fillTimestamp;
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, copy)   NSString *orderID;
@property (nonatomic, nullable, copy)   NSString *orderTimestamp;
@property (nonatomic, nullable, copy)   NSString *product;
@property (nonatomic, nullable, strong) NSNumber *quantity;
@property (nonatomic, nullable, copy)   NSString *tradeID;
@property (nonatomic, nullable, copy)   NSString *tradingsymbol;
@property (nonatomic, nullable, copy)   NSString *transactionType;
@end

NS_ASSUME_NONNULL_END
