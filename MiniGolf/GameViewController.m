//
//  GameViewController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 3/14/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "GameViewController.h"
#import "AddCourseViewController.h"
#import "PlayerController.h"
#import <KVNMaskedPageControl.h>
#import "ChoosePlayerViewController.h"
#import "SelectedPlayerTableViewCell.h"


#define PAGES_NUMBER course.hole.doubleValue

@interface GameViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, KVNMaskedPageControlDataSource>


@property (nonatomic, assign) NSInteger holePageNumber;
@property (nonatomic, strong) UILabel * courseName;
@property (nonatomic, strong) UITableView * gamePlayersTableView;
@property (nonatomic, strong) UILabel * pageNumber;
@property (nonatomic, strong) NSArray * gamePlayers;
@property (nonatomic, strong) Course *course;

@end

@implementation GameViewController
@synthesize scrollView=scrollView_;
@synthesize pageControl=pageControl_;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.course = [[CourseController sharedInstance].fetchedResultsController.fetchedObjects objectAtIndex:self.courseIndex];

    CGRect scrollViewFrame = CGRectMake(0, -80, self.view.frame.size.width, self.view.frame.size.height);
    self.scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];

    UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(150, 150, 50, 21)];
    [label setText:@"Damn"];
    [self.scrollView addSubview:label];
    
    self.gamePlayersTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 200, 350, 300)];
    self.gamePlayersTableView.dataSource = self;
    self.gamePlayersTableView.delegate= self;
    [self.view addSubview:self.gamePlayersTableView];
    
    self.pageNumber = [[UILabel alloc] initWithFrame:CGRectMake(300, 70, 200, 30)];
    self.holePageNumber = self.pageControl.currentPage +1;
    self.pageNumber.text = [NSString stringWithFormat:@"Hole %ld", (long)self.holePageNumber];
   [self.view addSubview: self.pageNumber];
    
    self.courseName = [[UILabel alloc] initWithFrame: CGRectMake(20, 70, 200, 30)];
    self.courseName.text = self.course.course;
    [self.view addSubview: self.courseName];
    
    [self.view bringSubviewToFront: self.pageControl];
    
    [self.scrollView setPagingEnabled:YES];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.frame = CGRectMake(0, 550, self.view.frame.size.width, 100);
    self.pageControl.numberOfPages = self.course.hole.doubleValue;
    self.pageControl.currentPage = 0;
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.pageControl];
    
    CGSize scrollViewContentSize = CGSizeMake(self.pageControl.numberOfPages * self.view.frame.size.width, 404);
    [self.scrollView setContentSize:scrollViewContentSize];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    static NSInteger previousPage = 0;
    CGFloat pageWidth = self.scrollView.frame.size.width;
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
    
    if (previousPage != page) {
        previousPage = page;
    
        if (self.gamePlayersTableView == nil) {
            self.gamePlayersTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.pageControl.currentPage * 375, 200, 350, 300)];
            
        }
        
        self.holePageNumber = self.pageControl.currentPage +1;
        self.pageNumber.text = [NSString stringWithFormat:@"Hole %ld", (long)self.holePageNumber];
        
        UILabel * testLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(500, 200, 100, 30)];
        testLabelTwo.text = @"tested";
        [self.pageControl addSubview:testLabelTwo];
        
    }
    
    if (self.pageControl.currentPage == 1) {
        UILabel * testLabel = [[UILabel alloc] initWithFrame:CGRectMake(500, 200, 100, 30)];
        testLabel.text = @"test";
        [self.pageControl addSubview:testLabel];
        
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[PlayerController sharedInstance] playersForCourse:self.course].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectedPlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell One"];
    if (!cell) {
        cell = [[SelectedPlayerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell One"];
    }
    
    Player *player = [[PlayerController sharedInstance] playersForCourse:self.course][indexPath.row];
    cell.textLabel.text = player.name;
    return cell;
    
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
