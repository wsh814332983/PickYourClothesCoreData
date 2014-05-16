//
//  editbrandViewController.h
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 5/15/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface editbrandViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelbrand;
@property (strong,nonatomic) NSString *label;
@property (weak, nonatomic) IBOutlet UITextField *inputtext;
@property (weak, nonatomic) IBOutlet UITableView *tableselect;
@property (weak, nonatomic) IBOutlet UIButton *button;
- (IBAction)done:(id)sender;
-(IBAction)textFiledReturnEditing:(id)sender;
@property(strong,nonatomic) NSString *path;
@property (strong,nonatomic)NSMutableArray *brands;

@end
