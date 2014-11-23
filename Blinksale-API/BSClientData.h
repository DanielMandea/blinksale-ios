//
//  BSClientData.h
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSClientData : NSObject


- (instancetype)initWithDictionary:(NSDictionary *)clientData;

@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) NSString *clientURL;

@end
