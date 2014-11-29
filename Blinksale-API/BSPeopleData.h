//
//  BSPeopleData.h
//  Blinksale-API
//
//  Created by Mandea Daniel on 29/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSPeopleData : NSObject

/**
 *  Call this method in order to create an instance of BSPeopleData
 *
 *  @param peopleData an NSDicationary that contains People data
 *
 *  @return an instance of BSPeopleData
 */
- (instancetype)initWithDictionary:(NSDictionary *)peopleData;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *peopleURL;
@property (nonatomic, strong) NSArray *persons;


@end
