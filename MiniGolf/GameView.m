//
//  GameView.m
//  MiniGolf
//
//  Created by Daniel Bladh on 3/21/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "GameView.h"

@implementation GameView

-(void)gameView{
    UITableView * scoreTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 200, 300, 350)];
    [self addSubview:scoreTableView];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
