//
//  CreateGameTableViewDataSource.h
//  MiniGolf
//
//  Created by Daniel Bladh on 2/25/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateGameTableViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)chooseCourseTableView;

@end
