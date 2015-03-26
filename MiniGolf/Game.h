//
//  Game.h
//  MiniGolf
//
//  Created by Daniel Bladh on 3/20/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Stack.h"

@class Course, Player;

@interface Game : NSManagedObject

@property (nonatomic, retain) Player *players;
@property (nonatomic, retain) Course *course;

@end
