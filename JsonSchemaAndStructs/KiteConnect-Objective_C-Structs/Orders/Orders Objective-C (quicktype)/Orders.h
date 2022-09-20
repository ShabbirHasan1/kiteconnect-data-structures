// To parse this JSON:
//
//   NSError *error;
//   Orders * = [Orders fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class Orders;
@class OrdersDatum;
@class OrdersMeta;
@class OrdersIceberg;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface Orders : NSObject
@property (nonatomic, nullable, copy) NSArray<OrdersDatum *> *data;
@property (nonatomic, nullable, copy) NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface OrdersDatum : NSObject
@property (nonatomic, nullable, strong) NSNumber *averagePrice;
@property (nonatomic, nullable, strong) NSNumber *cancelledQuantity;
@property (nonatomic, nullable, strong) NSNumber *disclosedQuantity;
@property (nonatomic, nullable, copy)   NSString *exchange;
@property (nonatomic, nullable, copy)   NSString *exchangeOrderID;
@property (nonatomic, nullable, copy)   NSString *exchangeTimestamp;
@property (nonatomic, nullable, copy)   NSString *exchangeUpdateTimestamp;
@property (nonatomic, nullable, strong) NSNumber *filledQuantity;
@property (nonatomic, nullable, copy)   NSString *guid;
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *marketProtection;
@property (nonatomic, nullable, strong) OrdersMeta *meta;
@property (nonatomic, nullable, strong) NSNumber *modified;
@property (nonatomic, nullable, copy)   NSString *orderID;
@property (nonatomic, nullable, copy)   NSString *orderTimestamp;
@property (nonatomic, nullable, copy)   NSString *orderType;
@property (nonatomic, nullable, copy)   id parentOrderID;
@property (nonatomic, nullable, strong) NSNumber *pendingQuantity;
@property (nonatomic, nullable, copy)   NSString *placedBy;
@property (nonatomic, nullable, strong) NSNumber *price;
@property (nonatomic, nullable, copy)   NSString *product;
@property (nonatomic, nullable, strong) NSNumber *quantity;
@property (nonatomic, nullable, copy)   NSString *status;
@property (nonatomic, nullable, copy)   NSString *statusMessage;
@property (nonatomic, nullable, copy)   NSString *statusMessageRaw;
@property (nonatomic, nullable, copy)   NSString *tag;
@property (nonatomic, nullable, copy)   NSArray<NSString *> *tags;
@property (nonatomic, nullable, copy)   NSString *tradingsymbol;
@property (nonatomic, nullable, copy)   NSString *transactionType;
@property (nonatomic, nullable, strong) NSNumber *triggerPrice;
@property (nonatomic, nullable, copy)   NSString *validity;
@property (nonatomic, nullable, strong) NSNumber *validityTTL;
@property (nonatomic, nullable, copy)   NSString *variety;
@end

@interface OrdersMeta : NSObject
@property (nonatomic, nullable, strong) OrdersIceberg *iceberg;
@end

@interface OrdersIceberg : NSObject
@property (nonatomic, nullable, strong) NSNumber *leg;
@property (nonatomic, nullable, strong) NSNumber *legQuantity;
@property (nonatomic, nullable, strong) NSNumber *legs;
@property (nonatomic, nullable, strong) NSNumber *remainingQuantity;
@property (nonatomic, nullable, strong) NSNumber *totalQuantity;
@end

NS_ASSUME_NONNULL_END
