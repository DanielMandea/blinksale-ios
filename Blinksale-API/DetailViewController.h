//
//  DetailViewController.h
//  Blinksale-API
//
//  Created by Mandea Daniel on 20/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

