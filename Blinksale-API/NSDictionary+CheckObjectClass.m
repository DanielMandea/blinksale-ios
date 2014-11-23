//
//  NSDictionary+CheckObjectClass.m
//  AppEndix
//
//  Created by Daniel Mandea on 23/01/14.
//  Copyright (c) 2014 Softvision. All rights reserved.
//

#import "NSDictionary+CheckObjectClass.h"

@implementation NSDictionary (CheckObjectClass)



- (NSInteger)integerForKey:(NSString *)key {
    
    if ([[self objectForKey:key] isKindOfClass:[NSString class]]) {
        return [[self objectForKey:key] integerValue];
    } else if ([[self objectForKey:key] isKindOfClass:[NSNumber class]]) {
        return [[self objectForKey:key]  integerValue];
    } else {
        return 0;
    }
}

- (NSNumber *)numberForKey:(NSString *)key {
    
    return [NSNumber numberWithInteger:[self integerForKey:key]];
}

- (long)longForKey:(NSString *)key {
    if ([[self objectForKey:key] isKindOfClass:[NSString class]]) {
        return [[self objectForKey:key] longValue];
    }else if ([[self objectForKey:key] isKindOfClass:[NSNumber class]]) {
        return [[self objectForKey:key]  longValue];
    } else {
        return 0;
    }
}

- (double)doubleForKey:(NSString *)key {
    if ([[self objectForKey:key] isKindOfClass:[NSString class]]) {
        return [[self objectForKey:key] doubleValue];
    }else if ([[self objectForKey:key] isKindOfClass:[NSNumber class]]) {
        return [[self objectForKey:key]  doubleValue];
    } else {
        return 0;
    }
}

- (float)floatForKey:(NSString *)key {
    if ([[self objectForKey:key] isKindOfClass:[NSString class]]) {
        return [[self objectForKey:key] floatValue];
    }else if ([[self objectForKey:key] isKindOfClass:[NSNumber class]]) {
        return [[self objectForKey:key]  floatValue];
    } else {
        return 0;
    }
}

- (NSString *)stringForKey:(NSString *)key {
    if ([[self objectForKey:key] isKindOfClass:[NSString class]]) {
        return [self objectForKey:key];
    } else {
        return nil;
    }
}

- (NSArray *)arrayForKey:(NSString *)key {
    if ([[self objectForKey:key] isKindOfClass:[NSArray class]]) {
        return [self objectForKey:key];
    } else {
        return nil;
    }
}

- (NSDictionary *)dictionaryForKey:(NSString *)key {
    if ([[self objectForKey:key] isKindOfClass:[NSDictionary class]]) {
        return [self objectForKey:key];
    } else {
        return nil;
    }
}

- (NSDate *)dateForKey:(NSString *)key {
    
    if ([[self objectForKey:key] isKindOfClass:[NSString class]]) {
        NSString *curentDate = [self objectForKey:key];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [formatter setTimeZone:nil];
        NSDate *date = [formatter dateFromString:curentDate];
        
        if (date) {
            return date;
        } else {
            [formatter setDateFormat:@"yyyy-MM-dd"];
            date = [formatter dateFromString:curentDate];
            
            return date;
        }
    } else {
        return nil;
    }
}

@end
