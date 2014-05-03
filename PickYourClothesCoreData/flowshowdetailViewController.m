//
//  flowshowdetailViewController.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/19/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "flowshowdetailViewController.h"
#import "UIImage+ImageEffects.h"
@interface flowshowdetailViewController ()

@end

@implementation flowshowdetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        FlowPicViewController *pic;
//        [pic setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _buttonsetting.layer.cornerRadius=5;
    
    
   
}
//
//    [self.view screenshotMH];
//    [self.navigationController installMHDismissModalViewWithOptions:[[MHDismissModalViewOptions alloc] initWithScrollView:nil
//                                                                                                                    theme:MHModalThemeWhite]];}
-(void) viewWillAppear:(BOOL)animated
{
    
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

- (IBAction)selectconfirm:(id)sender {
   
    UIActionSheet *select=[[UIActionSheet alloc] initWithTitle:@"good for today?" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:nil otherButtonTitles: @"YES",nil];
    [select setActionSheetStyle:UIActionSheetStyleBlackOpaque];
    [select showInView:self.view];
}
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            _cloth.onUse=[NSNumber numberWithBool:YES];
            [self savecloth];
        [self performSegueWithIdentifier:@"backto" sender:self];
         
            
            NSLog(@"hh");
           
            break;
            
        case 1:
            _cloth.onUse=[NSNumber numberWithBool:NO];
            [self savecloth];
            [self performSegueWithIdentifier:@"backto" sender:self];
            break;
    }
}
-(void) savecloth
{
    NSManagedObjectContext *context=kAppDelegate.managedObjectContext;
    NSError *error=nil;
    [context save:&error];
}
@end
