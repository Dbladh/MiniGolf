//
//  AddCourseViewController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 2/21/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "AddCourseViewController.h"
#import "PKYStepper.h"

@interface AddCourseViewController ()

@property (nonatomic, strong) UITextField * courseNameTextField;
@property (nonatomic, strong) UITableView * holesNumberTableView;
@property (nonatomic, strong) PKYStepper * holesNumberStepper;



@end

@implementation AddCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Add a Course";
    
    self.courseNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 130, 200, 30)];
    self.courseNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.courseNameTextField];
        
    float width = 260.0f;
    float x = ([UIScreen mainScreen].bounds.size.width - width) / 2.0;
        
    self.holesNumberStepper = [[PKYStepper alloc] initWithFrame:CGRectMake(x, 220, width, 44)];
    self.holesNumberStepper.valueChangedCallback = ^(PKYStepper *stepper, float count) {
        stepper.countLabel.text = [NSString stringWithFormat:@"Holes: %@", @(count)];
        };
    
    self.holesNumberStepper.value = 1;
    self.holesNumberStepper.minimum = 1;
    self.holesNumberStepper.maximum = 18;
    
    [self.holesNumberStepper setup];
    [self.view addSubview:self.holesNumberStepper];

    
    self.holesNumberTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 300, 350, 350)];
    [self.view addSubview:self.holesNumberTableView];
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
