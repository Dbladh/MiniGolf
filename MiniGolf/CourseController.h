//
//  CourseController.h
//  MiniGolf
//
//  Created by Daniel Bladh on 3/3/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Course.h"

@interface CourseController : NSObject
+ (CourseController *)sharedInstance;
-(void)removeEntry:(Course *)course;
-(void)synchronize;
-(void)addEntryWithTitle:(NSString *)course andText:(NSString *)hole;
-(NSArray *)courses;

@end
