//
//  Course.h
//  MiniGolf
//
//  Created by Daniel Bladh on 3/26/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Player;

@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * course;
@property (nonatomic, retain) NSNumber * hole;
@property (nonatomic, retain) NSSet *players;
@end

@interface Course (CoreDataGeneratedAccessors)

- (void)addPlayersObject:(Player *)value;
- (void)removePlayersObject:(Player *)value;
- (void)addPlayers:(NSSet *)values;
- (void)removePlayers:(NSSet *)values;

@end
