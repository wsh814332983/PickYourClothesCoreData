//
//  PickYourClothesCoreDataTableViewCell.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/6/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "PickYourClothesCoreDataTableViewCell.h"

@implementation PickYourClothesCoreDataTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
<<<<<<< HEAD
    _image.layer.cornerRadius=20;
    
=======
    _imageback.layer.cornerRadius=20;
    _imageback.layer.borderWidth=5;
    _imageback.layer.masksToBounds=YES;
    _imageback.layer.borderColor=(__bridge CGColorRef)([UIColor grayColor]);
    _image.frame=_imageback.frame;
    _start=[self startview:0];
    [self.rate addSubview:_start];
>>>>>>> FETCH_HEAD
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    _image.layer.cornerRadius=8;
}
<<<<<<< HEAD

=======
-(TQStarRatingView *) startview:(int) rate
{
    TQStarRatingView *starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(0, 0, self.rate.frame.size.width,self.rate.frame.size.height)numberOfStar:5];
    [starRatingView setScore:rate withAnimation:NO];
    
    starRatingView.userInteractionEnabled=NO;
    
    return starRatingView;

}
>>>>>>> FETCH_HEAD
@end
