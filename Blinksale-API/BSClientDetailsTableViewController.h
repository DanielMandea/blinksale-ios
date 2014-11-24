//
//  BSClientDetailsTableViewController.h
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BSClientData;

@interface BSClientDetailsTableViewController : UITableViewController

- (void)setCurrentClient:(BSClientData *)curentClient;

@end
