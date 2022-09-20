#import "InstrumentsNse.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface InstrumentsNseElement (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

// These enum-like reference types are needed so that enum
// values can be contained by NSArray and NSDictionary.

@implementation InstrumentsNseExchange
+ (NSDictionary<NSString *, InstrumentsNseExchange *> *)values
{
    static NSDictionary<NSString *, InstrumentsNseExchange *> *values;
    return values = values ? values : @{
        @"NSE": [[InstrumentsNseExchange alloc] initWithValue:@"NSE"],
    };
}

+ (InstrumentsNseExchange *)nse { return InstrumentsNseExchange.values[@"NSE"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return InstrumentsNseExchange.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation InstrumentsNseInstrumentType
+ (NSDictionary<NSString *, InstrumentsNseInstrumentType *> *)values
{
    static NSDictionary<NSString *, InstrumentsNseInstrumentType *> *values;
    return values = values ? values : @{
        @"EQ": [[InstrumentsNseInstrumentType alloc] initWithValue:@"EQ"],
    };
}

+ (InstrumentsNseInstrumentType *)eq { return InstrumentsNseInstrumentType.values[@"EQ"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return InstrumentsNseInstrumentType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
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

InstrumentsNse *_Nullable InstrumentsNseFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : map(json, λ(id x, [InstrumentsNseElement fromJSONDictionary:x]));
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

InstrumentsNse *_Nullable InstrumentsNseFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return InstrumentsNseFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable InstrumentsNseToData(InstrumentsNse *, NSError **error)
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

NSString *_Nullable InstrumentsNseToJSON(InstrumentsNse *, NSStringEncoding encoding, NSError **error)
{
    NSData *data = InstrumentsNseToData(, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation InstrumentsNseElement
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"exchange": @"exchange",
        @"exchange_token": @"exchangeToken",
        @"expiry": @"expiry",
        @"instrument_token": @"instrumentToken",
        @"instrument_type": @"instrumentType",
        @"last_price": @"lastPrice",
        @"lot_size": @"lotSize",
        @"name": @"name",
        @"segment": @"segment",
        @"strike": @"strike",
        @"tick_size": @"tickSize",
        @"tradingsymbol": @"tradingsymbol",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[InstrumentsNseElement alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _exchange = [InstrumentsNseExchange withValue:(id)_exchange];
        _instrumentType = [InstrumentsNseInstrumentType withValue:(id)_instrumentType];
        _segment = [InstrumentsNseExchange withValue:(id)_segment];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = InstrumentsNseElement.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = InstrumentsNseElement.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:InstrumentsNseElement.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in InstrumentsNseElement.properties) {
        id propertyName = InstrumentsNseElement.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"exchange": NSNullify([_exchange value]),
        @"instrument_type": NSNullify([_instrumentType value]),
        @"segment": NSNullify([_segment value]),
    }];

    return dict;
}
@end

NS_ASSUME_NONNULL_END
