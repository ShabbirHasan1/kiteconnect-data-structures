// To parse this JSON:
//
//   NSError *error;
//   Postback * = [Postback fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class Postback;
@class PostbackMeta;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface Postback : NSObject
@property (nonatomic, nullable, strong) NSNumber *appID;
@property (nonatomic, nullable, strong) NSNumber *averagePrice;
@property (nonatomic, nullable, strong) NSNumber *cancelledQuantity;
@property (nonatomic, nullable, copy)   NSString *checksum;
@property (nonatomic, nullable, strong) NSNumber *disclosedQuantity;
@property (nonatomic, nullable, copy)   NSString *exchange;
@property (nonatomic, nullable, copy)   NSString *exchangeOrderID;
@property (nonatomic, nullable, copy)   NSString *exchangeTimestamp;
@property (nonatomic, nullable, copy)   NSString *exchangeUpdateTimestamp;
@property (nonatomic, nullable, strong) NSNumber *filledQuantity;
@property (nonatomic, nullable, copy)   NSString *guid;
@property (nonatomic, nullable, strong) NSNumber *instrumentToken;
@property (nonatomic, nullable, strong) NSNumber *marketProtection;
@property (nonatomic, nullable, strong) PostbackMeta *meta;
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
@property (nonatomic, nullable, copy)   id statusMessage;
@property (nonatomic, nullable, copy)   id statusMessageRaw;
@property (nonatomic, nullable, copy)   id tag;
@property (nonatomic, nullable, copy)   NSString *tradingsymbol;
@property (nonatomic, nullable, copy)   NSString *transactionType;
@property (nonatomic, nullable, strong) NSNumber *triggerPrice;
@property (nonatomic, nullable, strong) NSNumber *unfilledQuantity;
@property (nonatomic, nullable, copy)   NSString *userID;
@property (nonatomic, nullable, copy)   NSString *validity;
@property (nonatomic, nullable, copy)   NSString *variety;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface PostbackMeta : NSObject
@end

NS_ASSUME_NONNULL_END
