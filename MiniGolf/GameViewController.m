//
//  GameViewController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 3/14/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "GameViewController.h"
#import "AddCourseViewController.h"

@interface GameViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, assign) NSInteger holePageNumber;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIPageControl * pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    pageControl.backgroundColor = [UIColor redColor];
    Course *course = [[CourseController sharedInstance].courses objectAtIndex:self.courseIndex];
    pageControl.numberOfPages = course.hole;

    [self.view addSubview:pageControl];
    
    NSLog(@"%lu", self.holePageNumber);
    
//    CGRect fullScreenRect=[[UIScreen mainScreen] applicationFrame];
//    self.scrollView=[[UIScrollView alloc] initWithFrame:fullScreenRect];
//    self.scrollView.contentSize=CGSizeMake(320,758);
//    self.scrollView.backgroundColor = [UIColor whiteColor];
//    
//    
//    
//    // do any further configuration to the scroll view
//    // add a view, or views, as a subview of the scroll view.
//    
//    // release scrollView as self.view retains it
//    self.view= self.scrollView;
//    //[self.scrollView release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    self.holePageNumber --;
    return self;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    self.holePageNumber ++;
    return self;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
