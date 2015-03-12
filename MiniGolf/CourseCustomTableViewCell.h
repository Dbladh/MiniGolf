//
//  CourseCustomTableViewCell.h
//  MiniGolf
//
//  Created by Daniel Bladh on 2/28/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseCustomTableViewCell : UITableViewCell

@property (nonatomic, strong) UIStepper *parStepper;
@property (nonatomic, strong) UILabel *parNumber;

@end
