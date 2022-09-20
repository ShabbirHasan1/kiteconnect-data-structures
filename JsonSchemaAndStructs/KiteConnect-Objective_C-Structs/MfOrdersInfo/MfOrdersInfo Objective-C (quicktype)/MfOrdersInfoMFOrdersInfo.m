#import "MfOrdersInfoMFOrdersInfo.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface MfOrdersInfoMFOrdersInfo (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface MfOrdersInfoData (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

#pragma mark - JSON serialization

MfOrdersInfoMFOrdersInfo *_Nullable MfOrdersInfoMFOrdersInfoFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [MfOrdersInfoMFOrdersInfo fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

MfOrdersInfoMFOrdersInfo *_Nullable MfOrdersInfoMFOrdersInfoFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return MfOrdersInfoMFOrdersInfoFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable MfOrdersInfoMFOrdersInfoToData(MfOrdersInfoMFOrdersInfo *mFOrdersInfo, NSError **error)
{
    @try {
        id json = [mFOrdersInfo JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable MfOrdersInfoMFOrdersInfoToJSON(MfOrdersInfoMFOrdersInfo *mFOrdersInfo, NSStringEncoding encoding, NSError **error)
{
    NSData *data = MfOrdersInfoMFOrdersInfoToData(mFOrdersInfo, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation MfOrdersInfoMFOrdersInfo
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"data": @"data",
        @"status": @"status",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return MfOrdersInfoMFOrdersInfoFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return MfOrdersInfoMFOrdersInfoFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[MfOrdersInfoMFOrdersInfo alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _data = [MfOrdersInfoData fromJSONDictionary:(id)_data];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = MfOrdersInfoMFOrdersInfo.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = MfOrdersInfoMFOrdersInfo.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:MfOrdersInfoMFOrdersInfo.properties.allValues] mutableCopy];

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"data": NSNullify([_data JSONDictionary]),
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return MfOrdersInfoMFOrdersInfoToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return MfOrdersInfoMFOrdersInfoToJSON(self, encoding, error);
}
@end

@implementation MfOrdersInfoData
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"amount": @"amount",
        @"average_price": @"averagePrice",
        @"exchange_order_id": @"exchangeOrderID",
        @"exchange_timestamp": @"exchangeTimestamp",
        @"folio": @"folio",
        @"fund": @"fund",
        @"last_price": @"lastPrice",
        @"last_price_date": @"lastPriceDate",
        @"order_id": @"orderID",
        @"order_timestamp": @"orderTimestamp",
        @"placed_by": @"placedBy",
        @"purchase_type": @"purchaseType",
        @"quantity": @"quantity",
        @"settlement_id": @"settlementID",
        @"status": @"status",
        @"status_message": @"statusMessage",
        @"tag": @"tag",
        @"tradingsymbol": @"tradingsymbol",
        @"transaction_type": @"transactionType",
        @"variety": @"variety",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[MfOrdersInfoData alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = MfOrdersInfoData.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = MfOrdersInfoData.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:MfOrdersInfoData.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in MfOrdersInfoData.properties) {
        id propertyName = MfOrdersInfoData.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    return dict;
}
@end

NS_ASSUME_NONNULL_END
