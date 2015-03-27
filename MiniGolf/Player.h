//
//  Player.h
//  MiniGolf
//
//  Created by Daniel Bladh on 3/26/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) Course *course;

@end
