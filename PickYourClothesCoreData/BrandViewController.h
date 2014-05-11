//
//  BrandViewController.h
//  
//
//  Created by tianxiang zhang on 5/3/14.
//
//

#import <UIKit/UIKit.h>
#import "brandTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
@interface BrandViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
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
