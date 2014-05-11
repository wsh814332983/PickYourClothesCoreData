//
//  WaterFCell.h
//  CollectionView
//
//  Created by d2space on 14-2-26.
//  Copyright (c) 2014年 D2space. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Clothes.h"
@protocol WaterFCellDelegate

-(void) drawdetailpic:(Clothes *) cloth;
@end

@interface WaterFCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UITextView* textView;
@property BOOL selescted;
@property (nonatomic,strong) Clothes *cloth;
@property (nonatomic,weak) id<WaterFCellDelegate> delegate;
//- (void)configureCellWithIndexPath:(NSIndexPath *)indexPath;

@end
