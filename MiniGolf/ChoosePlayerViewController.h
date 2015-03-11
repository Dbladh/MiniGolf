//
//  ChoosePlayerViewController.h
//  MiniGolf
//
//  Created by Daniel Bladh on 3/7/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ChoosePlayerViewController : UIViewController <FBFriendPickerDelegate>

- (void)pickFriendsButtonClick:(id)sender;

@end
