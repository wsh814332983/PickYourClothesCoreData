//
//  FlowControlViewController.h
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/18/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "flowScrollView.h"
#import <QuartzCore/QuartzCore.h>
@interface FlowControlViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet flowScrollView *scrollView;

@property (strong,nonatomic) NSArray *imagesscroll;
@property (strong,nonatomic) NSIndexPath *index;
@property (weak, nonatomic) IBOutlet UIButton *buttonsetting;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segments;

- (IBAction)more:(id)sender;
@property (strong,nonatomic) NSMutableArray *images;
@end
