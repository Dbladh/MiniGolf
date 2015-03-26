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
#import "PlayerController.h"
#import "NewPlayer.h"



@interface ChoosePlayerViewController () <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) ABPeoplePickerNavigationController * peoplePickerNavController;
@property (nonatomic, strong) UIBarButtonItem * addPlayersButton;
@property (nonatomic, strong) UITableView * selectedPlayersTableView;
@property (nonatomic, strong) UIButton * startGameButton;
@property (nonatomic, assign) NSInteger playerRowCount;
@property (nonatomic, strong) NSString * firstName;



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
    
    [[PlayerController sharedInstance] configureFetchedResultsController];
    
    self.fetchedPlayerResultsController = [NSFetchedResultsController new];
    self.fetchedPlayerResultsController.delegate = self;
    
        
}

- (void)addPlayersButtonPressed:(id)sender{
    ABPeoplePickerNavigationController* peoplePickerNavController = [ABPeoplePickerNavigationController new];
    peoplePickerNavController.peoplePickerDelegate = self;
    [self.navigationController presentViewController:peoplePickerNavController animated:YES completion:nil];
    
}

- (void)startGameButtonPressed:(id)sender{
    GameViewController * gameViewController = [GameViewController new];
    gameViewController.courseIndex = self.courseIndex;
    
    [[PlayerController sharedInstance] addPlayers:self.players];
    
    [self.navigationController pushViewController:gameViewController animated:YES];
    
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person{
   
    self.firstName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
    NewPlayer * player = [NewPlayer new];
    player.name = self.firstName;
    [self.players addObject: player];
    
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
    NewPlayer *player = [NewPlayer new];
    player = [self.players objectAtIndex:indexPath.row];
    cell.textLabel.text = player.name;
    return cell;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.players removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.selectedPlayersTableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeMove:
            [self.selectedPlayersTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.selectedPlayersTableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.selectedPlayersTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:
            [self.selectedPlayersTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        default:
            break;
    }
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
