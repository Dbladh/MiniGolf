//
//  ChoosePlayerViewController.h
//  MiniGolf
//
//  Created by Daniel Bladh on 3/7/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "Stack.h"

@interface ChoosePlayerViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>

@property (nonatomic, assign) NSInteger courseIndex;
@property (nonatomic, strong) NSFetchedResultsController *fetchedPlayerResultsController;

//- (void)pickFriendsButtonClick:(id)sender;

@end
