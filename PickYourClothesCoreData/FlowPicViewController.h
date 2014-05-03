//
//  FlowPicViewController.h
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/18/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Clothes.h"
#import "WaterF.h"
#import "WaterFCell.h"
#import "showDetailview.h"
@protocol FlowPicDelegate
-(void) setdetailflow :(Clothes *) cloth;
@end

@interface FlowPicViewController : UIViewController<WaterFDelegate,UINavigationControllerDelegate,showDetailDelegate,NSFetchedResultsControllerDelegate>
- (IBAction)pick:(id)sender;

@property (strong,nonatomic) WaterF *collectView;
@property (nonatomic,strong)NSMutableArray *images;

@property (nonatomic,strong)NSMutableArray *text;
@property (nonatomic,strong) NSFetchedResultsController *fetchrequestcontrol;
@property (nonatomic ,strong) NSArray *clo;
@property (nonatomic,strong) Clothes *cloth;
@property (nonatomic,strong) Clothes *editcloth;
@property (strong,nonatomic) NSString *selectcondition;
@property (strong,nonatomic) NSString *select;
@property (strong,nonatomic) NSPredicate *predicate;
@property (weak,nonatomic) id<FlowPicDelegate> delegate;
@end
