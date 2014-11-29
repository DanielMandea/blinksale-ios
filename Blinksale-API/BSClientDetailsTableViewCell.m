//
//  BSClientDetailsTableViewCell.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 29/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSClientDetailsTableViewCell.h"
#import "BSClientData.h"

@interface BSClientDetailsTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *clientName;
@property (weak, nonatomic) IBOutlet UILabel *clientDetails;
@end

@implementation BSClientDetailsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setClientData:(BSClientData *)clientData {
    _clientData = clientData;
    self.clientName.text= clientData.name;
    self.clientDetails.text = [NSString stringWithFormat:@"Address: %@ \nLocality: %@ \nCity: %@ \nCountry: %@ ", clientData.firstAdderss, clientData.state, clientData.city, clientData.country];
}

@end
