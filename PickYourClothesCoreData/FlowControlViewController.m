//
//  FlowControlViewController.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/18/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "FlowControlViewController.h"
#import "Clothes.h"
<<<<<<< HEAD
#import "UIButton+Bootstrap.h"
@interface FlowControlViewController ()
@property (strong,nonatomic) NSMutableArray *clothset;
=======
@interface FlowControlViewController ()

>>>>>>> FETCH_HEAD
@end

@implementation FlowControlViewController

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
<<<<<<< HEAD
    [self.buttonsetting infoStyle];
    [self.buttonsetting addAwesomeIcon:FAIconBriefcase beforeTitle:YES];
=======
    
>>>>>>> FETCH_HEAD
    
    [_segments addTarget:self action:@selector(changeStyle:) forControlEvents:UIControlEventValueChanged];
    _buttonsetting.layer.cornerRadius=5;
    _buttonsetting.layer.borderWidth=10;
    _buttonsetting.layer.borderColor=(__bridge CGColorRef)([UIColor blueColor]);
    
    _images=[[NSMutableArray alloc] init];
    for (int i=0; i<[self.imagesscroll count]; i++) {
        Clothes *cloth=self.imagesscroll[i];
        [_images addObject:[UIImage imageWithData:cloth.image]];
    }

    self.scrollView.clothes=(NSMutableArray *)self.imagesscroll;
   [self.scrollView setScrollViews:self.images];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeStyle:(id)sender {
<<<<<<< HEAD
=======
    NSLog(@"%ld",(long)_segments.selectedSegmentIndex);
>>>>>>> FETCH_HEAD
    switch (_segments.selectedSegmentIndex) {
        case 0:
            self.scrollView.whetherPick=NO;
            [self.scrollView setScrollViews:self.images];
            [self.scrollView awakeFromNib];
            break;
            
        case 1:
            self.scrollView.whetherPick=YES;
<<<<<<< HEAD
            [self roolback];
=======
>>>>>>> FETCH_HEAD
            [self drawpicked];
            [self.scrollView awakeFromNib];
            
            break;
    }
}
<<<<<<< HEAD
-(void) roolback
{
    if ([kAppDelegate.managedObjectContext hasChanges]) {
        [kAppDelegate.managedObjectContext rollback];
        
    }
}
-(void) drawpicked {
    
    _clothset=[[NSMutableArray alloc] init];
    self.scrollView.lastclothes=[[NSMutableArray alloc] init];
    for (int i=0; i<[self.imagesscroll count]; i++) {
        Clothes *cloth=[self.imagesscroll objectAtIndex:i];
        int j;
        j=[cloth.useTime intValue];
        if (j>3) {
            [self.scrollView.lastclothes addObject:cloth];
            [_clothset addObject:[UIImage imageWithData:cloth.image]];
=======
-(void) drawpicked {
    
    NSMutableArray *clothset=[[NSMutableArray alloc] init];
    self.scrollView.lastclothes=[[NSMutableArray alloc] init];
    for (int i=0; i<[self.imagesscroll count]; i++) {
        Clothes *cloth=[self.imagesscroll objectAtIndex:i];
        if (cloth.onUse.boolValue) {
            [self.scrollView.lastclothes addObject:cloth];
            [clothset addObject:[UIImage imageWithData:cloth.image]];
>>>>>>> FETCH_HEAD
        }
        
    }
    
<<<<<<< HEAD
    [self.scrollView setScrollViews:_clothset];
=======
    [self.scrollView setScrollViews:clothset];
>>>>>>> FETCH_HEAD
   
}

- (IBAction)more:(id)sender {
    if (!self.scrollView.whetherPick) {
        UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"Hey,it is a nice cloth!" delegate:self cancelButtonTitle:@"Back" destructiveButtonTitle:nil otherButtonTitles:@"I want to wear it!", @"Nope!",nil];
        [sheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
        [sheet showInView:self.view];
    }else {
<<<<<<< HEAD
        UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"It is clean now!" delegate:self cancelButtonTitle:@"Back" destructiveButtonTitle:nil otherButtonTitles:@"YES",@"Cancel!", nil];
=======
        UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"It is not suitable for today" delegate:self cancelButtonTitle:@"Back" destructiveButtonTitle:nil otherButtonTitles:@"YES",@"Cancel!", nil];
>>>>>>> FETCH_HEAD
        [sheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
        [sheet showInView:self.view];
    }
   
   
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self savecloth];
            if (self.scrollView.whetherPick) {
                [self drawpicked];
                [self.scrollView awakeFromNib];
            }
<<<<<<< HEAD
           [self performSegueWithIdentifier:@"backtoflowpicview" sender:self];
            break;
            
        case 1:
            if ([kAppDelegate.managedObjectContext hasChanges]) {
                [kAppDelegate.managedObjectContext rollback];
                
            }
             [self.scrollView awakeFromNib];
            break;
        case 2:
            [self roolback];
=======
           
            break;
            
        case 1:
            
            break;
        case 2:
>>>>>>> FETCH_HEAD
            [self performSegueWithIdentifier:@"backtoflowpicview" sender:self];
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
