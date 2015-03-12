//
//  CourseCustomTableViewCell.m
//  MiniGolf
//
//  Created by Daniel Bladh on 2/28/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "CourseCustomTableViewCell.h"

@implementation CourseCustomTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell One"];
    self.textLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
    
    [self setUpParStepper];
    [self setUpParLabel];
    
    return self;
}

- (void)setUpParLabel {
    self.parNumber = [[UILabel alloc] initWithFrame:CGRectMake(290, 15, 150, 15)];
    self.parNumber.textColor = [UIColor blackColor];
    [self.contentView addSubview: self.parNumber];
}

- (void)setUpParStepper {
    self.parStepper = [[UIStepper alloc] initWithFrame:CGRectMake(185, 10, 100, 100)];
    self.parStepper.value = 3;
    self.parStepper.minimumValue = 1;
    self.parStepper.maximumValue = 5;
    
    [self.contentView addSubview:self.parStepper];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
