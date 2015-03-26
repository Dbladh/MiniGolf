//
//  GameViewController.h
//  MiniGolf
//
//  Created by Daniel Bladh on 3/14/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController

@property (nonatomic, assign) NSInteger courseIndex;
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIPageControl * pageControl;

@end
