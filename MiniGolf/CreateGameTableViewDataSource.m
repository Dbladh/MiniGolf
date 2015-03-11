//
//  CreateGameTableViewDataSource.m
//  MiniGolf
//
//  Created by Daniel Bladh on 2/25/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "CreateGameTableViewDataSource.h"
#import "CourseCustomTableViewCell.h"
#import "CourseController.h"
#import "CreateGameViewController.h"

@interface CreateGameTableViewDataSource () <NSFetchedResultsControllerDelegate>

@property (nonatomic, assign)NSInteger rowCount;

@end

@implementation CreateGameTableViewDataSource



- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell One"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.rowCount = self.fetchedResultsController.fetchedObjects.count;
    return self.rowCount;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CourseCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell One"];
    if (!cell){
        cell = [CourseCustomTableViewCell new];
    }
    
    Course *course = self.fetchedResultsController.fetchedObjects[indexPath.row];
    
    cell.textLabel.text = course.course;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray* entryArray = [CourseController sharedInstance].courses;
    Course * course = [entryArray objectAtIndex:indexPath.row];
    [[CourseController sharedInstance]removeEntry:course];
    //[self.tableView reloadData];
    
}










@end
