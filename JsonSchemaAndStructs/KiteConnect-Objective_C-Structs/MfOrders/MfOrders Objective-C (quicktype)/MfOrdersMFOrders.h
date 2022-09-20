// To parse this JSON:
//
//   NSError *error;
//   MfOrdersMFOrders *mFOrders = [MfOrdersMFOrders fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class MfOrdersMFOrders;
@class MfOrdersDatum;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface MfOrdersMFOrders : NSObject
@property (nonatomic, nullable, copy) NSArray<MfOrdersDatum *> *data;
@property (nonatomic, nullable, copy) NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface MfOrdersDatum : NSObject
@property (nonatomic, nullable, strong) NSNumber *amount;
@property (nonatomic, nullable, strong) NSNumber *averagePrice;
@property (nonatomic, nullable, copy)   NSString *exchangeOrderID;
@property (nonatomic, nullable, copy)   NSString *exchangeTimestamp;
@property (nonatomic, nullable, copy)   id folio;
@property (nonatomic, nullable, copy)   NSString *fund;
@property (nonatomic, nullable, strong) NSNumber *lastPrice;
@property (nonatomic, nullable, copy)   NSString *lastPriceDate;
@property (nonatomic, nullable, copy)   NSString *orderID;
@property (nonatomic, nullable, copy)   NSString *orderTimestamp;
@property (nonatomic, nullable, copy)   NSString *placedBy;
@property (nonatomic, nullable, copy)   NSString *purchaseType;
@property (nonatomic, nullable, strong) NSNumber *quantity;
@property (nonatomic, nullable, copy)   NSString *settlementID;
@property (nonatomic, nullable, copy)   NSString *status;
@property (nonatomic, nullable, copy)   NSString *statusMessage;
@property (nonatomic, nullable, copy)   NSString *tag;
@property (nonatomic, nullable, copy)   NSString *tradingsymbol;
@property (nonatomic, nullable, copy)   NSString *transactionType;
@property (nonatomic, nullable, copy)   NSString *variety;
@end

NS_ASSUME_NONNULL_END
