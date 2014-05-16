//
//  imageEditViewController.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/7/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "imageEditViewController.h"
<<<<<<< HEAD
#import "UIButton+Bootstrap.h"
=======

>>>>>>> FETCH_HEAD
@interface imageEditViewController ()

@end

@implementation imageEditViewController

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
    _button.layer.cornerRadius=20;
<<<<<<< HEAD
    [self.button infoStyle];
    [self.button addAwesomeIcon:FAIconCamera beforeTitle:YES];
=======
>>>>>>> FETCH_HEAD
    _imageView.image=[UIImage imageWithData:_cloth.image];
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

- (IBAction)takePic:(id)sender {
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
<<<<<<< HEAD
=======
    // NSLog(@"Action Sheet Button Index: %d",buttonIndex);
>>>>>>> FETCH_HEAD
    if (buttonIndex == 0) {
        //Show Photo Library
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        {
            UIImagePickerController *imagePicker =
            [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
<<<<<<< HEAD
            imagePicker.allowsEditing = YES;
=======
            imagePicker.allowsEditing = NO;
>>>>>>> FETCH_HEAD
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
<<<<<<< HEAD
            imagePicker.allowsEditing = YES;
=======
            imagePicker.allowsEditing = NO;
>>>>>>> FETCH_HEAD
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
        
        _imageView.image= image;
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        // Code here to support video if enabled
    }
}
<<<<<<< HEAD
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


=======
>>>>>>> FETCH_HEAD
#pragma button
- (IBAction)done:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Want Change" message:@"make a decision" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
<<<<<<< HEAD
=======
    NSLog(@"%i",buttonIndex);
>>>>>>> FETCH_HEAD
    switch (buttonIndex) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
        
            break;
            
        case 1:
            if (_imageView!=nil) {
<<<<<<< HEAD
=======
                NSLog(@"2");
>>>>>>> FETCH_HEAD
                NSData *image=UIImageJPEGRepresentation(_imageView.image, 1);
                [self.delegate changeImage:image];
                [self.navigationController popViewControllerAnimated:YES];
            }
            
            break;
    }
}
@end
