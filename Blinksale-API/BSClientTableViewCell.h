//
//  BSClientTableViewCell.h
//  Blinksale-API
//
//  Created by Mandea Daniel on 29/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BSClientData;

@interface BSClientTableViewCell : UITableViewCell

@property (nonatomic, strong) BSClientData *currentClient;

@end
