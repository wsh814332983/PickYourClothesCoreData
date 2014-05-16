//
//  PickYourClothesViewController.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/5/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "PickYourClothesViewController.h"
#import "UIButton+Bootstrap.h"
#import "HJScrollView.h"
@interface PickYourClothesViewController ()
    {
        NSInteger currnetPage;
        NSInteger numberOfPages;
        UIImageView *clothesImage;
        UIImageView *pantsImage;
    }

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong,nonatomic) NSFetchedResultsController *fetchrearch;
@property (strong,nonatomic) NSArray *clothesArray;
@property (nonatomic) Clothes *recentCloth1;
@property (nonatomic) Clothes *recentCloth2;
@property (nonatomic) Clothes *recentCloth3;
@property (nonatomic) Clothes *recentPants1;
@property (nonatomic) Clothes *recentPants2;
@property (nonatomic) Clothes *recentPants3;
@property (strong,nonatomic) NSMutableArray *clothesFilterArray;
@property (strong,nonatomic) NSMutableArray *pantsFilterArray;
@property (nonatomic) NSInteger recentChoice;
@end

@implementation PickYourClothesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) viewWillAppear:(BOOL)animated{
    self.gooutPurpose.text=@"";
    [self createView];
    
}
-(void) showRecent{
    self.fetchrearch=nil;
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] init];
    NSManagedObjectContext *moc=kAppDelegate.managedObjectContext;
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Clothes" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:20];
    NSSortDescriptor *sortDescriptor=[[NSSortDescriptor alloc]initWithKey:@"name" ascending:NO];
    NSArray *sortDescription=[NSArray arrayWithObjects:sortDescriptor,nil];
    [fetchRequest setSortDescriptors:sortDescription];
    NSFetchedResultsController *aFetched=[[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:moc sectionNameKeyPath:@"name" cacheName:nil];
    aFetched.delegate=self;
    self.fetchrearch=aFetched;
    NSError *error=nil;
    if (![self.fetchrearch performFetch:&error]) {
        abort();
    }
    _clothesArray=[self.fetchrearch fetchedObjects];
    _clothesFilterArray=[[NSMutableArray alloc]init];
    _pantsFilterArray=[[NSMutableArray alloc]init];
    if([_clothesArray count]!=0){
    for(Clothes *cloth in _clothesArray){
        NSString *check=[self showTime:cloth.selectTime];
        BOOL a=[check length]==0;
        if ([cloth.kindOf isEqualToString:@"Jacketing"]&&!a) {
            [_clothesFilterArray addObject:cloth];
        }
        if ([cloth.kindOf isEqualToString:@"Pants"]&&!a) {
            [_pantsFilterArray addObject:cloth];
        }
    }
        if([_clothesFilterArray count]>0){
            NSArray *sortedArray=[self compareDate:_clothesFilterArray];
            NSInteger i=[sortedArray count];
            _recentCloth1=sortedArray[i-1];
            if([_clothesFilterArray count]>1){
                _recentCloth2=sortedArray[i-2];
            }
            if ([_clothesFilterArray count]>2) {
                _recentCloth3=sortedArray[i-3];
            }
        }
        if ([_pantsFilterArray count]>0) {
            NSArray *sortedPantsArray=[self compareDate:_pantsFilterArray];
            NSInteger i=[sortedPantsArray count];
            _recentPants1=sortedPantsArray[i-1];
            if([_pantsFilterArray count]>1){
                _recentPants2=sortedPantsArray[i-2];
            }
            if ([_pantsFilterArray count]>2) {
                _recentPants3=sortedPantsArray[i-3];
            }
        }
    }
}
-(NSString *) showTime:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}
-(NSArray *) compareDate:(NSArray *)originalArray{
    NSArray *sortedArray = [originalArray sortedArrayUsingComparator:^(Clothes *obj1, Clothes *obj2){
        NSDate *date1 = obj1.selectTime;
        NSDate *date2 = obj2.selectTime;
        return [date1 compare:date2];
    }];
    return sortedArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.start primaryStyle];
    [self.start addAwesomeIcon:FAIconBriefcase beforeTitle:YES];
    self.start.layer.cornerRadius=20;
    NSArray *items = [NSArray arrayWithObjects:@"Exercise,Gym,Sports", @"Formal Occasion", @"Others", nil];
    self.gooutPurpose.items = items;
    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated{
    [scrollView removeFromSuperview];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"purpose"]) {
        MainFunctionViewController *mainfunc=[segue destinationViewController];
        mainfunc.purpose= self.gooutPurpose.text;
    }
    
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

