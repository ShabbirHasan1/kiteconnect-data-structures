// To parse this JSON:
//
//   NSError *error;
//   OrderMargins * = [OrderMargins fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class OrderMargins;
@class OrderMarginsDatum;
@class OrderMarginsPnl;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface OrderMargins : NSObject
@property (nonatomic, nullable, copy) NSArray<OrderMarginsDatum *> *data;
@property (nonatomic, nullable, copy) NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface OrderMarginsDatum : NSObject
@property (nonatomic, nullable, strong) NSNumber *additional;
@property (nonatomic, nullable, strong) NSNumber *bo;
@property (nonatomic, nullable, strong) NSNumber *cash;
@property (nonatomic, nullable, copy)   NSString *exchange;
@property (nonatomic, nullable, strong) NSNumber *exposure;
@property (nonatomic, nullable, strong) NSNumber *optionPremium;
@property (nonatomic, nullable, strong) OrderMarginsPnl *pnl;
@property (nonatomic, nullable, strong) NSNumber *span;
@property (nonatomic, nullable, strong) NSNumber *total;
@property (nonatomic, nullable, copy)   NSString *tradingsymbol;
@property (nonatomic, nullable, copy)   NSString *type;
@property (nonatomic, nullable, strong) NSNumber *var;
@end

@interface OrderMarginsPnl : NSObject
@property (nonatomic, nullable, strong) NSNumber *realised;
@property (nonatomic, nullable, strong) NSNumber *unrealised;
@end

NS_ASSUME_NONNULL_END
