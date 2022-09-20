#import "TickerQuote.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface TickerQuoteTriggerRangeElement (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface TickerQuoteOhlc (JSONConversion)
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

TickerQuote *_Nullable TickerQuoteFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : map(json, λ(id x, [TickerQuoteTriggerRangeElement fromJSONDictionary:x]));
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

TickerQuote *_Nullable TickerQuoteFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return TickerQuoteFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable TickerQuoteToData(TickerQuote *, NSError **error)
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

NSString *_Nullable TickerQuoteToJSON(TickerQuote *, NSStringEncoding encoding, NSError **error)
{
    NSData *data = TickerQuoteToData(, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation TickerQuoteTriggerRangeElement
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"average_traded_price": @"averageTradedPrice",
        @"change": @"change",
        @"instrument_token": @"instrumentToken",
        @"last_price": @"lastPrice",
        @"last_traded_quantity": @"lastTradedQuantity",
        @"mode": @"mode",
        @"ohlc": @"ohlc",
        @"total_buy_quantity": @"totalBuyQuantity",
        @"total_sell_quantity": @"totalSellQuantity",
        @"tradable": @"tradable",
        @"volume_traded": @"volumeTraded",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[TickerQuoteTriggerRangeElement alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _ohlc = [TickerQuoteOhlc fromJSONDictionary:(id)_ohlc];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = TickerQuoteTriggerRangeElement.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = TickerQuoteTriggerRangeElement.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:TickerQuoteTriggerRangeElement.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in TickerQuoteTriggerRangeElement.properties) {
        id propertyName = TickerQuoteTriggerRangeElement.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"ohlc": NSNullify([_ohlc JSONDictionary]),
    }];

    return dict;
}
@end

@implementation TickerQuoteOhlc
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
    return dict ? [[TickerQuoteOhlc alloc] initWithJSONDictionary:dict] : nil;
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
    id resolved = TickerQuoteOhlc.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = TickerQuoteOhlc.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:TickerQuoteOhlc.properties.allValues];
}
@end

NS_ASSUME_NONNULL_END
