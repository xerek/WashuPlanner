//
//  TableViewController.m
//  WashUPlanner
//
//  Created by Labuser on 4/13/13.
//  Copyright (c) 2013 CSE436. All rights reserved.
//

#import "TableViewController.h"
#import "sqlite3.h"

static int MyCallback(void* context, int count, char **values, char **columns)
{
    NSMutableArray *titles = (NSMutableArray *)CFBridgingRelease(context);
    for (int i=0; i < count; i++) {
        const char *nameCString = values[i];
        [titles addObject:[NSString stringWithUTF8String:nameCString]];
    }
    return SQLITE_OK;
}

@implementation TableViewController
@synthesize homeTabView;

- (void)loadActivitiesFromDatabase
{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"wuplanner" ofType:@"db"];
    sqlite3 *database = NULL;
    if (sqlite3_open([file UTF8String], &database) == SQLITE_OK) {
        sqlite3_exec(database, "select title from activity", MyCallback, (void *)CFBridgingRetain(titles), NULL);
    }
    sqlite3_close(database);
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
       
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(10, 30, 200, 30)];
    UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 30)];
    labelView.textColor = [UIColor whiteColor];
    labelView.backgroundColor = [UIColor clearColor];
    labelView.font = [UIFont boldSystemFontOfSize:20.0];
    labelView.text = @"My Activities";
    [headerView addSubview:labelView];
    
    [self.tableView setTableHeaderView:headerView];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    titles = [[NSMutableArray alloc] init];
    [self loadActivitiesFromDatabase];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 1){
    
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(10, 30, 200, 30)];
        UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 30)];
        labelView.textColor = [UIColor whiteColor];
        labelView.backgroundColor = [UIColor clearColor];
        labelView.font = [UIFont boldSystemFontOfSize:20.0];
        [headerView addSubview:labelView];
        labelView.text = @"WashU Events";
        return headerView;
    }
    
    return nil;

}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(section==0) return [titles count];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(cell == nil)
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    // Configure the cell...
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    if(indexPath.row < titles.count){
        cell.textLabel.text = [titles objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = @"436";

    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