- (IBAction)startPick:(id)sender {
    if([self.gooutPurpose.text length]==0){
           UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Oops" message:@"Please Choose A Purpose ABOVE." delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
}

- (void)chooseRecent{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Want Choose Again?" message:@"make a decision" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [alert show];
    alert.tag=1;
}

//- (void)chooseRecent2{
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Want Choose Again?" message:@"make a decision" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
//    [alert show];
//    alert.tag=2;
//}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if([alertView tag]==1){
        switch (buttonIndex) {
            case 0:
                break;
            case 1:
            { NSDate *now=[NSDate date];
                {
                switch (_recentChoice){
                    case 1:
                        [self save:_recentCloth1 atTime:now];
                        break;
                    case 2:
                        [self save:_recentPants1 atTime:now];
                        break;
                    case 3:
                        [self save:_recentCloth2 atTime:now];
                        break;
                    case 4:
                        [self save:_recentPants2 atTime:now];
                        break;
                    case 5:
                        [self save:_recentCloth3 atTime:now];
                        break;
                    case 6:
                        [self save:_recentPants3 atTime:now];
                        break;
                }
                }
            }
            break;
        }
    }
}
-(void)save:(Clothes *)cloth atTime:(NSDate *)date{
    NSManagedObjectID *clothID=[[NSManagedObjectID alloc]init];
    clothID=[cloth objectID];
    NSManagedObjectContext *moc=[kAppDelegate managedObjectContext];
    NSManagedObject *object=[kAppDelegate.managedObjectContext objectWithID:clothID];
    [object setValue:date forKeyPath:@"selectTime"];
    [object setValue:[NSNumber numberWithInt:1+[cloth.useTime intValue]] forKeyPath:@"useTime"];
    NSError *error;
    [moc save:&error];
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:@"purpose"]&&[self.gooutPurpose.text length]==0) {
        return NO;
    }
    
    else{return YES;}
    
}
-(void)createView
{
    [self showRecent];
    currnetPage = 0;
    if(([_clothesFilterArray count]>2)||[_pantsFilterArray count]>2){
        numberOfPages = 3;
    }else if(([_clothesFilterArray count]>1)||[_pantsFilterArray count]>1){
        numberOfPages =2;
    }else if(([_clothesFilterArray count]>0)||[_pantsFilterArray count]>0){
        numberOfPages=1;
    }else{
        numberOfPages=0;
    }
    
    scrollView = [[HJScrollView alloc]init];
    scrollView.frame = CGRectMake(20, self.view.frame.size.height/4.8, 280, self.view.frame.size.height/2.4);
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width*numberOfPages, scrollView.frame.size.height);
    scrollView.layer.cornerRadius=20;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    pageControl = [[UIPageControl alloc]init];
    pageControl.frame = CGRectMake(20, self.view.frame.size.height/4.8+self.view.frame.size.height/2.4-10, 280, 36);
    pageControl.currentPage = currnetPage;
    pageControl.numberOfPages = numberOfPages;
    //clothesImage.image=nil;
    for (int i=0; i<numberOfPages; i++) {
        CGRect frame1;
//        frame1.origin.x = scrollView.frame.size.width*i;
//        frame1.origin.y = 0;
//        frame1.size = scrollView.frame.size;
        frame1=CGRectMake(scrollView.frame.size.width*i, 0, 140, self.view.frame.size.height/2.4);
        
        clothesImage=[[UIImageView alloc]initWithFrame:frame1];
        clothesImage.layer.cornerRadius=20;
        clothesImage.backgroundColor=[UIColor clearColor];
        if(i==0){
            NSData *imagedata=_recentCloth1.image;
            clothesImage.image=[UIImage imageWithData:imagedata];
        }else if(i==1){
            NSData *imagedata=_recentCloth2.image;
            clothesImage.image=[UIImage imageWithData:imagedata];
        }else{
            NSData *imagedata=_recentCloth3.image;
            clothesImage.image=[UIImage imageWithData:imagedata];
        }
        [scrollView addSubview:clothesImage];
        clothesImage = nil;
        
        CGRect frame2;
        frame2=CGRectMake(scrollView.frame.size.width*i+140, 0, 140, self.view.frame.size.height/2.4);
        pantsImage=[[UIImageView alloc]initWithFrame:frame2];
        pantsImage.layer.cornerRadius=20;
        pantsImage.backgroundColor=[UIColor clearColor];
        if(i==0){
            NSData *imagedata=_recentPants1.image;
            pantsImage.image=[UIImage imageWithData:imagedata];
        }else if(i==1){
            NSData *imagedata=_recentPants2.image;
            pantsImage.image=[UIImage imageWithData:imagedata];
        }else{
            NSData *imagedata=_recentPants3.image;
            pantsImage.image=[UIImage imageWithData:imagedata];
        }
        [scrollView addSubview:pantsImage];
        pantsImage = nil;
        
    }

    scrollView.delegate = self;
    
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    singleFingerTap.numberOfTapsRequired = 1;
    [scrollView addGestureRecognizer:singleFingerTap];
    
    singleFingerTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTap:)];
    singleFingerTap.numberOfTapsRequired = 2;
    [scrollView addGestureRecognizer:singleFingerTap];
    
    
    [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    pageControl.userInteractionEnabled= YES;
    if ([_clothesFilterArray count]==0){
        
    }

    [self.view addSubview:pageControl];
    [self.view addSubview:scrollView];
    }

