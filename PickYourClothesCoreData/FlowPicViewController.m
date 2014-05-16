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
<<<<<<< HEAD
#import "People.h"
=======

>>>>>>> FETCH_HEAD

@interface FlowPicViewController ()

@property (strong,nonatomic) UIImage *image;
<<<<<<< HEAD
@property (strong,nonatomic) People *peo;
@property (strong,nonatomic) NSString *mailId;
=======
>>>>>>> FETCH_HEAD
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
<<<<<<< HEAD
//    
    [self fetchpeople];
    self.view.backgroundColor=[UIColor clearColor];

=======
   
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
>>>>>>> FETCH_HEAD
}
-(void) viewDidAppear:(BOOL)animated
{
    
    [self configurefetch];
    NSArray *clothes=_clo;
    _images=[[NSMutableArray alloc] init];
    _text =[[NSMutableArray alloc] init];
<<<<<<< HEAD
    if ([clothes count]!=0||clothes!=nil) {
        for (int i=0; i<[clothes count]; i++) {
            
            _cloth=clothes[i];
            
            NSData *image=_cloth.image;
            
            [self.images addObject:[UIImage imageWithData:image]];
            NSString *des=[NSString stringWithFormat:@"%@  Wear:%i times",_cloth.brand,[_cloth.useTime intValue]];
            [_text addObject:des];
        }

    }
        [self addWaterFollow];
=======
    for (int i=0; i<[clothes count]; i++) {
       
        _cloth=clothes[i];
        
        NSData *image=_cloth.image;
        
        [self.images addObject:[UIImage imageWithData:image]];
        //NSLog(@"%i",[_images count]);
        NSString *des=[NSString stringWithFormat:@"name:%@ descript:%@",_cloth.name,_cloth.describe];
        [_text addObject:des];
    }
    [self addWaterFollow];
>>>>>>> FETCH_HEAD
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
<<<<<<< HEAD
=======
    //NSLog(@"add %i",[self.images count]);
>>>>>>> FETCH_HEAD
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSFetchedResultsController *) configurefetch
{
<<<<<<< HEAD
//    if (_fetchrequestcontrol!=nil) {
//        return _fetchrequestcontrol;
//    }
//    else{
=======
    if (_fetchrequestcontrol!=nil) {
        return _fetchrequestcontrol;
    }
    else{
>>>>>>> FETCH_HEAD
        NSFetchRequest *request=[[NSFetchRequest alloc]init];
        NSManagedObjectContext *context=kAppDelegate.managedObjectContext;
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Clothes" inManagedObjectContext:context];
        [request setEntity:entity];
        NSSortDescriptor *descript=[[NSSortDescriptor alloc] initWithKey:@"kindOf" ascending:YES];
        [self setSelect:_selectcondition];
      
        [request setPredicate:_predicate];
<<<<<<< HEAD
=======
        
>>>>>>> FETCH_HEAD
        NSArray *des=[NSArray arrayWithObjects:descript, nil];
        [request setSortDescriptors:des];
        
        NSFetchedResultsController *afetch=[[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
        NSError *error=nil;
        
        if(![afetch performFetch:&error]){
            abort();
        }
        _fetchrequestcontrol=afetch;
<<<<<<< HEAD
        NSMutableArray *tem=[[NSMutableArray alloc] init];
        [tem addObjectsFromArray:[context executeFetchRequest:request error:&error]];
        _clo=[[NSMutableArray alloc] init];
       
        for (int i=0; i<[tem count]; i++) {
          Clothes  *clothes=(Clothes *)[tem objectAtIndex:i];
            People *p=clothes.belong;
            if ([p isEqual: _peo]) {
                [_clo addObject:clothes];
            }
     }
        
        return _fetchrequestcontrol;
        
   // }
    
}
-(void) setSelect:(NSString *)select
{
=======
        _clo=[context executeFetchRequest:request error:&error];
        NSLog(@"11");
        return _fetchrequestcontrol;
        
    }
    
}
-(void) setSelect:(NSString *)select
{   NSLog(@"null: %@",_select);
>>>>>>> FETCH_HEAD
    if ([select isEqualToString:@"All"]) {
        _select=@"ALL";
        _predicate=nil;
    }else if([select isEqualToString:@"Jacketing"])
    {
        _select=select;
        _predicate=[NSPredicate predicateWithFormat:@"kindOf = %@",self.select];
<<<<<<< HEAD
=======
         NSLog(@"jacketing: %@",_select);
>>>>>>> FETCH_HEAD
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
<<<<<<< HEAD
        detail.frame=CGRectMake(40, 100, 240, 300);
=======
        detail.frame=CGRectMake(40, 150, 240, 300);
>>>>>>> FETCH_HEAD
        
        
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
<<<<<<< HEAD
{
=======
{   NSLog(@"maindelegate");
>>>>>>> FETCH_HEAD
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
<<<<<<< HEAD
=======
    NSLog(@"testdelegat");
>>>>>>> FETCH_HEAD
    flowshowdetailViewController *modal=(flowshowdetailViewController *)viewController;
   
    showDetailview *detail=[[showDetailview alloc] init];
    [detail setImage:_image];
<<<<<<< HEAD
    detail.frame=CGRectMake(40, 100, 240, 250);
=======
    detail.frame=CGRectMake(40, 150, 240, 300);
>>>>>>> FETCH_HEAD
   
    
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
<<<<<<< HEAD

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

=======
//-(void) controllerWillChangeContent:(NSFetchedResultsController *)controller
//{
//    NSLog(@"chang");
//    [self.collectView reloadInputViews];
//}
//-(void) controllerDidChangeContent:(NSFetchedResultsController *)controller
//{
//    NSLog(@"didchange");
//}
>>>>>>> FETCH_HEAD
@end
