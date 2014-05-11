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
    _imageback.layer.cornerRadius=20;
    _imageback.layer.borderWidth=5;
    _imageback.layer.masksToBounds=YES;
    _imageback.layer.borderColor=(__bridge CGColorRef)([UIColor grayColor]);
    _image.frame=_imageback.frame;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    _image.layer.cornerRadius=8;
}

@end
