//
//  PagesScrollViewController.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/26/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "PagesScrollViewController.h"

@interface PagesScrollViewController ()
@property  UIScrollView *scroll;
@end

@implementation PagesScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) buildScrollview:(NSArray *) images
{
    _scroll=[[UIScrollView alloc] init];
    _scroll.pagingEnabled=YES;
    [self.scroll setCanCancelContentTouches:YES];
    _scroll.scrollEnabled=YES;
    _scroll.showsHorizontalScrollIndicator=NO;
    _scroll.clipsToBounds=YES;
    _scroll.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    singleTap.cancelsTouchesInView = NO;
    [_scroll addGestureRecognizer:singleTap];
    
    
}
- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    
    
    
    
    
}
@end
