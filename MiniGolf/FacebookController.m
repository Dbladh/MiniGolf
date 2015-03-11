//
//  FacebookController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 2/24/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "FacebookController.h"



@interface FacebookController ()

@property (nonatomic, strong) FBLoginView * loginView;
@property (strong, nonatomic) FBProfilePictureView *profilePictureView;

@end
@implementation FacebookController



// Create Login View so that the app will be granted "status_update" permission.

-(void)facebookLoginView:(MainViewController *)mainViewController{
    
    self.loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(80, 80, 100, 100)];
    [mainViewController.view addSubview: self.loginView];
    
    
    
    }

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
               andViewController:(MainViewController *)mainViewController
                            user:(id<FBGraphUser>)user {
    
    self.profilePictureView = [[FBProfilePictureView alloc] initWithFrame:CGRectMake(320, 70, 45, 45)];
    self.profilePictureView.profileID = user.objectID;
    
    [mainViewController.view addSubview: self.profilePictureView];
    
    PFObject *fbUser = [PFObject objectWithClassName:@"FBUser"];
    fbUser[@"User"] = (id<FBGraphUser>)user;
    [fbUser saveInBackground];
    
    }

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    
}


@end
