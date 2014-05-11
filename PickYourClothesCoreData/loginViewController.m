//
//  loginViewController.m
//  login
//
//  Created by tianxiang zhang on 5/4/14.
//  Copyright (c) 2014 tianxiang. All rights reserved.
//

#import "loginViewController.h"
#import "UIButton+Bootstrap.h"
#import "People.h"
@interface loginViewController ()
@property (strong,nonatomic) NSArray *userInfo;
@property (strong,nonatomic) People *peo;
@end

@implementation loginViewController

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
    _imageback.layer.cornerRadius=20;
    _imageback.layer.masksToBounds=YES;
    _imageback.layer.borderWidth=2;
    _imageback.layer.borderColor=[[UIColor grayColor] CGColor];
    _imageview.layer.cornerRadius=8;
    _imageview.frame=_imageback.frame;
<<<<<<< HEAD
    [self shadow];
=======

>>>>>>> FETCH_HEAD
    [self.login primaryStyle];
    [self.login addAwesomeIcon:FAIconBriefcase beforeTitle:YES];
    [self.newuser successStyle];
    [self.newuser addAwesomeIcon:FAIconBook beforeTitle:YES];
    _email.text=@"";
    [self takeBrand];
    [self takeImage];

    
}
<<<<<<< HEAD

-(void) viewWillAppear:(BOOL)animated
{  
=======
-(void) viewWillAppear:(BOOL)animated
{
>>>>>>> FETCH_HEAD
    CATransition *trantion=[CATransition animation];
    NSTimeInterval interval=1;
    trantion.duration=interval;
    trantion.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    trantion.type=kCATransitionMoveIn;
    trantion.subtype=kCATransitionFromRight;
    trantion.delegate=self;
    [self.email.layer addAnimation:trantion forKey:nil];
    [self.password.layer addAnimation:trantion forKey:nil];
    
    
    
    trantion.subtype=kCATransitionFromBottom;
    [self.imageback.layer addAnimation:trantion forKey:nil];
    
    CATransition *tran=[CATransition animation];
    NSTimeInterval inter=1;
    tran.duration=inter;
    tran.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    tran.type=kCATransitionMoveIn;
    tran.subtype=kCATransitionFromLeft;
    tran.delegate=self;
    [self.userId.layer addAnimation:tran forKey:nil];
    [self.passwordId.layer addAnimation:tran forKey:nil];
    
    tran.subtype=kCATransitionFromTop;
<<<<<<< HEAD
   
=======
    
>>>>>>> FETCH_HEAD
    [self.keepInfod.layer addAnimation:tran forKey:nil];
    [self.keepInfor.layer addAnimation:tran forKey:nil];
    [self.login.layer addAnimation:tran forKey:nil];
    [self.newuser.layer addAnimation:tran forKey:nil];
    
    
    
}
<<<<<<< HEAD
=======


>>>>>>> FETCH_HEAD
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
<<<<<<< HEAD
-(void) shadow
{
    _email.layer.shadowColor=[[UIColor grayColor] CGColor];
    _email.layer.shadowOffset=CGSizeMake(0, 0);
    _email.layer.shadowOpacity=2;
    _email.layer.shadowRadius=50;
   
   

}
=======

>>>>>>> FETCH_HEAD
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) performfetch
{
    _userInfo=[[NSArray alloc] init];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    NSManagedObjectContext *context=kAppDelegate.managedObjectContext;
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"People" inManagedObjectContext:context];
    [request setEntity:entity];
    NSPredicate *pre=[NSPredicate predicateWithFormat:@"mail = %@",_email.text];
    [request setPredicate:pre];
    NSError *error=nil;
   _userInfo=[context executeFetchRequest:request error:&error];

}
- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue {}

