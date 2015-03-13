//
//  ChoosePlayerViewController.m
//  MiniGolf
//
//  Created by Daniel Bladh on 3/7/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "ChoosePlayerViewController.h"


@interface ChoosePlayerViewController () <UITableViewDelegate>

@property (nonatomic, strong) ABPeoplePickerNavigationController * peoplePickerNavController;
@property (nonatomic, strong) UIBarButtonItem * addPlayersButton;
@property (nonatomic, strong) NSMutableArray * players;
@property (nonatomic, strong) UITableView * selectedPlayersTableView;

@end

@implementation ChoosePlayerViewController 

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.peoplePickerNavController = [ABPeoplePickerNavigationController new];
    self.peoplePickerNavController.peoplePickerDelegate = self;

    self.addPlayersButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayersButtonPressed:)];
    self.navigationItem.rightBarButtonItem = self.addPlayersButton;
    
    self.selectedPlayersTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,200,self.view.frame.size.width, 300)];
    [self.view addSubview:self.selectedPlayersTableView];
        
}

- (void)addPlayersButtonPressed:(id)sender{
    self.peoplePickerNavController = [ABPeoplePickerNavigationController new];
    [self presentViewController:self.peoplePickerNavController animated:YES completion:nil];
    
    
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person{
   
    [self dismissViewControllerAnimated:YES completion:^{
        NSString* firstName = (__bridge_transfer NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        [self.players addObject:firstName];
    }];
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
