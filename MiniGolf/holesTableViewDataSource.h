//
//  holesTableViewDataSource.h
//  MiniGolf
//
//  Created by Daniel Bladh on 3/10/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "UIKit/UIKit.h"
#import <Foundation/Foundation.h>

@interface holesTableViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)holesNumberTableView;

@end
