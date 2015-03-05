//
//  CourseController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 3/3/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "CourseController.h"
#import "Stack.h"
#import <Parse/Parse.h>


@interface CourseController ()

@end

@implementation CourseController



+ (CourseController *)sharedInstance {
    static CourseController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CourseController alloc] init];
        
        
    });
    return sharedInstance;
}

-(void)addCourseWithTitle:(NSString *)courseName andText:(NSString *)hole{
    
    Course *addCourse =  [NSEntityDescription insertNewObjectForEntityForName:@"Course"
                                                     inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    addCourse.course = courseName;
    addCourse.hole = hole;
    
    [self synchronize];
    
    PFObject *course = [PFObject objectWithClassName:@"Course"];
    course[@"name"] = courseName;
    course[@"hole"] = hole;
    [course saveInBackground];
}

-(void)removeEntry:(Course *)course{
    [[Stack sharedInstance].managedObjectContext deleteObject:course];
    [self synchronize];
    
}

-(NSArray *)courses{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Course"];
    
    NSArray *allCourses = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    return allCourses;
}

-(void)synchronize{
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
}

@end
