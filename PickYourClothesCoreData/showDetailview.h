//
//  showDetailview.h
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/19/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>
#import "Clothes.h"
@protocol showDetailDelegate

-(void) setwear:(BOOL) select;

@end
@interface showDetailview : UIView

@property (strong,nonatomic) UIImage *image;
@property  BOOL wear;
@property (strong,nonatomic) Clothes *cloth;
@property (weak,nonatomic) id<showDetailDelegate> delegate;
-(void) setImage:(UIImage *)image;
@end
