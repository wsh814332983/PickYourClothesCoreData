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
<<<<<<< HEAD
@class HJScrollView;
@interface PickYourClothesViewController : UIViewController<NSFetchedResultsControllerDelegate,UIScrollViewDelegate>{
    UIPageControl *pageControl;
    HJScrollView *scrollView;
}
=======
@interface PickYourClothesViewController : UIViewController<NSFetchedResultsControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *showRecent1;
@property (strong, nonatomic) IBOutlet UIButton *showRecent2;
>>>>>>> FETCH_HEAD
@property (strong, nonatomic) IBOutlet UICombox *gooutPurpose;
@property (strong, nonatomic) IBOutlet UIButton *start;
@property (nonatomic) MainFunctionViewController *mainfunctioncontroller;
- (IBAction)startPick:(id)sender;
<<<<<<< HEAD


=======
- (IBAction)chooseRecent:(id)sender;
- (IBAction)chooseRecent2:(id)sender;
>>>>>>> FETCH_HEAD
@end
