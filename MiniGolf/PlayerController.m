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
#import "NewPlayer.h"

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


-(void)addPlayers:(NSArray *) players{
    
    for (NewPlayer __strong *player in players) {
        player = [NSEntityDescription insertNewObjectForEntityForName:@"Player"
                                               inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        [self synchronize];
    }
    
    
    
    
    
//    PFObject *player = [PFObject objectWithClassName:@"Player"];
//    player[@"name"] = player;
//    player[@"score"] = playerScore;
//    [player saveEventually];
    
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