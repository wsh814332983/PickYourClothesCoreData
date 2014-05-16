//
//  WaterFCell.m
//  CollectionView
//
//  Created by d2space on 14-2-26.
//  Copyright (c) 2014年 D2space. All rights reserved.
//

#import "WaterFCell.h"

@implementation WaterFCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        self.contentView.layer.cornerRadius = 5.0;
//        UIImageView *selectdetail=[[UIImageView alloc] initWithFrame:CGRectMake(self.selectedBackgroundView.frame.size.width-23, self.selectedBackgroundView.frame.size.height-23, 20, 20)];
//        UIImage *ima=[UIImage imageNamed:@"checked.png"];
//        selectdetail.image=ima;
//        
//
//        [self.selectedBackgroundView addSubview:selectdetail];
////        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
        
                [self setup];
    }
    return self;
}

#pragma mark - Setup
- (void)setup
{
    [self setupView];
    [self setupTextView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)];
    [self addGestureRecognizer:tap];
    

    
}
- (void)imageViewTapped:(UITapGestureRecognizer *)sender
{
<<<<<<< HEAD
=======
    NSLog(@"22");
>>>>>>> FETCH_HEAD
    [self.delegate drawdetailpic:_cloth];
    
    
}
- (void)setupView
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,0,0)];
    self.imageView.layer.cornerRadius = 5;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 2;
    self.imageView.backgroundColor = [UIColor blueColor];
    
        [self addSubview:self.imageView];
    
         
    
  
}

- (void)setupTextView
{
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,0,0)];
    self.textView.layer.cornerRadius = 5;
    self.textView.layer.masksToBounds = YES;
    self.textView.layer.borderColor = [UIColor grayColor].CGColor;
    self.textView.layer.borderWidth = 1;
    self.textView.textColor = [UIColor blackColor];
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.editable=NO;
    self.textView.selectable=NO;
    self.textView.scrollEnabled=NO;
<<<<<<< HEAD
    
=======
>>>>>>> FETCH_HEAD
    [self addSubview:self.textView];
}

#pragma mark - Configure
- (void)configureCellWithIndexPath:(NSIndexPath *)indexPath
{
    self.textView.text = [NSString stringWithFormat:@"Cell %ld", (long)(indexPath.row + 1)];
}

@end
