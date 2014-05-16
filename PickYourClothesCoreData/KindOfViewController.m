//
//  KindOfViewController.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/5/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "KindOfViewController.h"
<<<<<<< HEAD
#import "UIButton+Bootstrap.h"
=======

>>>>>>> FETCH_HEAD
@interface KindOfViewController ()
@property (strong,nonatomic) NSArray *kindOf;
@property (strong,nonatomic) NSString *deci;
@end

@implementation KindOfViewController

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
    _buttomLook.layer.cornerRadius=8;
<<<<<<< HEAD
    [self.buttomLook infoStyle];
    [self.buttomLook addAwesomeIcon:FAIconBriefcase beforeTitle:YES];
    _kindOf=@[@"Select",@"Jacketing",@"Pants",@"Belt",@"Glove",@"Eyeglass",@"Shoes",@"Umbrella"];
    _imageout.layer.cornerRadius=8;
    
}

=======
    _kindOf=@[@"Select",@"Jacketing",@"Pants",@"Belt",@"Glove",@"Eyeglass",@"Shoes",@"Umbrella"];
    _imageout.layer.cornerRadius=8;
    }
>>>>>>> FETCH_HEAD

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return _kindOf.count;
}

<<<<<<< HEAD
//- (NSString *)pickerView:(UIPickerView *)pickerView
//             titleForRow:(NSInteger)row
//            forComponent:(NSInteger)component
//{
//    return _kindOf[row];
//} 
=======
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return _kindOf[row];
} 
>>>>>>> FETCH_HEAD
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    
        
    NSString *resultString = [[NSString alloc] initWithFormat:
                              @"%@.jpg",_kindOf[row]];
    _deci=_kindOf[row];
<<<<<<< HEAD
=======
    NSLog(@"%@",resultString);
>>>>>>> FETCH_HEAD
    _imageout.image=[UIImage imageNamed:resultString];
    
    
}
<<<<<<< HEAD
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *myView=[[UILabel alloc]init];
    myView.text=_kindOf[row];
    myView.highlighted=YES;
    myView.highlightedTextColor=[UIColor orangeColor];
  //  [myView setTextColor:[UIColor whiteColor]];
    myView.textAlignment = NSTextAlignmentCenter;
    myView.font=[UIFont boldSystemFontOfSize:30];
    return myView;
}
=======
>>>>>>> FETCH_HEAD
-(void) viewWillAppear:(BOOL)animated{

}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
     CameraViewController *camer=[segue destinationViewController];
    camer.entitycloth=_deci;
    
    if (camer.entitycloth==nil) {
      
    }
}

- (IBAction)Select:(id)sender {
<<<<<<< HEAD
=======
    NSLog(@"%@",_deci);
>>>>>>> FETCH_HEAD
    if ([_deci isEqual:@"Select"]||_deci==nil) {
//        
//    UIAlertView *deci=[[UIAlertView alloc]initWithTitle:@"Attention" message:@"Please,Select one kind" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [deci show];
      
        DXAlertView *alert = [[DXAlertView alloc]  initWithTitle:@"Oops" contentText:@"You should make a choice" leftButtonTitle:nil rightButtonTitle:@"RETURN"];
        [alert show];
    }
    else {
        [self performSegueWithIdentifier:@"seedetail" sender:self];
        
    }
    
}
//-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([_deci isEqual:@"Select"]) {
//        
//        UIAlertView *deci=[[UIAlertView alloc]initWithTitle:@"Attention" message:@"Please,Select one kind" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [deci show];
//    }
//    else {
//        
//    }
//}
@end
