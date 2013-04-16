//
//  Activity.h
//  WashUPlanner
//
//  Created by Labuser on 4/13/13.
//  Copyright (c) 2013 CSE436. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject{

    NSInteger activityID;
    NSString *title;
    NSString *course;
    NSString *description;
    NSDate *date;
    NSDate *alert;

}


@end
