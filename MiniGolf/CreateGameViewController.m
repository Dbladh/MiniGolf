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
#import "CourseCustomTableViewCell.h"
#import "ChoosePlayerViewController.h"
#import "Stack.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface CreateGameViewController () <UITableViewDelegate, UIPopoverControllerDelegate, NSFetchedResultsControllerDelegate>


@property (nonatomic, strong) CreateGameTableViewDataSource * createGameDataSource;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

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
    [[CourseController sharedInstance] configureFetchedResultsController];
    self.createGameDataSource.fetchedResultsController = [CourseController sharedInstance].fetchedResultsController;
    
    [CourseController sharedInstance].fetchedResultsController.delegate = self;
    
}

- (void)add:(id)sender{
    AddCourseViewController * addCourseViewController = [AddCourseViewController new];
    [self.navigationController pushViewController: addCourseViewController animated:YES];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    
    
    [self.chooseCourseTableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    
    
    [self.chooseCourseTableView endUpdates];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", (long)indexPath.row);
    
    ChoosePlayerViewController * choosePlayerViewController = [ChoosePlayerViewController new];
    choosePlayerViewController.courseIndex = indexPath.row;
    [self.navigationController pushViewController:choosePlayerViewController animated:YES];

    
}




#pragma mark - Fetched Results Controller Delegate

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.chooseCourseTableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeMove:
            [self.chooseCourseTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.chooseCourseTableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.chooseCourseTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:
            [self.chooseCourseTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
