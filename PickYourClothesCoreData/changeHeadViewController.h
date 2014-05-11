//
//  changeHeadViewController.h
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 5/6/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
@interface changeHeadViewController : UIViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UIButton *changebutton;
- (IBAction)button:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *imageback;
- (IBAction)changeImage:(id)sender;
@property BOOL newMedia;
@property (weak, nonatomic) IBOutlet UIButton *savebutton;


@property (weak, nonatomic) IBOutlet UIButton *cancel;



- (IBAction)cancel:(id)sender;
- (IBAction)change:(id)sender;

- (IBAction)save:(id)sender;


@end
