#import "TickerLtp.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface TickerLtpTriggerRangeElement (JSONConversion)
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

TickerLtp *_Nullable TickerLtpFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : map(json, λ(id x, [TickerLtpTriggerRangeElement fromJSONDictionary:x]));
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

TickerLtp *_Nullable TickerLtpFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return TickerLtpFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable TickerLtpToData(TickerLtp *, NSError **error)
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

NSString *_Nullable TickerLtpToJSON(TickerLtp *, NSStringEncoding encoding, NSError **error)
{
    NSData *data = TickerLtpToData(, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation TickerLtpTriggerRangeElement
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"instrument_token": @"instrumentToken",
        @"last_price": @"lastPrice",
        @"mode": @"mode",
        @"tradable": @"tradable",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[TickerLtpTriggerRangeElement alloc] initWithJSONDictionary:dict] : nil;
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
    id resolved = TickerLtpTriggerRangeElement.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = TickerLtpTriggerRangeElement.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:TickerLtpTriggerRangeElement.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in TickerLtpTriggerRangeElement.properties) {
        id propertyName = TickerLtpTriggerRangeElement.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    return dict;
}
@end

NS_ASSUME_NONNULL_END
