//
//  AddCourseViewController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 2/21/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "AddCourseViewController.h"
#import "PKYStepper.h"
#import "CreateGameViewController.h"
#import "CreateGameTableViewDataSource.h"
#import "CourseCustomTableViewCell.h"



@interface AddCourseViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITextField * courseNameTextField;
@property (nonatomic, strong) UITableView * holesNumberTableView;
@property (nonatomic, strong) PKYStepper * holesNumberStepper;
@property (nonatomic, strong) UIBarButtonItem * saveCourseButton;
@property (nonatomic, strong) UILabel * holesNumber;
@property (nonatomic, strong) UIStepper * holesStepper;

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
    
    self.holesStepper = [[UIStepper alloc] initWithFrame: CGRectMake(100, 250, 100, 100)];
    self.holesStepper.value = 1;
    self.holesStepper.minimumValue = 1;
    self.holesStepper.maximumValue = 18;
    [self.holesStepper addTarget:self action:@selector(stepperChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.holesStepper];
    
    self.holesNumberTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 300, 350, 350)];
    [self.view addSubview:self.holesNumberTableView];
    self.holesNumberTableView.dataSource = self;
    self.holesNumberTableView.delegate = self;
    
    self.holesNumber = [[UILabel alloc] initWithFrame:CGRectMake(215, 190, 150, 150)];
    self.holesNumber.textColor = [UIColor blackColor];
    self.holesNumber.text = [NSString stringWithFormat:@"Holes: %.f", self.holesStepper.value];
    [self.view addSubview: self.holesNumber];
    
    self.saveCourseButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    self.saveCourseButton.title = @"Save";
    self.saveCourseButton.style = UIBarButtonSystemItemSave;
    self.navigationItem.rightBarButtonItem = self.saveCourseButton;
}

-(void)stepperChanged:(id)sender{
    self.holesNumber.text = [NSString stringWithFormat:@"Holes: %.f", self.holesStepper.value];
    [self.holesNumberTableView reloadData];
}

-(void)save:(id)sender{
    
    if (!self.thisCourse){
        
        [[CourseController sharedInstance] addCourseWithTitle:self.courseNameTextField.text andText:self.holesNumber.text];
    }else{
        self.thisCourse.course = self.courseNameTextField.text;
        self.thisCourse.hole = self.holesNumber.text;
    
    }

    [[CourseController sharedInstance] synchronize];
    
    CreateGameViewController * createGameViewController = [CreateGameViewController new];
    [createGameViewController.chooseCourseTableView reloadData];
    

    //CreateGameViewController * createGameViewController = [CreateGameViewController new];
    [self.navigationController popToViewController: [self.navigationController.viewControllers objectAtIndex:0] animated:YES];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CourseCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell One"];
    if (!cell){
        cell = [CourseCustomTableViewCell new];
    }
    
    cell.textLabel.text =[NSString stringWithFormat: @"Hole %ld", (long)indexPath.row +1];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return self.holesStepper.value;
    
    

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
