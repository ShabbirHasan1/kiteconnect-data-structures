#import "MfInstrumentsMFInstruments.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface MfInstrumentsMFInstrument (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

// These enum-like reference types are needed so that enum
// values can be contained by NSArray and NSDictionary.

@implementation MfInstrumentsAmc
+ (NSDictionary<NSString *, MfInstrumentsAmc *> *)values
{
    static NSDictionary<NSString *, MfInstrumentsAmc *> *values;
    return values = values ? values : @{
        @"BirlaSunLifeMutualFund_MF": [[MfInstrumentsAmc alloc] initWithValue:@"BirlaSunLifeMutualFund_MF"],
    };
}

+ (MfInstrumentsAmc *)birlaSunLifeMutualFundMF { return MfInstrumentsAmc.values[@"BirlaSunLifeMutualFund_MF"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return MfInstrumentsAmc.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation MfInstrumentsDividendType
+ (NSDictionary<NSString *, MfInstrumentsDividendType *> *)values
{
    static NSDictionary<NSString *, MfInstrumentsDividendType *> *values;
    return values = values ? values : @{
        @"growth": [[MfInstrumentsDividendType alloc] initWithValue:@"growth"],
        @"payout": [[MfInstrumentsDividendType alloc] initWithValue:@"payout"],
    };
}

+ (MfInstrumentsDividendType *)growth { return MfInstrumentsDividendType.values[@"growth"]; }
+ (MfInstrumentsDividendType *)payout { return MfInstrumentsDividendType.values[@"payout"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return MfInstrumentsDividendType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation MfInstrumentsPlan
+ (NSDictionary<NSString *, MfInstrumentsPlan *> *)values
{
    static NSDictionary<NSString *, MfInstrumentsPlan *> *values;
    return values = values ? values : @{
        @"direct": [[MfInstrumentsPlan alloc] initWithValue:@"direct"],
        @"regular": [[MfInstrumentsPlan alloc] initWithValue:@"regular"],
    };
}

+ (MfInstrumentsPlan *)direct { return MfInstrumentsPlan.values[@"direct"]; }
+ (MfInstrumentsPlan *)regular { return MfInstrumentsPlan.values[@"regular"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return MfInstrumentsPlan.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation MfInstrumentsSchemeType
+ (NSDictionary<NSString *, MfInstrumentsSchemeType *> *)values
{
    static NSDictionary<NSString *, MfInstrumentsSchemeType *> *values;
    return values = values ? values : @{
        @"balanced": [[MfInstrumentsSchemeType alloc] initWithValue:@"balanced"],
        @"debt": [[MfInstrumentsSchemeType alloc] initWithValue:@"debt"],
        @"equity": [[MfInstrumentsSchemeType alloc] initWithValue:@"equity"],
        @"fof": [[MfInstrumentsSchemeType alloc] initWithValue:@"fof"],
        @"liquid": [[MfInstrumentsSchemeType alloc] initWithValue:@"liquid"],
    };
}

+ (MfInstrumentsSchemeType *)balanced { return MfInstrumentsSchemeType.values[@"balanced"]; }
+ (MfInstrumentsSchemeType *)debt { return MfInstrumentsSchemeType.values[@"debt"]; }
+ (MfInstrumentsSchemeType *)equity { return MfInstrumentsSchemeType.values[@"equity"]; }
+ (MfInstrumentsSchemeType *)fof { return MfInstrumentsSchemeType.values[@"fof"]; }
+ (MfInstrumentsSchemeType *)liquid { return MfInstrumentsSchemeType.values[@"liquid"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return MfInstrumentsSchemeType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation MfInstrumentsSettlementType
+ (NSDictionary<NSString *, MfInstrumentsSettlementType *> *)values
{
    static NSDictionary<NSString *, MfInstrumentsSettlementType *> *values;
    return values = values ? values : @{
        @"T1": [[MfInstrumentsSettlementType alloc] initWithValue:@"T1"],
        @"T3": [[MfInstrumentsSettlementType alloc] initWithValue:@"T3"],
        @"T4": [[MfInstrumentsSettlementType alloc] initWithValue:@"T4"],
        @"T6": [[MfInstrumentsSettlementType alloc] initWithValue:@"T6"],
    };
}

+ (MfInstrumentsSettlementType *)t1 { return MfInstrumentsSettlementType.values[@"T1"]; }
+ (MfInstrumentsSettlementType *)t3 { return MfInstrumentsSettlementType.values[@"T3"]; }
+ (MfInstrumentsSettlementType *)t4 { return MfInstrumentsSettlementType.values[@"T4"]; }
+ (MfInstrumentsSettlementType *)t6 { return MfInstrumentsSettlementType.values[@"T6"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return MfInstrumentsSettlementType.values[value];
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

MfInstrumentsMFInstruments *_Nullable MfInstrumentsMFInstrumentsFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : map(json, λ(id x, [MfInstrumentsMFInstrument fromJSONDictionary:x]));
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

MfInstrumentsMFInstruments *_Nullable MfInstrumentsMFInstrumentsFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return MfInstrumentsMFInstrumentsFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable MfInstrumentsMFInstrumentsToData(MfInstrumentsMFInstruments *mFInstruments, NSError **error)
{
    @try {
        id json = map(mFInstruments, λ(id x, [x JSONDictionary]));
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable MfInstrumentsMFInstrumentsToJSON(MfInstrumentsMFInstruments *mFInstruments, NSStringEncoding encoding, NSError **error)
{
    NSData *data = MfInstrumentsMFInstrumentsToData(mFInstruments, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation MfInstrumentsMFInstrument
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"amc": @"amc",
        @"dividend_type": @"dividendType",
        @"last_price": @"lastPrice",
        @"last_price_date": @"lastPriceDate",
        @"minimum_additional_purchase_amount": @"minimumAdditionalPurchaseAmount",
        @"minimum_purchase_amount": @"minimumPurchaseAmount",
        @"minimum_redemption_quantity": @"minimumRedemptionQuantity",
        @"name": @"name",
        @"plan": @"plan",
        @"purchase_allowed": @"purchaseAllowed",
        @"purchase_amount_multiplier": @"purchaseAmountMultiplier",
        @"redemption_allowed": @"redemptionAllowed",
        @"redemption_quantity_multiplier": @"redemptionQuantityMultiplier",
        @"scheme_type": @"schemeType",
        @"settlement_type": @"settlementType",
        @"tradingsymbol": @"tradingsymbol",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[MfInstrumentsMFInstrument alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _amc = [MfInstrumentsAmc withValue:(id)_amc];
        _dividendType = [MfInstrumentsDividendType withValue:(id)_dividendType];
        _plan = [MfInstrumentsPlan withValue:(id)_plan];
        _schemeType = [MfInstrumentsSchemeType withValue:(id)_schemeType];
        _settlementType = [MfInstrumentsSettlementType withValue:(id)_settlementType];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = MfInstrumentsMFInstrument.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = MfInstrumentsMFInstrument.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:MfInstrumentsMFInstrument.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in MfInstrumentsMFInstrument.properties) {
        id propertyName = MfInstrumentsMFInstrument.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"amc": NSNullify([_amc value]),
        @"dividend_type": NSNullify([_dividendType value]),
        @"plan": NSNullify([_plan value]),
        @"scheme_type": NSNullify([_schemeType value]),
        @"settlement_type": NSNullify([_settlementType value]),
    }];

    return dict;
}
@end

NS_ASSUME_NONNULL_END
