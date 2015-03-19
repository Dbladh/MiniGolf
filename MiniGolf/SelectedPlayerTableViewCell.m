//
//  SelectedPlayerTableViewCell.m
//  MiniGolf
//
//  Created by Daniel Bladh on 3/18/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import "SelectedPlayerTableViewCell.h"

@implementation SelectedPlayerTableViewCell


- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell One"];
    self.textLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:20];
    
    return self;
}

-(void)setUpPlayerNameLabel{
    self.playerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    self.playerNameLabel.text = @"Player";
    [self.contentView addSubview: self.playerNameLabel];
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
