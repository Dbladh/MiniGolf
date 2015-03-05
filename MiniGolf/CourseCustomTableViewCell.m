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
    self.textLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:75];
    
    
    
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
