//
//  BSPersonData.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 29/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSPersonData.h"
#import "NSDictionary+CheckObjectClass.h"

@implementation BSPersonData

- (instancetype)initWithDictionary:(NSDictionary *)peopleData {
    if (self = [super init]) {
        _firstName = [[peopleData dictionaryForKey:@"first_name"] stringForKey:@"text"];
        _lastName = [[peopleData dictionaryForKey:@"last_name"] stringForKey:@"text"];
        _email = [[peopleData dictionaryForKey:@"email"] stringForKey:@"text"];
        _personURL = [peopleData stringForKey:@"uri"];
    }
    return self;
}

@end
