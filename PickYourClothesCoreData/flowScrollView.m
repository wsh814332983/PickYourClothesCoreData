//
//  flowScrollView.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/18/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "flowScrollView.h"

#define kVerticalCheckmarkInset -25.0
#define kHorizontalCheckmarkInset -4.0
#define kImageSpacing 5.0

@interface flowScrollView()<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *selectedIndexes;
@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) NSMutableArray *checkmarkImageViews;
@property (nonatomic, strong) NSMutableArray *superviewConstraints;
@property UIPageControl *page;
<<<<<<< HEAD
=======
@property NSInteger count;
@property NSNumber *originalUsetime;
@property NSDate *originalSelectTime;

>>>>>>> FETCH_HEAD
@end

@implementation flowScrollView

-(id) init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;

}
-(void)awakeFromNib
{
    [self setup];
}
-(void) setup
{
    self.translatesAutoresizingMaskIntoConstraints=NO;
    self.showsHorizontalScrollIndicator=NO;
    self.superviewConstraints=[NSMutableArray array];
    
}
-(void) setScrollViews:(NSArray *)images
{
    for(UIImageView *image in self.imageViews)
    {
        [image removeFromSuperview];
    }
    for(UIImageView *image in self.checkmarkImageViews)
    {
        [image removeFromSuperview];
    }
    self.selectedIndexes = [NSMutableArray array];
    self.imageViews = [NSMutableArray array];
    self.checkmarkImageViews = [NSMutableArray array];
    
    
    self.pagingEnabled=YES;
    self.tag=1;
    [self setCanCancelContentTouches:YES];
     self.scrollEnabled=YES;
    self.showsHorizontalScrollIndicator=NO;
    self.clipsToBounds=YES;
    self.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    _page.alpha=0;
    
    
    for (UIImage *image in images) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.userInteractionEnabled = YES;
        imageView.backgroundColor =[UIColor magentaColor];
        
        [self.imageViews addObject:imageView];
        
        UIImage *emptyCheckmark = [UIImage imageNamed:@"unchecked.png"];
        UIImageView *checkmarkView = [[UIImageView alloc] initWithImage:emptyCheckmark];
        checkmarkView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview:checkmarkView];
        [self addSubview:imageView];
        [self.checkmarkImageViews addObject:checkmarkView];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)];
        [imageView addGestureRecognizer:tap];
    }
    
    
    _page=[[UIPageControl alloc] init];
    _page.currentPage=0;
    _page.numberOfPages=[_imageViews count];
    [self addSubview:_page];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
  
}
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView.tag==1)
    {
        NSInteger index = fabs(self.contentOffset.x) / self.frame.size.width;
        //NSLog(@"%d",index);
        [_page setCurrentPage:index];
        
    }
}
- (void)imageViewTapped:(UITapGestureRecognizer *)sender;
{
    NSUInteger index = [self.imageViews indexOfObject:[sender view]];
    NSNumber *path = @(index);
<<<<<<< HEAD
    
=======
    //    Clothes *cloth1=[_lastclothes objectAtIndex:index];
    //    Clothes *cloth2=[_clothes objectAtIndex:index];
    //    if(_count==0){
    //        _originalUsetime =cloth1.useTime;
    //        _originalSelectTime = cloth1.selectTime;
    //    }
>>>>>>> FETCH_HEAD
    if ([self.selectedIndexes containsObject:path]) {
        [self.selectedIndexes removeObject:path];
        
        UIImage *emptyCheckmark = [UIImage imageNamed:@"unchecked.png"];
        UIImageView *checkmarkView = [self.checkmarkImageViews objectAtIndex:index];
        
        if (_whetherPick) {
<<<<<<< HEAD
            Clothes *cloth=[_lastclothes objectAtIndex:index];
            NSLog(@"cloth%lu",(unsigned long)[_lastclothes count]);
            cloth.onUse=[NSNumber numberWithBool:YES];
        }else{
            Clothes *cloth=[_clothes objectAtIndex:index];
            NSLog(@"clothlast%lu",(unsigned long)_lastclothes.count);
            cloth.onUse=[NSNumber numberWithBool:NO];
=======
            Clothes *cloth1=[_lastclothes objectAtIndex:index];
            cloth1.useTime=_originalUsetime;
            _count++;
        }else{
            Clothes *cloth2=[_clothes objectAtIndex:index];
            cloth2.useTime=_originalUsetime;
            cloth2.selectTime=_originalSelectTime;
            _count++;
>>>>>>> FETCH_HEAD
        }
        [checkmarkView setImage:emptyCheckmark];
        checkmarkView.alpha=0;
        [self bringSubviewToFront:checkmarkView];
    } else {
        [self.selectedIndexes addObject:path];
        
        UIImage *fullCheckmark = [UIImage imageNamed:@"checked.png"];
        UIImageView *checkmarkView = [self.checkmarkImageViews objectAtIndex:index];
        
        NSLog(@"index%lu",(unsigned long)index);
        if (_whetherPick) {
<<<<<<< HEAD
            Clothes *cloth=[_lastclothes objectAtIndex:index];
            cloth.onUse=[NSNumber numberWithBool:NO];
            
        }else{
            Clothes *cloth=[_clothes objectAtIndex:index];
            cloth.onUse=[NSNumber numberWithBool:YES];
=======
            Clothes *cloth1=[_lastclothes objectAtIndex:index];
            if(_count==0){
                _originalUsetime =cloth1.useTime;
            }
            cloth1.useTime=[NSNumber numberWithInt:0];
            _count++;
            NSLog(@"usetime is %i",[cloth1.useTime intValue]);
        }else{
            Clothes *cloth2=[_clothes objectAtIndex:index];
            if(_count==0){
                _originalUsetime =cloth2.useTime;
                _originalSelectTime = cloth2.selectTime;
            }
            cloth2.useTime=[NSNumber numberWithInt:1+[_originalUsetime intValue]];
            cloth2.selectTime=[NSDate date];
            _count++;
>>>>>>> FETCH_HEAD
        }
        
        [checkmarkView setImage:fullCheckmark];
        checkmarkView.alpha=1;
        [self bringSubviewToFront:checkmarkView];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectionDidUpdateForPicker:)]) {
        [self.delegate selectionDidUpdateForPicker:self];
    }
