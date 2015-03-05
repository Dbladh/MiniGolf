//
//  ViewController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 2/21/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "MainViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "FacebookController.h"


@interface MainViewController () <FBLoginViewDelegate>



@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BackGroundImage"]];
    self.backgroundImageView.frame = self.view.frame;
    [self.view addSubview: self.backgroundImageView];
    
    FacebookController * facebookController = [FacebookController new];
    [facebookController facebookLoginView:self];
    //[facebookController loginViewFetchedUserInfo: andViewController:self user:];
    
    
}

- (void)didReceiveMemoryWarning { 
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
