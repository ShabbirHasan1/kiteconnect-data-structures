#import "MfOrdersMFOrders.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface MfOrdersMFOrders (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface MfOrdersDatum (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

static id map(id collection, id (^f)(id value)) {
    id result = nil;
    if ([collection isKindOfClass:NSArray.class]) {
        result = [NSMutableArray arrayWithCapacity:[collection count]];
        for (id x in collection) [result addObject:f(x)];
    } else if ([collection isKindOfClass:NSDictionary.class]) {
        result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
        for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
    }
    return result;
}

#pragma mark - JSON serialization

MfOrdersMFOrders *_Nullable MfOrdersMFOrdersFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [MfOrdersMFOrders fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

MfOrdersMFOrders *_Nullable MfOrdersMFOrdersFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return MfOrdersMFOrdersFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable MfOrdersMFOrdersToData(MfOrdersMFOrders *mFOrders, NSError **error)
{
    @try {
        id json = [mFOrders JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable MfOrdersMFOrdersToJSON(MfOrdersMFOrders *mFOrders, NSStringEncoding encoding, NSError **error)
{
    NSData *data = MfOrdersMFOrdersToData(mFOrders, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation MfOrdersMFOrders
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
    return MfOrdersMFOrdersFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return MfOrdersMFOrdersFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[MfOrdersMFOrders alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _data = map(_data, λ(id x, [MfOrdersDatum fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = MfOrdersMFOrders.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = MfOrdersMFOrders.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:MfOrdersMFOrders.properties.allValues] mutableCopy];

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"data": NSNullify(map(_data, λ(id x, [x JSONDictionary]))),
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return MfOrdersMFOrdersToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return MfOrdersMFOrdersToJSON(self, encoding, error);
}
@end

@implementation MfOrdersDatum
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
    return dict ? [[MfOrdersDatum alloc] initWithJSONDictionary:dict] : nil;
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
    id resolved = MfOrdersDatum.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = MfOrdersDatum.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:MfOrdersDatum.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in MfOrdersDatum.properties) {
        id propertyName = MfOrdersDatum.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    return dict;
}
@end

NS_ASSUME_NONNULL_END
