#import "TickerFull.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface TickerFullTriggerRangeElement (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface TickerFullDepth (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface TickerFullBuy (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface TickerFullOhlc (JSONConversion)
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

TickerFull *_Nullable TickerFullFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : map(json, λ(id x, [TickerFullTriggerRangeElement fromJSONDictionary:x]));
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

TickerFull *_Nullable TickerFullFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return TickerFullFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable TickerFullToData(TickerFull *, NSError **error)
{
    @try {
        id json = map(, λ(id x, [x JSONDictionary]));
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable TickerFullToJSON(TickerFull *, NSStringEncoding encoding, NSError **error)
{
    NSData *data = TickerFullToData(, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation TickerFullTriggerRangeElement
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"average_traded_price": @"averageTradedPrice",
        @"change": @"change",
        @"depth": @"depth",
        @"exchange_timestamp": @"exchangeTimestamp",
        @"instrument_token": @"instrumentToken",
        @"last_price": @"lastPrice",
        @"last_trade_time": @"lastTradeTime",
        @"last_traded_quantity": @"lastTradedQuantity",
        @"mode": @"mode",
        @"ohlc": @"ohlc",
        @"oi": @"oi",
        @"oi_day_high": @"oiDayHigh",
        @"oi_day_low": @"oiDayLow",
        @"total_buy_quantity": @"totalBuyQuantity",
        @"total_sell_quantity": @"totalSellQuantity",
        @"tradable": @"tradable",
        @"volume_traded": @"volumeTraded",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[TickerFullTriggerRangeElement alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _depth = [TickerFullDepth fromJSONDictionary:(id)_depth];
        _ohlc = [TickerFullOhlc fromJSONDictionary:(id)_ohlc];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = TickerFullTriggerRangeElement.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = TickerFullTriggerRangeElement.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:TickerFullTriggerRangeElement.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in TickerFullTriggerRangeElement.properties) {
        id propertyName = TickerFullTriggerRangeElement.properties[jsonName];
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

@implementation TickerFullDepth
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
    return dict ? [[TickerFullDepth alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _buy = map(_buy, λ(id x, [TickerFullBuy fromJSONDictionary:x]));
        _sell = map(_sell, λ(id x, [TickerFullBuy fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = TickerFullDepth.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = TickerFullDepth.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:TickerFullDepth.properties.allValues] mutableCopy];

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"buy": NSNullify(map(_buy, λ(id x, [x JSONDictionary]))),
        @"sell": NSNullify(map(_sell, λ(id x, [x JSONDictionary]))),
    }];

    return dict;
}
@end

@implementation TickerFullBuy
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
    return dict ? [[TickerFullBuy alloc] initWithJSONDictionary:dict] : nil;
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
    id resolved = TickerFullBuy.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = TickerFullBuy.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:TickerFullBuy.properties.allValues];
}
@end

@implementation TickerFullOhlc
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
    return dict ? [[TickerFullOhlc alloc] initWithJSONDictionary:dict] : nil;
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
    id resolved = TickerFullOhlc.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = TickerFullOhlc.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:TickerFullOhlc.properties.allValues];
}
@end

NS_ASSUME_NONNULL_END
