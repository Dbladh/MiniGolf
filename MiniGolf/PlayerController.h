//
//  PlayerController.h
//  MiniGolf
//
//  Created by Daniel Bladh on 3/20/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Player.h"

@interface PlayerController : NSObject
+ (PlayerController *)sharedInstance;
-(void)removePlayer:(Player *)player;
-(void)synchronize;
-(void)addPlayerToCourse:(Course *)course withFirstName:(NSString *)firstName;
-(void)configureFetchedResultsController;
-(NSArray *)playersForCourse:(Course *)course;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

