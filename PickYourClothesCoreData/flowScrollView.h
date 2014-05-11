//
//  flowScrollView.h
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/18/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Clothes.h"
@class flowScrollView;
@protocol flowScrollViewDelegate <UIScrollViewDelegate>

@optional
- (void)selectionDidUpdateForPicker:(flowScrollView *)picker;


@end


@interface flowScrollView : UIScrollView

@property (strong,nonatomic) NSArray *scrollViews;
@property (weak,nonatomic) id<flowScrollViewDelegate> delegate;
@property (strong,nonatomic) NSMutableArray *clothes;
@property (strong,nonatomic) NSMutableArray *lastclothes;
@property BOOL whetherPick;
-(void) setScrollViews:(NSArray *)images;

@end
