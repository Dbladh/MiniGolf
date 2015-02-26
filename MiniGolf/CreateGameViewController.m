//
//  CreateGameViewController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 2/21/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "CreateGameViewController.h"
#import "CreateGameTableViewDataSource.h"
#import "AddCourseViewController.h"

@interface CreateGameViewController () <UITableViewDelegate, UIPopoverControllerDelegate>

@property (nonatomic, strong) UITableView * chooseCourseTableView;
@property (nonatomic, strong) CreateGameTableViewDataSource * createGameDataSource;

@end

@implementation CreateGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Select Course";
    
    self.createGameDataSource = [CreateGameTableViewDataSource new];
    self.chooseCourseTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

    UIBarButtonItem *addCourseButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = addCourseButton;
    
    self.chooseCourseTableView.delegate = self;
    self.chooseCourseTableView.dataSource = self.createGameDataSource;
    
    [self.view addSubview: self.chooseCourseTableView];
    [self.createGameDataSource registerTableView:self.chooseCourseTableView];

}

- (void)add:(id)sender{
    AddCourseViewController * addCourseViewController = [AddCourseViewController new];
    [self.navigationController pushViewController: addCourseViewController animated:YES];
  
    
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
