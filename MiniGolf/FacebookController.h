//
//  FacebookController.h
//  MiniGolf
//
//  Created by Daniel Bladh on 2/24/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface FacebookController : NSObject

-(void)facebookLoginView:(MainViewController *)mainViewController;

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView
               andViewController:(MainViewController *)mainViewController
                            user:(id<FBGraphUser>)user;

@end
