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

-(void)addCourseWithTitle:(NSString *)courseName andText:(NSNumber*)hole{
    
    Course *addCourse =  [NSEntityDescription insertNewObjectForEntityForName:@"Course"
                                                     inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    addCourse.course = courseName;
    addCourse.hole = hole;
    
    [self synchronize];
    
    PFObject *course = [PFObject objectWithClassName:@"Course"];
    course[@"name"] = courseName;
    course[@"hole"] = hole;
    [course saveEventually];
    
}

-(void)removeEntry:(Course *)course{
    [[Stack sharedInstance].managedObjectContext deleteObject:course];
    [self synchronize];
    
}

- (void)configureFetchedResultsController {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Course"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"course" ascending:YES]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:[Stack sharedInstance].managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    [self.fetchedResultsController performFetch:nil];
}

-(void)synchronize{
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
}

@end
