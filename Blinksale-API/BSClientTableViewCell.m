//
//  BSClientTableViewCell.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 29/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSClientTableViewCell.h"
#import "BSClientData.h"

@implementation BSClientTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Setup Cell Data 

- (void)setCurrentClient:(BSClientData *)currentClient {
    // Set current client data
    _currentClient = currentClient;
    // Set reuse cell data
    self.textLabel.text = currentClient.name;
}

@end