<<<<<<< HEAD
    
    
=======
>>>>>>> FETCH_HEAD
    CATransition *tran=[CATransition animation];
    NSTimeInterval inter=1.5;
    tran.duration=inter;
    tran.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    tran.type=@"rippleEffect";
    tran.subtype=kCATransitionFromLeft;
    tran.delegate=self;
    [self.layer addAnimation:tran forKey:nil];
<<<<<<< HEAD
    
=======
>>>>>>> FETCH_HEAD
}
- (NSArray *)selectedImageIndexes;
{
    return [_selectedIndexes copy];
}

- (void)updateConstraints
{
    [super updateConstraints];
    
    // Reset
    [self removeConstraints:self.constraints];
    [self.superview removeConstraints:self.superviewConstraints];
    [self.superviewConstraints removeAllObjects];
    
    
    
    if (self.imageViews.count <= 0) {
        return;
    }
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViews[0]
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1.0
                                                      constant:0]];
    
    
    UIImageView *previousView = nil;
    for (UIImageView *subview in self.imageViews) {
        
        
                CGFloat aspectRatio = subview.intrinsicContentSize.height/subview.intrinsicContentSize.width;
        [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:subview
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:aspectRatio
                                                          constant:0]];
        
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
        
        
        
        
//               [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
//                                                         attribute:NSLayoutAttributeHeight
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:self
//                                                         attribute:NSLayoutAttributeHeight
//                                                        multiplier:0.98
//                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0
                                                          constant:0]];
        
        
               if (previousView) {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                             attribute:NSLayoutAttributeLeading
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:previousView
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:0]];
        }
        
        previousView = subview;
    }
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViews[self.imageViews.count - 1]
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:-kImageSpacing]];
    
    
    
    
    //for mark;
    NSUInteger i = 0;
    for (UIImageView *checkmarkView in self.checkmarkImageViews) {
        
        UIImageView *matchingImageView = [self.imageViews objectAtIndex:i];
        
       
        [self addConstraint:[NSLayoutConstraint constraintWithItem:checkmarkView
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:matchingImageView
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:kVerticalCheckmarkInset]];
        
       
        NSLayoutConstraint *floatingConstraintSlideToLeft =
        [NSLayoutConstraint constraintWithItem:checkmarkView
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                        toItem:self.superview
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:kHorizontalCheckmarkInset];
        floatingConstraintSlideToLeft.priority = 450;
        [self.superview addConstraint:floatingConstraintSlideToLeft];
        [self.superviewConstraints addObject:floatingConstraintSlideToLeft];
        
        
        NSLayoutConstraint *floatingConstraintStickToRightEdge =
        [NSLayoutConstraint constraintWithItem:checkmarkView
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                        toItem:self.superview
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:kHorizontalCheckmarkInset];
        floatingConstraintStickToRightEdge.priority = 350;
        [self.superview addConstraint:floatingConstraintStickToRightEdge];
        [self.superviewConstraints addObject:floatingConstraintStickToRightEdge];
        
      
               NSLayoutConstraint *floatingBoundsConstraintLeft =
        [NSLayoutConstraint constraintWithItem:checkmarkView
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                        toItem:matchingImageView
                                     attribute:NSLayoutAttributeLeading
                                    multiplier:1.0
                                      constant:-kHorizontalCheckmarkInset];
        floatingBoundsConstraintLeft.priority = 1000;
        [self addConstraint:floatingBoundsConstraintLeft];
        
        NSLayoutConstraint *floatingBoundsConstraintRight =
        [NSLayoutConstraint constraintWithItem:checkmarkView
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                        toItem:matchingImageView
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:kHorizontalCheckmarkInset];
        floatingBoundsConstraintRight.priority = 1000;
        [self addConstraint:floatingBoundsConstraintRight];
        
        i++;
    }
}

@end
