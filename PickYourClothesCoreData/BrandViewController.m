//
//  BrandViewController.m
//  
//
//  Created by tianxiang zhang on 5/3/14.
//
//

#import "BrandViewController.h"
#import "CameraViewController.h"
@interface BrandViewController ()

@end

@implementation BrandViewController

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
    
    _labelbrand.text=_label;
    _labelbrand.font=[UIFont fontWithName:@"Helvetica" size:20];
    [self takeBrand];
    
    _tableselect.layer.cornerRadius=10;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
-(void) takeBrand{
    _brands=[[NSMutableArray alloc] init];
    NSFileManager *manage=[NSFileManager defaultManager];
    NSString *docsDir;
    NSArray *dirPath;
    dirPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPath[0];
    _path=[[NSString alloc] initWithString:[docsDir stringByAppendingString:@"brand.archve"]];
    if ([manage fileExistsAtPath:_path]) {
        NSMutableArray *dataArray=[[NSMutableArray alloc] init];
        dataArray =[NSKeyedUnarchiver unarchiveObjectWithFile:_path];
        if (dataArray!=nil) {
            _brands=dataArray;
        }
    }
    
   
}
-(void) saveBrand{
    NSMutableSet *setarr=[NSMutableSet setWithArray:_brands];
    [_brands removeAllObjects];
    [_brands addObjectsFromArray:[setarr allObjects]];
        [NSKeyedArchiver archiveRootObject:_brands toFile:_path];
}
#pragma table view
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [_brands count];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    brandTableViewCell *cell=[self.tableselect dequeueReusableCellWithIdentifier:@"BrandCell" forIndexPath:indexPath];
    cell.brandput.text=[_brands objectAtIndex:[indexPath row]];
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return  YES;
}
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        
        [_brands removeObject:[_brands objectAtIndex:[indexPath row]]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
         
    }
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _labelbrand.text=[_brands objectAtIndex:[indexPath row]];
}
#pragma button
- (IBAction)done:(id)sender {
    if(![_inputtext.text isEqual:@""]){
        
        NSString *newstring=_inputtext.text;
        [_brands addObject:newstring];
        
    }
    
    [self saveBrand];
    [self performSegueWithIdentifier:@"brandback" sender:self];
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{  if([[segue identifier] isEqualToString:@"brandback"]){
    CameraViewController *des=(CameraViewController *)[segue destinationViewController];
    des.brandbutton.titleLabel.text=_labelbrand.text;
  }
    
}
-(IBAction)textFiledReturnEditing:(id)sender {
    
    _labelbrand.text=_inputtext.text;
    [sender resignFirstResponder];
}
@end