-(void) changePage:(id)sender
{
    pageControl.currentPage = currnetPage;
    CGRect frame ;
    frame.origin.x = scrollView.frame.size.width * currnetPage;
    frame.origin.y = 0;
    frame.size = scrollView.frame.size;
    [scrollView scrollRectToVisible:frame animated:YES];
}


-(void)handleTap:(UIGestureRecognizer *)sender
{
    CGPoint point = [sender locationInView:sender.view.superview];
    if (point.x<scrollView.frame.size.width/2) {
        if (currnetPage>0)
        {
            currnetPage--;
            [self changePage:nil];
        }
    }else {
        if(currnetPage<(numberOfPages-1))
        {
            currnetPage++;
            [self changePage:nil];
            
        }
    }
}
-(void)handleDoubleTap:(UIGestureRecognizer *)sender
{
    CGPoint point = [sender locationInView:sender.view.superview];
    switch (currnetPage) {
        case 0:
        {
            if (point.x<scrollView.frame.size.width/2) {
                if([_clothesFilterArray count]>0){
                    _recentChoice=1;
                    [self chooseRecent];
                }
            }else{
                if ([_pantsFilterArray count]>0) {
                    _recentChoice=2;
                    [self chooseRecent];
                }
            }
        }
            break;
        case 1:
        {
            if (point.x<scrollView.frame.size.width/2) {
                if([_clothesFilterArray count]>1){
                    _recentChoice=3;
                    [self chooseRecent];
                }
            }else{
                if ([_pantsFilterArray count]>1) {
                    _recentChoice=4;
                    [self chooseRecent];
                }
            }
        }
            break;
        case 2:{
            if (point.x<scrollView.frame.size.width/2) {
                if([_clothesFilterArray count]>2){
                    _recentChoice=5;
                    [self chooseRecent];
                }
            }else{
                if ([_pantsFilterArray count]>2) {
                    _recentChoice=6;
                    [self chooseRecent];
                }
            }
        }
        default:
            break;
    }
    
            
            
            
//    if([_clothesFilterArray count]!=0){
//    if (currnetPage==0) {
//        [self chooseRecent];
//    }else{
//        [self chooseRecent2];
//    }
//    }
}
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    
    CGFloat width = scrollView.frame.size.width;
    currnetPage = floor((scrollView.contentOffset.x-width/2)/width)+1;
    pageControl.currentPage = currnetPage;
    
    
}
@end
