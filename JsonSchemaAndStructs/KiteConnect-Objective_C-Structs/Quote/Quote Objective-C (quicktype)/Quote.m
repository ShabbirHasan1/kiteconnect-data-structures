#import "Quote.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface Quote (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QuoteDatum (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QuoteDepth (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QuoteBuy (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QuoteOhlc (JSONConversion)
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

Quote *_Nullable QuoteFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [Quote fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

Quote *_Nullable QuoteFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return QuoteFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable QuoteToData(Quote *, NSError **error)
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

NSString *_Nullable QuoteToJSON(Quote *, NSStringEncoding encoding, NSError **error)
{
    NSData *data = QuoteToData(, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation Quote
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
    return QuoteFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QuoteFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[Quote alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _data = map(_data, λ(id x, [QuoteDatum fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = Quote.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = Quote.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:Quote.properties.allValues] mutableCopy];

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"data": NSNullify(map(_data, λ(id x, [x JSONDictionary]))),
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return QuoteToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QuoteToJSON(self, encoding, error);
}
@end

@implementation QuoteDatum
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"average_price": @"averagePrice",
        @"buy_quantity": @"buyQuantity",
        @"depth": @"depth",
        @"instrument_token": @"instrumentToken",
        @"last_price": @"lastPrice",
        @"last_quantity": @"lastQuantity",
        @"last_trade_time": @"lastTradeTime",
        @"lower_circuit_limit": @"lowerCircuitLimit",
        @"net_change": @"netChange",
        @"ohlc": @"ohlc",
        @"oi": @"oi",
        @"oi_day_high": @"oiDayHigh",
        @"oi_day_low": @"oiDayLow",
        @"sell_quantity": @"sellQuantity",
        @"timestamp": @"timestamp",
        @"upper_circuit_limit": @"upperCircuitLimit",
        @"volume": @"volume",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QuoteDatum alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _depth = [QuoteDepth fromJSONDictionary:(id)_depth];
        _ohlc = [QuoteOhlc fromJSONDictionary:(id)_ohlc];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = QuoteDatum.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = QuoteDatum.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QuoteDatum.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in QuoteDatum.properties) {
        id propertyName = QuoteDatum.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"depth": NSNullify([_depth JSONDictionary]),
        @"ohlc": NSNullify([_ohlc JSONDictionary]),
    }];

    return dict;
}
@end

@implementation QuoteDepth
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"buy": @"buy",
        @"sell": @"sell",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QuoteDepth alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _buy = map(_buy, λ(id x, [QuoteBuy fromJSONDictionary:x]));
        _sell = map(_sell, λ(id x, [QuoteBuy fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = QuoteDepth.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = QuoteDepth.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QuoteDepth.properties.allValues] mutableCopy];

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"buy": NSNullify(map(_buy, λ(id x, [x JSONDictionary]))),
        @"sell": NSNullify(map(_sell, λ(id x, [x JSONDictionary]))),
    }];

    return dict;
}
@end

@implementation QuoteBuy
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"orders": @"orders",
        @"price": @"price",
        @"quantity": @"quantity",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QuoteBuy alloc] initWithJSONDictionary:dict] : nil;
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
    id resolved = QuoteBuy.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = QuoteBuy.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QuoteBuy.properties.allValues];
}
@end

@implementation QuoteOhlc
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"close": @"close",
        @"high": @"high",
        @"low": @"low",
        @"open": @"open",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QuoteOhlc alloc] initWithJSONDictionary:dict] : nil;
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
    id resolved = QuoteOhlc.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = QuoteOhlc.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QuoteOhlc.properties.allValues];
}
@end

NS_ASSUME_NONNULL_END
