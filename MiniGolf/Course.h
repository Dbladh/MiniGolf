//
//  Course.h
//  MiniGolf
//
//  Created by Daniel Bladh on 3/14/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * course;
@property (nonatomic, retain) NSNumber * hole;

@end
