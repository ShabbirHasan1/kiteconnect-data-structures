#import "MfSipInfoMFSIPInfo.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Private model interfaces

@interface MfSipInfoMFSIPInfo (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface MfSipInfoData (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface MfSipInfoStepUp (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

#pragma mark - JSON serialization

MfSipInfoMFSIPInfo *_Nullable MfSipInfoMFSIPInfoFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [MfSipInfoMFSIPInfo fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

MfSipInfoMFSIPInfo *_Nullable MfSipInfoMFSIPInfoFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return MfSipInfoMFSIPInfoFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable MfSipInfoMFSIPInfoToData(MfSipInfoMFSIPInfo *mFSIPInfo, NSError **error)
{
    @try {
        id json = [mFSIPInfo JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable MfSipInfoMFSIPInfoToJSON(MfSipInfoMFSIPInfo *mFSIPInfo, NSStringEncoding encoding, NSError **error)
{
    NSData *data = MfSipInfoMFSIPInfoToData(mFSIPInfo, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation MfSipInfoMFSIPInfo
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
    return MfSipInfoMFSIPInfoFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return MfSipInfoMFSIPInfoFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[MfSipInfoMFSIPInfo alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _data = [MfSipInfoData fromJSONDictionary:(id)_data];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = MfSipInfoMFSIPInfo.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = MfSipInfoMFSIPInfo.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:MfSipInfoMFSIPInfo.properties.allValues] mutableCopy];

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"data": NSNullify([_data JSONDictionary]),
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return MfSipInfoMFSIPInfoToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return MfSipInfoMFSIPInfoToJSON(self, encoding, error);
}
@end

@implementation MfSipInfoData
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"completed_instalments": @"completedInstalments",
        @"created": @"created",
        @"dividend_type": @"dividendType",
        @"frequency": @"frequency",
        @"fund": @"fund",
        @"fund_source": @"fundSource",
        @"instalment_amount": @"instalmentAmount",
        @"instalment_day": @"instalmentDay",
        @"instalments": @"instalments",
        @"last_instalment": @"lastInstalment",
        @"next_instalment": @"nextInstalment",
        @"pending_instalments": @"pendingInstalments",
        @"sip_id": @"sipID",
        @"sip_reg_num": @"sipRegNum",
        @"sip_type": @"sipType",
        @"status": @"status",
        @"step_up": @"stepUp",
        @"tag": @"tag",
        @"tradingsymbol": @"tradingsymbol",
        @"transaction_type": @"transactionType",
        @"trigger_price": @"triggerPrice",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[MfSipInfoData alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _stepUp = [MfSipInfoStepUp fromJSONDictionary:(id)_stepUp];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = MfSipInfoData.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = MfSipInfoData.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:MfSipInfoData.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in MfSipInfoData.properties) {
        id propertyName = MfSipInfoData.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
        @"step_up": NSNullify([_stepUp JSONDictionary]),
    }];

    return dict;
}
@end

@implementation MfSipInfoStepUp
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"15-02": @"the1502",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[MfSipInfoStepUp alloc] initWithJSONDictionary:dict] : nil;
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
    id resolved = MfSipInfoStepUp.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (void)setNilValueForKey:(NSString *)key
{
    id resolved = MfSipInfoStepUp.properties[key];
    if (resolved) [super setValue:@(0) forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:MfSipInfoStepUp.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in MfSipInfoStepUp.properties) {
        id propertyName = MfSipInfoStepUp.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    return dict;
}
@end

NS_ASSUME_NONNULL_END
