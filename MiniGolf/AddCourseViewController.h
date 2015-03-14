//
//  AddCourseViewController.h
//  MiniGolf
//
//  Created by Daniel Bladh on 2/21/15.
//  Copyright (c) 2015 Daniel Bladh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "CourseController.h"

@interface AddCourseViewController : UIViewController

@property (nonatomic, strong) Course *thisCourse;
@property (nonatomic, strong) UIStepper * holesStepper;



@end
