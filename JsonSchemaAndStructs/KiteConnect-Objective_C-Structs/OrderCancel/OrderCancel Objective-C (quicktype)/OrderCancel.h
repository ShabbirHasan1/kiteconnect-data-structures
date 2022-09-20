// To parse this JSON:
//
//   NSError *error;
//   OrderCancel * = [OrderCancel fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class OrderCancel;
@class OrderCancelData;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface OrderCancel : NSObject
@property (nonatomic, nullable, strong) OrderCancelData *data;
@property (nonatomic, nullable, copy)   NSString *status;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface OrderCancelData : NSObject
@property (nonatomic, nullable, copy) NSString *orderID;
@end

NS_ASSUME_NONNULL_END
