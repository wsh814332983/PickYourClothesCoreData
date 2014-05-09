//
//  flowshowdetailViewController.h
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/19/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "showDetailview.h"
#import <QuartzCore/QuartzCore.h>
#import "Clothes.h"
@interface flowshowdetailViewController : UIViewController<UIScrollViewDelegate,UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet showDetailview *detailview;

- (IBAction)selectconfirm:(id)sender;
@property(strong,nonatomic) Clothes *cloth;

@property (weak, nonatomic) IBOutlet UIButton *buttonsetting;

@end
