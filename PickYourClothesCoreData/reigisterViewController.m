//
//  reigisterViewController.m
//  login
//
//  Created by tianxiang zhang on 5/4/14.
//  Copyright (c) 2014 tianxiang. All rights reserved.
//

#import "reigisterViewController.h"
#import "UIButton+Bootstrap.h"
@interface reigisterViewController ()
@property BOOL newMedia;
@end

@implementation reigisterViewController

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
=======
    NSArray *items = [NSArray arrayWithObjects:@"Male", @"Female", nil];
    self.gender.items = items;
>>>>>>> FETCH_HEAD
    _viewback.layer.cornerRadius=50;
    _viewback.layer.masksToBounds=YES;
    _viewback.layer.borderWidth=2;
    _viewback.layer.borderColor=[[UIColor grayColor] CGColor];
    _imageview.layer.cornerRadius=8;
    _imageview.frame=_viewback.frame;
    self.imageview.layer.cornerRadius=50;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handletap)];
    tap.numberOfTapsRequired=1;
    tap.delegate=self;
    [self.viewback addGestureRecognizer:tap];
    [self.save successStyle];
    [self.save addAwesomeIcon:FAIconSave beforeTitle:YES];
    [self.cancel dangerStyle];
    [self.cancel addAwesomeIcon:FAIconStop beforeTitle:YES];
    
}
#pragma  imagepart;
-(void) handletap
{
    UIActionSheet *photoBtnActionSheet =
    [[UIActionSheet alloc] initWithTitle:nil
                                delegate:self
                       cancelButtonTitle:@"Cancel"
                  destructiveButtonTitle:nil
                       otherButtonTitles:@"Photo Library",@"Take Photo", nil];
    [photoBtnActionSheet setActionSheetStyle:UIActionSheetStyleBlackOpaque];
    [photoBtnActionSheet showInView:[self.view window]];
   
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
        [_imageview setImage:image];
        
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        
    }
<<<<<<< HEAD
    CATransition *tran=[CATransition animation];
    NSTimeInterval inter=1;
    tran.duration=inter;
    tran.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    tran.type=@"cameraIrisHollowClose";
    tran.subtype=kCAMediaTimingFunctionEaseIn;
    tran.delegate=self;
    [self.imageview.layer addAnimation:tran forKey:nil];
=======
>>>>>>> FETCH_HEAD
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma next

- (IBAction)save:(id)sender {
    if (![_name.text isEqualToString:@""]&&![_password.text isEqualToString:@""]&&[_password.text isEqualToString:_repassword.text]&&![_mail.text isEqualToString:@""]) {
        [self savemethod];
    }else{
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Lack of imformation" message:@"please re-check!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}
-(void) savemethod{
    
    NSManagedObjectContext *context=kAppDelegate.managedObjectContext;
    NSManagedObject *object=[NSEntityDescription insertNewObjectForEntityForName:@"People" inManagedObjectContext:context];
    [object setValue:_name.text forKey:@"name"];
    [object setValue:_mail.text forKey:@"mail"];
    [object setValue:_password.text forKey:@"password"];
<<<<<<< HEAD
=======
    id ageNumber;
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    ageNumber=[f numberFromString:_age.text];
    [object setValue:ageNumber forKeyPath:@"age"];
    NSNumber *genderBool;
    if ([_gender.text isEqualToString:@"Male"]) {
        genderBool=[NSNumber numberWithInt:0];
    } else{
        genderBool=[NSNumber numberWithInt:1];
    }
    [object setValue:genderBool forKeyPath:@"gender"];
>>>>>>> FETCH_HEAD
    NSData *image=UIImageJPEGRepresentation(_imageview.image, 1);
    [object setValue:image forKey:@"image"];
    NSError *error=nil;
    [context save:&error];
    [self performSegueWithIdentifier:@"backtologin" sender:self];
    
}
#pragma keyboard;

-(IBAction)TextField_DidEndOnExit:(id)sender
{
     [sender resignFirstResponder];
}
- (IBAction)nameTextField_DidEndOnExit:(id)sender {
    
    [self.name becomeFirstResponder];
}
- (IBAction)passwordTextField_DidEndOnExit:(id)sender {
    
    [self.password becomeFirstResponder];
}
- (IBAction)repasswordTextField_DidEndOnExit:(id)sender {
    
    [self.repassword becomeFirstResponder];
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[[event allTouches] anyObject];
    if([_mail isFirstResponder]&& [touch view]!=_mail){
        [_mail resignFirstResponder];
    }
    if([_password isFirstResponder]&& [touch view]!=_password){
        [_password resignFirstResponder];
    }
    if([_repassword isFirstResponder]&& [touch view]!=_repassword){
        [_repassword resignFirstResponder];
    }
    if([_name isFirstResponder]&& [touch view]!=_name){
        [_name resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}
-(void) textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@"111");
    textView.text=nil;
    CGRect frame = textView.frame;
    int offset = frame.origin.y + 80 - (self.view.frame.size.height - 216.0);
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
    
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.text=nil;
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

@end
