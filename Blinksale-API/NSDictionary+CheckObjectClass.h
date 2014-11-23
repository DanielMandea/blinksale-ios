//
//  NSDictionary+CheckObjectClass.h
//  AppEndix
//
//  Created by Daniel Mandea on 23/01/14.
//  Copyright (c) 2014 Softvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CheckObjectClass)

- (NSInteger)integerForKey:(NSString *)key;

- (NSNumber *)numberForKey:(NSString *)key;

- (long)longForKey:(NSString *)key;

- (double)doubleForKey:(NSString *)key;

- (float)floatForKey:(NSString *)key;

- (NSString *)stringForKey:(NSString *) key;

- (NSArray *)arrayForKey:(NSString *) key;

- (NSDictionary *)dictionaryForKey:(NSString *) key;

- (NSDate *)dateForKey:(NSString *)key;

@end
