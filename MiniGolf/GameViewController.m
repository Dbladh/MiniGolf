//
//  GameViewController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 3/14/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "GameViewController.h"
#import "AddCourseViewController.h"

#define PAGES_NUMBER course.hole.doubleValue

@interface GameViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, assign) NSInteger holePageNumber;
@property (nonatomic, strong) UILabel * courseName;
@property (nonatomic, strong) UITableView * gamePlayersTableView;
@property (nonatomic, strong) UILabel * pageNumber;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    self.scrollView.pagingEnabled = YES;
//    self.scrollView.showsHorizontalScrollIndicator = YES;
//    self.scrollView.delegate = self;
//    self.scrollView.backgroundColor = [UIColor clearColor];
//    self.scrollView.bounces = YES;
//    [self.view addSubview: self.scrollView];
    

    Course *course = [[CourseController sharedInstance].fetchedResultsController.fetchedObjects objectAtIndex:self.courseIndex];
    
    UIPageControl * pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    pageControl.backgroundColor = [UIColor clearColor];
    pageControl.numberOfPages = course.hole.doubleValue;
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    
    [self.view addSubview:pageControl];
    
    self.courseName = [[UILabel alloc] initWithFrame:CGRectMake(130, -10, 200, 200)];
    self.courseName.text = course.course;
    [self.view addSubview:self.courseName];

    NSLog(@"%lu", self.courseIndex);
    
    self.gamePlayersTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 350, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.gamePlayersTableView];
    
    self.pageNumber = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    self.holePageNumber = pageControl.currentPage;
    self.pageNumber.text = [NSString stringWithFormat:@"Hole %ld", (long)self.holePageNumber];
    
    [self.view addSubview: self.pageNumber];

    [self.view bringSubviewToFront: self.scrollView];
    
    
    
    

    

    
    
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





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
