//
//  TableViewController.h
//  WashUPlanner
//
//  Created by Labuser on 4/13/13.
//  Copyright (c) 2013 CSE436. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController{
     NSMutableArray *titles;
}
@property (strong, nonatomic) IBOutlet UITableView *homeTabView;
@end
