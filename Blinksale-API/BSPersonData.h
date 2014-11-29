//
//  BSPersonData.h
//  Blinksale-API
//
//  Created by Mandea Daniel on 29/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSPersonData : NSObject
/**
 *  Call this method in order to create an instance of BSPersonData
 *
 *  @param peopleData an NSDicationary that contains BSPersonData data
 *
 *  @return an instance of BSPeopleData
 */
- (instancetype)initWithDictionary:(NSDictionary *)peopleData;

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *personURL;

@end
