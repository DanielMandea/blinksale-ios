//
//  BSClientDetailsTableViewController.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSClientDetailsTableViewController.h"
#import "BSClientsDataSource.h"
#import "BSClientData.h"
#import "BSInvoiceData.h"
#import "BSPeopleData.h"
#import "BSPersonData.h"
#import "BSClientDetailsTableViewCell.h"

typedef enum {
    BSSectionTypeCompany = 0,
    BSSectionTypeInvoices = 1,
    BSSectionTypePersons = 2
}BSSectionType;


@interface BSClientDetailsTableViewController ()

@property (nonatomic, strong) BSClientData *currentClient;
@property (nonatomic, strong) BSClientsDataSource *clientData;

@end

@implementation BSClientDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if (self.currentClient) {
        self.clientData = [[BSClientsDataSource alloc] initWithRequestURL:self.currentClient.clientURL];
        self.clientData.currentClient = self.currentClient;
        [self loadDataSource];
    }
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data Source

- (void)loadDataSource {
    [self.refreshControl beginRefreshing];
    [self.clientData loadDataSourceWithCompletionHandeler:^(BOOL success) {
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    }];
}

#pragma mark - Public Methods 

- (void)setCurrentClient:(BSClientData *)currentClient {
    _currentClient = currentClient;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = 0;
    switch (section) {
        case BSSectionTypeCompany:
            numberOfRows = 1;
            break;
        case BSSectionTypeInvoices:
            numberOfRows = self.currentClient.invoices.count;
            break;
        case BSSectionTypePersons:
            numberOfRows = self.currentClient.people.persons.count;
            break;
        default:
            break;
    }
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    switch (indexPath.section) {
        case BSSectionTypeCompany: {
           BSClientDetailsTableViewCell *theCell = (BSClientDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"companyData" forIndexPath:indexPath];
            [theCell setClientData:self.currentClient];
            cell = theCell;
        }
            
            break;
        case BSSectionTypeInvoices: {
            cell = [tableView dequeueReusableCellWithIdentifier:@"invoiceData" forIndexPath:indexPath];
            BSInvoiceData *invoice = [self.currentClient.invoices objectAtIndex:indexPath.row];
            cell.textLabel.text = @"Invoice";
            cell.detailTextLabel.text = invoice.invoiceURL;
        }
            
            break;
        case BSSectionTypePersons: {
            cell = [tableView dequeueReusableCellWithIdentifier:@"peopleData" forIndexPath:indexPath];
            BSPersonData *personData = [self.currentClient.people.persons objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", personData.firstName, personData.lastName];
            cell.detailTextLabel.text = personData.email;
        }
            
            break;
        default:
            break;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *sectionName = @"";
    switch (section) {
        case BSSectionTypeCompany:
            sectionName = @"Company Data";
            break;
        case BSSectionTypeInvoices:
            sectionName = @"Invoices";
            break;
        case BSSectionTypePersons:
            sectionName = @"Persons";
            break;
        default:
            break;
    }
    return sectionName;
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

#pragma mark - IBAction

- (IBAction)reloadContent:(id)sender {
    [self loadDataSource];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
