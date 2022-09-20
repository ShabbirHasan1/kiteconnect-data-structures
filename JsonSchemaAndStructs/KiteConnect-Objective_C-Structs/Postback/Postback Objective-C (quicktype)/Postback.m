#import "Postback.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface Postback (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface PostbackMeta (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

#pragma mark - JSON serialization

Postback *_Nullable PostbackFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [Postback fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

Postback *_Nullable PostbackFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return PostbackFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable PostbackToData(Postback *, NSError **error)
{
    @try {
        id json = [ JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable PostbackToJSON(Postback *, NSStringEncoding encoding, NSError **error)
{
    NSData *data = PostbackToData(, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation Postback
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"app_id": @"appID",
        @"average_price": @"averagePrice",
        @"cancelled_quantity": @"cancelledQuantity",
        @"checksum": @"checksum",
        @"disclosed_quantity": @"disclosedQuantity",
        @"exchange": @"exchange",
        @"exchange_order_id": @"exchangeOrderID",
        @"exchange_timestamp": @"exchangeTimestamp",
        @"exchange_update_timestamp": @"exchangeUpdateTimestamp",
        @"filled_quantity": @"filledQuantity",
        @"guid": @"guid",
        @"instrument_token": @"instrumentToken",
        @"market_protection": @"marketProtection",
        @"meta": @"meta",
        @"order_id": @"orderID",
        @"order_timestamp": @"orderTimestamp",
        @"order_type": @"orderType",
        @"parent_order_id": @"parentOrderID",
        @"pending_quantity": @"pendingQuantity",
        @"placed_by": @"placedBy",
        @"price": @"price",
        @"product": @"product",
        @"quantity": @"quantity",
        @"status": @"status",
        @"status_message": @"statusMessage",
        @"status_message_raw": @"statusMessageRaw",
        @"tag": @"tag",
        @"tradingsymbol": @"tradingsymbol",
        @"transaction_type": @"transactionType",
        @"trigger_price": @"triggerPrice",
        @"unfilled_quantity": @"unfilledQuantity",
        @"user_id": @"userID",
        @"validity": @"validity",
        @"variety": @"variety",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return PostbackFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return PostbackFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[Postback alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _meta = [PostbackMeta fromJSONDictionary:(id)_meta];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = Postback.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = Postback.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:Postback.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in Postback.properties) {
        id propertyName = Postback.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"meta": NSNullify([_meta JSONDictionary]),
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return PostbackToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return PostbackToJSON(self, encoding, error);
}
@end

@implementation PostbackMeta
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[PostbackMeta alloc] initWithJSONDictionary:dict] : nil;
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
    id resolved = PostbackMeta.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = PostbackMeta.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:PostbackMeta.properties.allValues];
}
@end

NS_ASSUME_NONNULL_END
