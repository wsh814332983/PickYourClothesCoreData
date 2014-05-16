//
//  showDetailview.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/19/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "showDetailview.h"

@interface showDetailview()
@property (strong,nonatomic) UIImageView *checkmarkView;
@end

@implementation showDetailview

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void) awakeFromNib
{
    [super awakeFromNib];
    
<<<<<<< HEAD
    
    _wear=_cloth.onUse.boolValue;
    _image=[UIImage imageWithData:_cloth.image];
    UIImageView *view=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0,self.frame.size.width,self.frame.size.height-50)];
    NSLog(@"height is %f",self.frame.size.height);
=======
    NSLog(@"ww");
    
    _wear=_cloth.onUse.boolValue;
    _image=[UIImage imageWithData:_cloth.image];
    UIImageView *view=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0,self.frame.size.width,self.frame.size.height)];
>>>>>>> FETCH_HEAD
    view.image=self.image;
    view.layer.cornerRadius=10;
    view.layer.masksToBounds=YES;
    UIImage *emptyCheckmark;
    if (_wear) {
       emptyCheckmark = [UIImage imageNamed:@"checked.png"];
        [self.delegate setwear:YES];
    }else {
       emptyCheckmark = [UIImage imageNamed:@"unchecked.png"];
        [self.delegate setwear:NO];
    }
    
<<<<<<< HEAD
    _checkmarkView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-emptyCheckmark.size.width-10, self.frame.size.height-emptyCheckmark.size.height-60, emptyCheckmark.size.width, emptyCheckmark.size.height)];
=======
    _checkmarkView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-emptyCheckmark.size.width-10, self.frame.size.height-emptyCheckmark.size.height-10, emptyCheckmark.size.width, emptyCheckmark.size.height)];
>>>>>>> FETCH_HEAD
    _checkmarkView.image=emptyCheckmark;
    _checkmarkView.translatesAutoresizingMaskIntoConstraints = NO;
    
   // UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)];
    
    
    //[self addGestureRecognizer:tap];
    
   
   
    [self addSubview:view];
<<<<<<< HEAD
    //[self addSubview:_checkmarkView];
    
}


=======
    [self addSubview:_checkmarkView];
    
}

//- (void)imageViewTapped:(UITapGestureRecognizer *)sender
//{
//    if (_wear) {
//        _wear=NO;
//       UIImage *emptyCheckmark = [UIImage imageNamed:@"unchecked.png"];
//        NSLog(@"uncheck");
//       _cloth.onUse=[NSNumber numberWithBool:NO];
//        _checkmarkView.image=emptyCheckmark;
//        
//        
//    }else{
//        _wear=YES;
//        UIImage *emptyCheckmark = [UIImage imageNamed:@"checked.png"];
//        _cloth.onUse=[NSNumber numberWithBool:YES];
//        _cloth.name=@"change";
//        _checkmarkView.image=emptyCheckmark;
//    }
//    //[self savecloth];
//}
>>>>>>> FETCH_HEAD
-(void) savecloth {
    NSManagedObjectContext *context=kAppDelegate.managedObjectContext;
    NSError *error=nil;
    [context save:&error];
}
-(void) setImage:(UIImage *)image
{
    _image=image;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
