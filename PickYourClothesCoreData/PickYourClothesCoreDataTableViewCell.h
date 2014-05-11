//
//  PickYourClothesCoreDataTableViewCell.h
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/6/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD

@interface PickYourClothesCoreDataTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *describe;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *image;

=======
#import <QuartzCore/QuartzCore.h>
#import "TQStarRatingView.h"
@interface PickYourClothesCoreDataTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *addTime;
@property (weak, nonatomic) IBOutlet UIView *rate;
@property (weak, nonatomic) IBOutlet UIView *imageback;
@property (weak, nonatomic) IBOutlet UIView *useMark;
@property (weak, nonatomic) IBOutlet UIImageView *landryimage;
@property (weak,nonatomic) TQStarRatingView *start;
>>>>>>> FETCH_HEAD
@end
