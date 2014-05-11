//
//  changeHeadViewController.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 5/6/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "changeHeadViewController.h"
#import "People.h"
#import "UIButton+Bootstrap.h"
@interface changeHeadViewController ()
@property NSString *mailId;
@property People *peo;
@end

@implementation changeHeadViewController

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
    [self fetchpeople];
    _headImage.image=[UIImage imageWithData:_peo.image];
    _headImage.layer.cornerRadius=10;
    _headImage.layer.borderWidth=2;
    _headImage.layer.borderColor=(__bridge CGColorRef)([UIColor grayColor]);
    _headImage.layer.masksToBounds=YES;
    [self.cancel dangerStyle];
    [self.cancel addAwesomeIcon:FAIconBriefcase beforeTitle:YES];
    [self.changebutton warningStyle];
    [self.changebutton addAwesomeIcon:FAIconAdjust beforeTitle:YES];
    [self.savebutton infoStyle];
     [self.savebutton addAwesomeIcon:FAIconBriefcase beforeTitle:YES];
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

- (IBAction)button:(id)sender {
}
-(void) takePeople{
    
    NSFileManager *manage=[NSFileManager defaultManager];
    NSString *docsDir;
    NSArray *dirPath;
    dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPath[0];
    NSString *p=[[NSString alloc] initWithString:[docsDir stringByAppendingString:@"/Username.archve"]];
    if ([manage fileExistsAtPath:p]) {
        NSMutableArray *dataArray=[[NSMutableArray alloc] init];
        dataArray =[NSKeyedUnarchiver unarchiveObjectWithFile:p];
        if (dataArray!=nil) {
            NSLog(@"%@",[dataArray objectAtIndex:0]);
            _mailId=[dataArray objectAtIndex:0];
        }
    }
}
-(void) fetchpeople
{   [self takePeople];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    NSManagedObjectContext *context=kAppDelegate.managedObjectContext;
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"People" inManagedObjectContext:context];
    [request setEntity:entity];
    NSPredicate *pre=[NSPredicate predicateWithFormat:@"mail =%@",_mailId];
    [request setPredicate:pre];
    NSError *error=nil;
    NSArray *ps= [context executeFetchRequest:request error:&error];
    People *tem=[ps objectAtIndex:0];
    _peo=tem;
}


-(void) save
{   _peo.image=UIImageJPEGRepresentation(_headImage.image,1);
    NSManagedObjectContext *context=kAppDelegate.managedObjectContext;
    NSError *error=nil;
    [context save:&error];
    [self performSegueWithIdentifier:@"backtomain" sender:self];
}

- (IBAction)changeImage:(id)sender {
    

}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // NSLog(@"Action Sheet Button Index: %d",buttonIndex);
    if (buttonIndex == 0) {
        
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        {
            UIImagePickerController *imagePicker =
            [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
            imagePicker.allowsEditing = NO;
            [self presentViewController:imagePicker
                               animated:YES completion:nil];
            _newMedia = NO;
        }
    }
    if (buttonIndex == 1) {
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *imagePicker =
            [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypeCamera;
            imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
            imagePicker.allowsEditing = NO;
            [self presentViewController:imagePicker
                               animated:YES completion:nil];
            _newMedia = YES;
        }
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        // UIImage *ima=info[UIImagePickerControllerEditedImage];
        _headImage.image= image;
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        
    }
    CATransition *tran=[CATransition animation];
    NSTimeInterval inter=1;
    tran.duration=inter;
    tran.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    tran.type=@"cameraIrisHollowClose";
    tran.subtype=kCAMediaTimingFunctionEaseIn;
    tran.delegate=self;
    [self.headImage.layer addAnimation:tran forKey:nil];
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)cancel:(id)sender {
    if ([kAppDelegate.managedObjectContext hasChanges]) {
        [kAppDelegate.managedObjectContext rollback];
        
    }
    [self performSegueWithIdentifier:@"backtomain" sender:self];
}

- (IBAction)change:(id)sender {
    UIActionSheet *photoBtnActionSheet =
    [[UIActionSheet alloc] initWithTitle:nil
                                delegate:self
                       cancelButtonTitle:@"Cancel"
                  destructiveButtonTitle:nil
                       otherButtonTitles:@"Photo Library",@"Take Photo", nil];
    [photoBtnActionSheet setActionSheetStyle:UIActionSheetStyleBlackOpaque];
    [photoBtnActionSheet showInView:[self.view window]];

}

- (IBAction)save:(id)sender {
    [self save];
}
@end
