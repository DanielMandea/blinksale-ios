//
//  BSPeopleData.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 29/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSPeopleData.h"
#import "BSPersonData.h"
#import "NSDictionary+CheckObjectClass.h"

@implementation BSPeopleData

- (instancetype)initWithDictionary:(NSDictionary *)peopleData {
    if (self = [super init]) {
        _title = [peopleData stringForKey:@"text"];
        _peopleURL = [peopleData stringForKey:@"uri"];
        _persons = [self getPersonsFromData:[peopleData arrayForKey:@"person"]];
        if (!_persons) {
            BSPersonData *person = [self getPersonData:[peopleData dictionaryForKey:@"person"]];
            _persons = @[person];
        }
    }
    return self;
}

- (NSArray *)getPersonsFromData:(NSArray *)personsData {
    NSMutableArray *persons = [[NSMutableArray alloc] init];
    for (NSDictionary *personData in personsData) {
        BSPersonData *person = [[BSPersonData alloc] initWithDictionary:personData];
        [persons addObject:person];
    }
    return persons;
}

- (BSPersonData *)getPersonData:(NSDictionary *)personData {
    BSPersonData *person = [[BSPersonData alloc] initWithDictionary:personData];
    return person;
}

@end
