//
//  BSLoginViewController.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSLoginViewController.h"
#import "BSBlinksaleAPI.h"
#import <JNKeychain.h>

@interface BSLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *domainTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation BSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Check If we allready have user credentials
    [self checkIfTheUserIsAllreadyLoggedIn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkIfTheUserIsAllreadyLoggedIn {
    NSString *username = [JNKeychain loadValueForKey:(__bridge id)kSecAttrAccount];
    NSString *password = [JNKeychain loadValueForKey:(__bridge id)kSecValueData];
    if (username.length && password.length) {
        [self performSegueWithIdentifier:@"pushMainController" sender:self];
    }
}

#pragma mark - IBAction

- (IBAction)loginNewUser:(id)sender {
    if (self.domainTextField.text.length && self.usernameTextField.text.length && self.passwordTextField.text.length) {
        [[BSBlinksaleAPI sharedInstance] loginClientWithDomain:self.domainTextField.text username:self.usernameTextField.text password:self.passwordTextField.text withSuccess:^(id response) {
            [self performSegueWithIdentifier:@"pushMainController" sender:self];
        } withError:^(NSError *error) {
            // TODO some error
        }];
    } else {
        // TODO other error
    }
}

- (IBAction)registerUser:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://application.blinksale.com/signup"]];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