- (IBAction)login:(id)sender {
    [self performfetch];
    BOOL sel=NO;
    if([_userInfo count]!=0){
    for (int i=0; i<[_userInfo count]; i++) {
        People *people=[_userInfo objectAtIndex:i];
        if ([people.password isEqualToString:_password.text]) {
            _peo=people;
            sel=YES;
            [self saveName];
            if (_keepInfor.selectedSegmentIndex==0) {
                [self saveBrand];
                [self saveimage];
            }else{
                [self delebrand];
                [self deleteimage];
            }

            [self performSegueWithIdentifier:@"loginsuccess" sender:self];
            break;
        }
    }
        
       
    }
    if (sel) {
        
    }else{
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Oops" message:@"The E-mail or Password you entered is incorrect" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];

    }
}
#pragma switch
-(void) saveimage
{
    NSString *docsDir;
    NSArray *dirPath;
    dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPath[0];
    NSString *p=nil;
    p=[[NSString alloc] initWithString:[docsDir stringByAppendingString:@"/Image.archve"]];
    
    NSMutableArray *array=[[NSMutableArray alloc] init];
    [array addObject:_peo.image];
    
    [NSKeyedArchiver archiveRootObject:array toFile:p];
}
-(void) deleteimage
{
    NSString *docsDir;
    NSArray *dirPath;
    dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPath[0];
   
    NSString *p=[[NSString alloc] initWithString:[docsDir stringByAppendingString:@"/Image.archve"]];
    UIImage *imgae=[UIImage imageNamed:@"head.png"];
    NSData *data=UIImageJPEGRepresentation(imgae, 1);
    NSMutableArray *array=[[NSMutableArray alloc] init];
    [array addObject:data];
    [NSKeyedArchiver archiveRootObject:array toFile:p];
}
-(void) takeImage
{
    NSFileManager *manage=[NSFileManager defaultManager];
    NSString *docsDir;
    NSArray *dirPath;
    dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPath[0];
    NSString *p=[[NSString alloc] initWithString:[docsDir stringByAppendingString:@"/Image.archve"]];
    if ([manage fileExistsAtPath:p]) {
        NSMutableArray *dataArray=[[NSMutableArray alloc] init];
        dataArray =[NSKeyedUnarchiver unarchiveObjectWithFile:p];
        if (dataArray!=nil) {
            NSData *image=[dataArray objectAtIndex:0];
            _imageview.image=[UIImage imageWithData:image];
        }
    }

}
-(void) takeBrand{
    
    NSFileManager *manage=[NSFileManager defaultManager];
    NSString *docsDir;
    NSArray *dirPath;
    dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPath[0];
    _path=[[NSString alloc] initWithString:[docsDir stringByAppendingString:@"/email.archve"]];
    if ([manage fileExistsAtPath:_path]) {
        NSMutableArray *dataArray=[[NSMutableArray alloc] init];
        dataArray =[NSKeyedUnarchiver unarchiveObjectWithFile:_path];
        if (dataArray!=nil) {
            _email.text=[dataArray objectAtIndex:0];
        }
    }
}
-(void) delebrand
{
    NSString *docsDir;
    NSArray *dirPath;
    dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPath[0];
    _path=[[NSString alloc] initWithString:[docsDir stringByAppendingString:@"/email.archve"]];
    NSString *st=@"";
    NSMutableArray *array=[[NSMutableArray alloc] init];
    [array addObject:st];
    [NSKeyedArchiver archiveRootObject:array toFile:_path];
}
-(void) saveName{
    
    NSString *docsDir;
    NSArray *dirPath;
    dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPath[0];
    NSString *p=nil;
    p=[[NSString alloc] initWithString:[docsDir stringByAppendingString:@"/Username.archve"]];
    
    NSMutableArray *array=[[NSMutableArray alloc] init];
    [array addObject:_peo.mail];
    
    [NSKeyedArchiver archiveRootObject:array toFile:p];
}

-(void) saveBrand{
    
    NSString *docsDir;
    NSArray *dirPath;
    dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPath[0];
    
    _path=[[NSString alloc] initWithString:[docsDir stringByAppendingString:@"/email.archve"]];
    
    NSMutableArray *array=[[NSMutableArray alloc] init];
    [array addObject:_email.text];
    
    [NSKeyedArchiver archiveRootObject:array toFile:_path];
}
//-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@""]) {
//        
//    }
//}
#pragma keyboard
- (IBAction)nameTextField_DidEndOnExit:(id)sender {
    
    [self.password becomeFirstResponder];
}
- (IBAction)passTextField_DidEndOnExit:(id)sender {
   
    [sender resignFirstResponder];
    
    [self.login sendActionsForControlEvents:UIControlEventTouchUpInside];
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[[event allTouches] anyObject];
    if([_email isFirstResponder]&& [touch view]!=_email){
        [_email resignFirstResponder];
    }
    if([_password isFirstResponder]&& [touch view]!=_password){
        [_password resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}




@end
