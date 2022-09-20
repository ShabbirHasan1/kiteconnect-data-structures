// To parse this JSON:
//
//   NSError *error;
//   MfSipsMFSips *mFSips = [MfSipsMFSips fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class MfSipsMFSips;
@class MfSipsDatum;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface MfSipsMFSips : NSObject
@property (nonatomic, nullable, copy) NSArray<MfSipsDatum *> *data;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface MfSipsDatum : NSObject
@property (nonatomic, nullable, strong) NSNumber *completedInstalments;
@property (nonatomic, nullable, copy)   NSString *created;
@property (nonatomic, nullable, copy)   NSString *dividendType;
@property (nonatomic, nullable, copy)   NSString *frequency;
@property (nonatomic, nullable, copy)   NSString *fund;
@property (nonatomic, nullable, strong) NSNumber *instalmentAmount;
@property (nonatomic, nullable, strong) NSNumber *instalmentDay;
@property (nonatomic, nullable, strong) NSNumber *instalments;
@property (nonatomic, nullable, copy)   NSString *lastInstalment;
@property (nonatomic, nullable, copy)   NSString *nextInstalment;
@property (nonatomic, nullable, strong) NSNumber *pendingInstalments;
@property (nonatomic, nullable, copy)   NSString *sipID;
@property (nonatomic, nullable, copy)   NSString *sipRegNum;
@property (nonatomic, nullable, copy)   NSString *sipType;
@property (nonatomic, nullable, copy)   NSString *status;
@property (nonatomic, nullable, copy)   NSDictionary<NSString *, NSNumber *> *stepUp;
@property (nonatomic, nullable, copy)   NSString *tag;
@property (nonatomic, nullable, copy)   NSString *tradingsymbol;
@property (nonatomic, nullable, copy)   NSString *transactionType;
@property (nonatomic, nullable, strong) NSNumber *triggerPrice;
@end

NS_ASSUME_NONNULL_END
