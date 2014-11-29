//
//  BSClientsTableViewController.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSClientsTableViewController.h"
#import "BSClientsDataSource.h"
#import "BSClientData.h"
#import "BSClientTableViewCell.h"
#import "BSClientDetailsTableViewController.h"

@interface BSClientsTableViewController ()

@property (nonatomic, strong) BSClientsDataSource *clients;

@end

@implementation BSClientsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.clients = [[BSClientsDataSource alloc] initWithRequestedContent:@"clients"];
    [self loadDataSource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadDataSource {
    [self.refreshControl beginRefreshing];
    [self.clients loadDataSourceWithCompletionHandeler:^(BOOL success) {
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.clients.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Get current client 
    BSClientData *currentClient = [self.clients.dataSource objectAtIndex:indexPath.row];
    // Configure the cell...
    BSClientTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"clientCell" forIndexPath:indexPath];
    [cell setCurrentClient:currentClient];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (IBAction)reloadClients:(id)sender {
    [self loadDataSource];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"clientDetails"]) {
        BSClientTableViewCell *clientCell = sender;
        BSClientDetailsTableViewController *destinationVC = segue.destinationViewController;
        [destinationVC setCurrentClient:clientCell.currentClient];
    }
}

@end
