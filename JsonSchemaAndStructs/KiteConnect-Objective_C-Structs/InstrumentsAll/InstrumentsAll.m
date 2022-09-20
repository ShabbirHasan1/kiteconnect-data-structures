#import "InstrumentsAll.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface InstrumentsAllElement (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

// These enum-like reference types are needed so that enum
// values can be contained by NSArray and NSDictionary.

@implementation InstrumentsAllExchange
+ (NSDictionary<NSString *, InstrumentsAllExchange *> *)values
{
    static NSDictionary<NSString *, InstrumentsAllExchange *> *values;
    return values = values ? values : @{
        @"BSE": [[InstrumentsAllExchange alloc] initWithValue:@"BSE"],
        @"NFO": [[InstrumentsAllExchange alloc] initWithValue:@"NFO"],
        @"NSE": [[InstrumentsAllExchange alloc] initWithValue:@"NSE"],
    };
}

+ (InstrumentsAllExchange *)bse { return InstrumentsAllExchange.values[@"BSE"]; }
+ (InstrumentsAllExchange *)nfo { return InstrumentsAllExchange.values[@"NFO"]; }
+ (InstrumentsAllExchange *)nse { return InstrumentsAllExchange.values[@"NSE"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return InstrumentsAllExchange.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation InstrumentsAllInstrumentType
+ (NSDictionary<NSString *, InstrumentsAllInstrumentType *> *)values
{
    static NSDictionary<NSString *, InstrumentsAllInstrumentType *> *values;
    return values = values ? values : @{
        @"CE": [[InstrumentsAllInstrumentType alloc] initWithValue:@"CE"],
        @"EQ": [[InstrumentsAllInstrumentType alloc] initWithValue:@"EQ"],
        @"PE": [[InstrumentsAllInstrumentType alloc] initWithValue:@"PE"],
    };
}

+ (InstrumentsAllInstrumentType *)ce { return InstrumentsAllInstrumentType.values[@"CE"]; }
+ (InstrumentsAllInstrumentType *)eq { return InstrumentsAllInstrumentType.values[@"EQ"]; }
+ (InstrumentsAllInstrumentType *)pe { return InstrumentsAllInstrumentType.values[@"PE"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return InstrumentsAllInstrumentType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation InstrumentsAllSegment
+ (NSDictionary<NSString *, InstrumentsAllSegment *> *)values
{
    static NSDictionary<NSString *, InstrumentsAllSegment *> *values;
    return values = values ? values : @{
        @"BSE": [[InstrumentsAllSegment alloc] initWithValue:@"BSE"],
        @"NFO-OPT": [[InstrumentsAllSegment alloc] initWithValue:@"NFO-OPT"],
        @"NSE": [[InstrumentsAllSegment alloc] initWithValue:@"NSE"],
    };
}

+ (InstrumentsAllSegment *)bse { return InstrumentsAllSegment.values[@"BSE"]; }
+ (InstrumentsAllSegment *)nfoOpt { return InstrumentsAllSegment.values[@"NFO-OPT"]; }
+ (InstrumentsAllSegment *)nse { return InstrumentsAllSegment.values[@"NSE"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return InstrumentsAllSegment.values[value];
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

InstrumentsAll *_Nullable InstrumentsAllFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : map(json, λ(id x, [InstrumentsAllElement fromJSONDictionary:x]));
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

InstrumentsAll *_Nullable InstrumentsAllFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return InstrumentsAllFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable InstrumentsAllToData(InstrumentsAll *, NSError **error)
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

NSString *_Nullable InstrumentsAllToJSON(InstrumentsAll *, NSStringEncoding encoding, NSError **error)
{
    NSData *data = InstrumentsAllToData(, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation InstrumentsAllElement
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
    return dict ? [[InstrumentsAllElement alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _exchange = [InstrumentsAllExchange withValue:(id)_exchange];
        _instrumentType = [InstrumentsAllInstrumentType withValue:(id)_instrumentType];
        _segment = [InstrumentsAllSegment withValue:(id)_segment];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = InstrumentsAllElement.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = InstrumentsAllElement.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:InstrumentsAllElement.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in InstrumentsAllElement.properties) {
        id propertyName = InstrumentsAllElement.properties[jsonName];
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
