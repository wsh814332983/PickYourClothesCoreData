//
//  FlowPicViewController.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/18/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "FlowPicViewController.h"
#import "showDetailview.h"
#import "WaterFLayout.h"
#import "FlowControlViewController.h"
#import "flowshowdetailViewController.h"


@interface FlowPicViewController ()

@property (strong,nonatomic) UIImage *image;
@end

@implementation FlowPicViewController

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
   
    [self configurefetch];
    NSArray *clothes=_clo;
    _images=[[NSMutableArray alloc] init];
    _text =[[NSMutableArray alloc] init];
    for (int i=0; i<[clothes count]; i++) {
         NSLog(@"num: %i",[clothes count]);
        _cloth=clothes[i];
        
        NSData *image=_cloth.image;
        
        [self.images addObject:[UIImage imageWithData:image]];
        
        NSString *des=[NSString stringWithFormat:@"name:%@ descript:%@",_cloth.name,_cloth.describe];
        [_text addObject:des];
    }
    [self addWaterFollow];
}
-(void) viewDidAppear:(BOOL)animated
{
    
    [self configurefetch];
    NSArray *clothes=_clo;
    _images=[[NSMutableArray alloc] init];
    _text =[[NSMutableArray alloc] init];
    for (int i=0; i<[clothes count]; i++) {
       
        _cloth=clothes[i];
        
        NSData *image=_cloth.image;
        
        [self.images addObject:[UIImage imageWithData:image]];
        //NSLog(@"%i",[_images count]);
        NSString *des=[NSString stringWithFormat:@"name:%@ descript:%@",_cloth.name,_cloth.describe];
        [_text addObject:des];
    }
    [self addWaterFollow];
}
- (void)addWaterFollow
{
   
    WaterFLayout* flowLayout = [[WaterFLayout alloc]init];
    self.collectView = [[WaterF alloc]initWithCollectionViewLayout:flowLayout];
    self.collectView.imagesArr = self.images;
    self.collectView.textsArr = self.text;
    self.collectView.clothes=_clo;
    self.collectView.sectionNum = 1;
    self.collectView.imagewidth = 150;
    [self.collectView setDelegate:self];
    [self.view addSubview:self.collectView.view];
    //NSLog(@"add %i",[self.images count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSFetchedResultsController *) configurefetch
{
    if (_fetchrequestcontrol!=nil) {
        return _fetchrequestcontrol;
    }
    else{
        NSFetchRequest *request=[[NSFetchRequest alloc]init];
        NSManagedObjectContext *context=kAppDelegate.managedObjectContext;
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Clothes" inManagedObjectContext:context];
        [request setEntity:entity];
        NSSortDescriptor *descript=[[NSSortDescriptor alloc] initWithKey:@"kindOf" ascending:YES];
        [self setSelect:_selectcondition];
      
        [request setPredicate:_predicate];
        
        NSArray *des=[NSArray arrayWithObjects:descript, nil];
        [request setSortDescriptors:des];
        
        NSFetchedResultsController *afetch=[[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
        NSError *error=nil;
        
        if(![afetch performFetch:&error]){
            abort();
        }
        _fetchrequestcontrol=afetch;
        _clo=[context executeFetchRequest:request error:&error];
        NSLog(@"11");
        return _fetchrequestcontrol;
        
    }
    
}
-(void) setSelect:(NSString *)select
{   NSLog(@"null: %@",_select);
    if ([select isEqualToString:@"All"]) {
        _select=@"ALL";
        _predicate=nil;
    }else if([select isEqualToString:@"Jacketing"])
    {
        _select=select;
        _predicate=[NSPredicate predicateWithFormat:@"kindOf = %@",self.select];
         NSLog(@"jacketing: %@",_select);
    }else if ([select isEqualToString:@"Pants"])
    {
        _select=select;
       _predicate=[NSPredicate predicateWithFormat:@"kindOf = %@",self.select];
    }else if([select isEqualToString:@"Shoes"])
    {
        _select=select;
        _predicate=[NSPredicate predicateWithFormat:@"kindOf = %@",self.select];
    }else{
        _select=@"Belt OR Glass";
        _predicate=[NSPredicate predicateWithFormat:@"kindOf =%@ OR kindOf=%@ OR kindOf=%@ OR kindOf=%@",@"Umbrella",@"Belt",@"Glass",@"Glove"];
    }
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toScrollview"]) {
        FlowControlViewController *flowimage=(FlowControlViewController *)[segue destinationViewController];
       
        flowimage.imagesscroll=_clo;
        
    }
    if ([[segue identifier] isEqualToString:@"toDetail"]) {
        flowshowdetailViewController *modal=(flowshowdetailViewController *)[segue destinationViewController];
        showDetailview *detail=[[showDetailview alloc] init];
        //[detail setImage:_editcloth.image];
        detail.cloth=_editcloth;
        modal.cloth=_editcloth;
        detail.frame=CGRectMake(40, 150, 240, 300);
        
        
        [detail awakeFromNib];
        [modal.view addSubview:detail];
        [detail setDelegate:self];
    }
    
}
- (IBAction)pick:(id)sender {
    [self performSegueWithIdentifier:@"toScrollview" sender:self];
}



#pragma nextshowdetailview;


-(void) updatecollectview:(Clothes *)cloth;
{   NSLog(@"maindelegate");
    self.editcloth=cloth;
    [self.delegate setdetailflow:cloth];
    [self performSegueWithIdentifier:@"toDetail" sender:self];
    
//     flowshowdetailViewController *modal=[self.storyboard instantiateViewControllerWithIdentifier:@"flowshowdetail"];
//    
//    
//      
//   
//   UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:modal];
//    [nav setDelegate:self];
//    
//   [self presentViewController:nav animated:YES completion:nil];
    
}
-(void) navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSLog(@"testdelegat");
    flowshowdetailViewController *modal=(flowshowdetailViewController *)viewController;
   
    showDetailview *detail=[[showDetailview alloc] init];
    [detail setImage:_image];
    detail.frame=CGRectMake(40, 150, 240, 300);
   
    
    [detail awakeFromNib];
    [modal.view addSubview:detail];
 
    
    [detail setDelegate:self];
    
    
}
- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue {}

-(void)setwear:(BOOL)select
{
    NSNumber *set=[NSNumber numberWithBool:select];
    _cloth.landry=set;
}
#pragma change
//-(void) controllerWillChangeContent:(NSFetchedResultsController *)controller
//{
//    NSLog(@"chang");
//    [self.collectView reloadInputViews];
//}
//-(void) controllerDidChangeContent:(NSFetchedResultsController *)controller
//{
//    NSLog(@"didchange");
//}
@end
