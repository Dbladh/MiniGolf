//
//  ChoosePlayerViewController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 3/7/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "ChoosePlayerViewController.h"
#import "GameViewController.h"
#import "SelectedPlayersTableViewDataSource.h"
#import "SelectedPlayerTableViewCell.h"



@interface ChoosePlayerViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ABPeoplePickerNavigationController * peoplePickerNavController;
@property (nonatomic, strong) UIBarButtonItem * addPlayersButton;
@property (nonatomic, strong) NSMutableArray * players;
@property (nonatomic, strong) UITableView * selectedPlayersTableView;
@property (nonatomic, strong) UIButton * startGameButton;
@property (nonatomic, assign) NSInteger playerRowCount;



@end

@implementation ChoosePlayerViewController 

- (void)viewDidLoad {
    
    self.players = [NSMutableArray new];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.addPlayersButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayersButtonPressed:)];
    self.navigationItem.rightBarButtonItem = self.addPlayersButton;
    
    self.selectedPlayersTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,200,self.view.frame.size.width, 300)];
    self.selectedPlayersTableView.dataSource = self;
    [self.view addSubview:self.selectedPlayersTableView];
    
    self.startGameButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 550, 150, 50)];
    [self.startGameButton setTitle:@"StartGame" forState:UIControlStateNormal];
    [self.startGameButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [self.startGameButton addTarget:self action:@selector(startGameButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startGameButton];
    
        
}

- (void)addPlayersButtonPressed:(id)sender{
    ABPeoplePickerNavigationController* peoplePickerNavController = [ABPeoplePickerNavigationController new];
    peoplePickerNavController.peoplePickerDelegate = self;
    [self.navigationController presentViewController:peoplePickerNavController animated:YES completion:nil];
    
}

- (void)startGameButtonPressed:(id)sender{
    GameViewController * gameViewController = [GameViewController new];
    gameViewController.courseIndex = self.courseIndex;
    [self.navigationController pushViewController:gameViewController animated:YES];
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person{
   
    NSString* firstName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
    [self.players addObject:firstName];
    
    [self.selectedPlayersTableView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:^{
        // nothing yet
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.players count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectedPlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell One"];
    if (!cell){
        cell = [SelectedPlayerTableViewCell new];
    }
    cell.textLabel.text = [self.players objectAtIndex:indexPath.row];
    return cell;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
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
