//
//  PickYourClothesViewController.h
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/5/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainFunctionViewController.h"
#import "UICombox.h"
#import "Clothes.h"
@class HJScrollView;
@interface PickYourClothesViewController : UIViewController<NSFetchedResultsControllerDelegate,UIScrollViewDelegate>{
    UIPageControl *pageControl;
    HJScrollView *scrollView;
}
@property (strong, nonatomic) IBOutlet UICombox *gooutPurpose;
@property (strong, nonatomic) IBOutlet UIButton *start;
@property (nonatomic) MainFunctionViewController *mainfunctioncontroller;
- (IBAction)startPick:(id)sender;


@end
