//
//  PlayerController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 3/20/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "PlayerController.h"
#import "Stack.h"
#import <Parse/Parse.h>

@interface PlayerController ()

@end

@implementation PlayerController

+ (PlayerController *)sharedInstance {
    static PlayerController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PlayerController alloc] init];
        
        
    });
    return sharedInstance;
}

- (void)addPlayerToCourse:(Course *)course withFirstName:(NSString *)firstName {
    Player *player = [NSEntityDescription insertNewObjectForEntityForName:@"Player"
                                           inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    player.course = course;
    player.name = firstName;
    [self synchronize];
}

- (NSArray *)playersForCourse:(Course *)course {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Player"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"course = %@", course];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    return [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
}

- (void)configureFetchedResultsController {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Player"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:[Stack sharedInstance].managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    [self.fetchedResultsController performFetch:nil];
}

-(void)synchronize{
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
}

@end