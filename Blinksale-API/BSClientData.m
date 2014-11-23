//
//  BSClientData.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSClientData.h"
#import "NSDictionary+CheckObjectClass.h"

@implementation BSClientData

- (instancetype)initWithDictionary:(NSDictionary *)clientData {
    if (self = [super init]) {
        _createdAt = [clientData dateForKey:@"created_at"];
        _name = [[clientData dictionaryForKey:@"name"] stringForKey:@"text"];
        _updatedAt = [clientData dateForKey:@"updated_at"];
        _clientURL = [clientData stringForKey:@"uri"];
    }
    return self;
}

@end
