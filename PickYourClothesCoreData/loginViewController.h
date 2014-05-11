//
//  loginViewController.h
//  login
//
//  Created by tianxiang zhang on 5/4/14.
//  Copyright (c) 2014 tianxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface loginViewController : UIViewController<NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *newuser;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (strong,nonatomic) NSString *path;
- (IBAction)login:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *userId;
@property (weak, nonatomic) IBOutlet UILabel *passwordId;
@property (weak, nonatomic) IBOutlet UILabel *keepInfod;

@property (weak, nonatomic) IBOutlet UISegmentedControl *keepInfor;
@property (weak, nonatomic) IBOutlet UIView *imageback;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
<<<<<<< HEAD
=======

>>>>>>> FETCH_HEAD
@end
