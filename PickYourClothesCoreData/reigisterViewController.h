//
//  reigisterViewController.h
//  login
//
//  Created by tianxiang zhang on 5/4/14.
//  Copyright (c) 2014 tianxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <QuartzCore/QuartzCore.h>
<<<<<<< HEAD
=======
#import "UICombox.h"
>>>>>>> FETCH_HEAD
@interface reigisterViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate,UIGestureRecognizerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *mail;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *password;
<<<<<<< HEAD
=======
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UICombox *gender;
>>>>>>> FETCH_HEAD

@property (weak, nonatomic) IBOutlet UITextField *repassword;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cancel;

@property (weak, nonatomic) IBOutlet UIButton *save;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@property (weak, nonatomic) IBOutlet UIView *viewback;
@end
