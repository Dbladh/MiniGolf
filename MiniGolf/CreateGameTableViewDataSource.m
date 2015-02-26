//
//  CreateGameTableViewDataSource.m
//  MiniGolf
//
//  Created by Daniel Bladh on 2/25/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "CreateGameTableViewDataSource.h"

@implementation CreateGameTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
//    Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
//    cell.textLabel.text = entry.title;
    
    return cell;
}



@end
