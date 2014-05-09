//
//  ClothesTableViewController.m
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/6/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import "ClothesTableViewController.h"
#import "People.h"
#import "searchTableViewCell.h"
@interface ClothesTableViewController ()
@property (strong,nonatomic) People *peo;
@property (strong,nonatomic) NSString *mailId;

@end
enum month{
    JAN,FEB,MAR,APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC
    
};

@implementation ClothesTableViewController
@synthesize fetchedResultsController = __fetchedResultsController;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self fetchpeople];
//    UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3.jpg"]];
//    [self.tableView.backgroundView addSubview:image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{  if(tableView==self.searchDisplayController.searchResultsTableView){
    
    return 1;
    
}  else{
    return [[self.fetchedResultsController sections]count];
            }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        if ([[self.fetchrearch fetchedObjects] count]!=0) {
            id<NSFetchedResultsSectionInfo> sectoninfo=[[self.fetchrearch sections]objectAtIndex:section];
            return [sectoninfo numberOfObjects];
        }else{return 0;
            
        }
        
        
    }
    else
    {
        id<NSFetchedResultsSectionInfo> sectioninfo=[[self.fetchedResultsController sections] objectAtIndex:section];
        
        return [sectioninfo numberOfObjects];
    }
   

}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{  id test=nil;
    if (tableView==self.searchDisplayController.searchResultsTableView) {
        return nil;
    }
    else{
    id<NSFetchedResultsSectionInfo> sectionInfo=[[self.fetchedResultsController sections]objectAtIndex:section];
    if([(NSString*)[sectionInfo indexTitle] isEqualToString:@"J"]){
        test=[[self.fetchedResultsController sections] objectAtIndex:section];
        
        return @"Jacketing";
    }
    if ([(NSString *)[sectionInfo indexTitle]isEqualToString:@"P"]) {
       
        return @"Pants";
    }
    if ([(NSString *)[sectionInfo indexTitle]isEqualToString:@"S"]) {
        return @"Shoes";
    }
    if ([(NSString *)[sectionInfo indexTitle]isEqualToString:@"U"]) {
            return @"Umbrella";
        }
    if ([(NSString *)[sectionInfo indexTitle]isEqualToString:@"E"]) {
            return @"Eyeglass";
        }
        if ([(NSString *)[sectionInfo indexTitle]isEqualToString:@"G"]) {
            return @"Glove";
        }
        if ([(NSString *)[sectionInfo indexTitle]isEqualToString:@"B"]) {
            return @"Belt";
        }


    

    
    else{
        return nil;
    }
    }
    
   
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Clothes *cloth=nil;
   
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        searchTableViewCell * cellsearch=[[searchTableViewCell alloc] init];
       cellsearch=[self.tableView dequeueReusableCellWithIdentifier:@"search"];
        
        if (self.fetchrearch!=nil) {
            cloth =[self.fetchrearch objectAtIndexPath:indexPath];
            
        }else{
            cloth=nil;
        }
        
       
    
        
       NSLog(@"clothname%@",cloth.name);
          // NSData *image=cloth.image;
          //cellsearch.image.image=[UIImage imageWithData:image];
            cellsearch.name.text=cloth.name;
       // cellsearch.describe.text=cloth.describe;
            
     
        
   return cellsearch;
        
    }

    else{PickYourClothesCoreDataTableViewCell *cell=nil;
     

       cell=[tableView dequeueReusableCellWithIdentifier:@"Celler" forIndexPath:indexPath];
        cloth = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        cell.name.text=cloth.name;
      
//        TQStarRatingView *starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(0, 0, cell.rate.frame.size.width,cell.rate.frame.size.height)numberOfStar:5];
//        [starRatingView setScore:([cloth.rate floatValue]/5) withAnimation:NO];
        [cell.start setScore:([cloth.rate floatValue]/5) withAnimation:NO];
        //starRatingView.userInteractionEnabled=NO;
        //[cell.rate addSubview:starRatingView];
        NSDate *date=cloth.addTime;
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
        NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
        comps = [calendar components:unitFlags fromDate:date];
        int hour = [comps hour];
        
        int year = [comps year];
        int month = [comps    month];
        NSString *m=[self mothcase:month];
        int day = [comps day];
        cell.addTime.text=[NSString stringWithFormat:@"add time:%i/%@/%i/%i",hour,m,day,year];
        UIImage *check=[[UIImage alloc] init];
        if (cloth.useTime.integerValue<3) {
            check=[UIImage imageNamed:@"33-cabinet.png"];
        }else{
            check=[UIImage imageNamed:@"118-coat-hanger.png"];
        }
        UIImageView *i=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        i.image=check;
        cell.landryimage.image=check;
       
        
        
        
      // cell.describe.text=cloth.brandseries;
       NSData *image=cloth.image;
       cell.image.image=[UIImage imageWithData:image];
        
        NSArray *clothes=[self.fetchedResultsController fetchedObjects];
        NSLog(@"%i",[clothes count]);

      return  cell;
    }
    
    
}
-(NSString *) mothcase:(int) month
{  NSString *m;
        NSString *t[]={@"JAN",@"FEB",@"MAR",@"APR",@"MAY",@"JUN",@"JUL",@"AUG",@"SEP",@"OCT",@"NOV",@"DEC"};
    for (int i=1; i<13; i++) {
        if (month==i) {
            m=t[i-1];
            return m;
        }
        
    }
    return nil;
}

#pragma search;


-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
    self.fetchrearch=nil;
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] init];
    NSManagedObjectContext *moc=kAppDelegate.managedObjectContext;
    
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Clothes" inManagedObjectContext:moc];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:20];
    
   NSSortDescriptor *sortDescriptor=[[NSSortDescriptor alloc]initWithKey:@"name" ascending:NO];
    //NSSortDescriptor *sortDescrip=[[NSSortDescriptor alloc]initWithKey:@"kindOf" ascending:YES];
    
    NSArray *sortDescription=[NSArray arrayWithObjects:sortDescriptor,nil];
    [fetchRequest setSortDescriptors:sortDescription];
    
       if (![scope isEqualToString:@"Jacketing"]&&![scope isEqualToString:@"Pants"]&&![scope isEqualToString:@"Shoes"]) {
        NSPredicate *predicate=[NSPredicate predicateWithFormat:@"name contains[c] %@",searchText];
        [fetchRequest setPredicate:predicate];
        NSLog(@"else:%@",scope);
    }else {
        NSPredicate *predicate=[NSPredicate predicateWithFormat:@"kindOf =%@ AND name contains[c] %@",scope,searchText];
        [fetchRequest setPredicate:predicate];
        NSLog(@"%@",scope);
    }
    
    NSFetchedResultsController *aFetched=[[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:moc sectionNameKeyPath:@"name" cacheName:nil];
    aFetched.delegate=self;
    self.fetchrearch=aFetched;
    
    NSError *error=nil;
    if (![self.fetchrearch performFetch:&error]) {
        abort();
        
    }
//    _fetchrearch=[NSMutableArray arrayWithCapacity:[[self.fetchrearch fetchedObjects] count]];
//    _filtarray=[self.fetchrearch fetchedObjects];
//   Clothes *a= (Clothes *)_filtarray[0];
//    a.brand;
    
   }

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    return YES;
}
-(BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}



#pragma forsegue;
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showdetail"]&&![self.searchDisplayController isActive]) {
       
        
        NSIndexPath *indexpath=[self.tableView indexPathForSelectedRow];
        Clothes *cloth=[[self fetchedResultsController]objectAtIndexPath:indexpath];
        ShowDetailViewController *moredetail=(ShowDetailViewController *)[segue destinationViewController];
        
       [moredetail setClothDetailID:[cloth objectID]];
        
    }
    if ([self.searchDisplayController isActive]) {
      NSIndexPath *indexpath=[self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
//        
//        Clothes *cloth=[_fetchrearch objectAtIndexPath:indexpath];
        
        NSLog(@"%@",indexpath);
//        _clothpara=[_fetchrearch objectAtInexPath:indexpath];
        Clothes *cloth=[[self fetchrearch] objectAtIndexPath:indexpath];
        ShowDetailViewController *moredetai=(ShowDetailViewController *)[segue destinationViewController];
        
        [moredetai setClothDetailID:[cloth objectID]];
        
        
    }

}



#pragma responding to core data changes

-(void) controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}
-(void) controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}
-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView=self.tableView;
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:
            [self configureCell:(PickYourClothesCoreDataTableViewCell *)[tableView cellForRowAtIndexPath:indexPath] atIndex:indexPath];
            break;
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSManagedObjectContext *context =
        [self.fetchedResultsController managedObjectContext];
        
        NSManagedObject *objectToBeDeleted =
        [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [context deleteObject:objectToBeDeleted];
        
        NSError *error = nil;
        if (![context save:&error]) {
           
        }
    }
    

}


#pragma fetch;

- (NSFetchedResultsController *)fetchedResultsController
{
    if (__fetchedResultsController!=nil) {
        return __fetchedResultsController;
    }
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] init];
    NSManagedObjectContext *moc=kAppDelegate.managedObjectContext;
    
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Clothes" inManagedObjectContext:moc];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:20];
    
    NSPredicate *pre=[NSPredicate predicateWithFormat:@"belong ==%@",_peo];
    [fetchRequest setPredicate:pre];
    
    //NSSortDescriptor *sortDescriptor=[[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    NSSortDescriptor *sortDescr=[[NSSortDescriptor alloc]initWithKey:@"kindOf" ascending:YES];
    
    
    NSArray *sortDescription=[NSArray arrayWithObjects:sortDescr,nil];
    [fetchRequest setSortDescriptors:sortDescription];
    



    NSFetchedResultsController *aFetched=[[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:moc sectionNameKeyPath:@"kindOf" cacheName:nil];
    aFetched.delegate=self;
    self.fetchedResultsController=aFetched;
    NSError *error=nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        abort();
    }
    
    return __fetchedResultsController;
    
}
-(void) configureCell:(PickYourClothesCoreDataTableViewCell *)cell atIndex:(NSIndexPath *)indexpath
{
    
    Clothes *cloth =
    [self.fetchedResultsController objectAtIndexPath:indexpath];
    NSData *image=cloth.image;
    cell.image.image=[UIImage imageWithData:image];
    cell.name.text=cloth.name;
    //cell.describe.text=cloth.brand;
    
    
    UIImage *check=[[UIImage alloc] init];
    if (cloth.useTime.integerValue<3) {
        check=[UIImage imageNamed:@"33-cabinet.png"];
    }else{
        check=[UIImage imageNamed:@"118-coat-hanger.png"];
    }
    UIImageView *i=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    i.image=check;
    cell.landryimage.image=check;
    
//    TQStarRatingView *starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(0, 0, cell.rate.frame.size.width,cell.rate.frame.size.height)numberOfStar:5];
    //[starRatingView setScore:([cloth.rate floatValue]/5) withAnimation:NO];
    [cell.start setScore:([cloth.rate floatValue]/5) withAnimation:NO];
   // starRatingView.userInteractionEnabled=NO;
    
    
    //[cell.rate addSubview:starRatingView];
    
    [_cloth addObject:cloth.name];
    
    
}
- (IBAction)signout:(id)sender {
    UIActionSheet *action=[[UIActionSheet alloc] initWithTitle:@"Do you want to sign out" delegate:self cancelButtonTitle:@"No" destructiveButtonTitle:@"Yes" otherButtonTitles: nil];
    [action showInView:self.view];
}
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 1:
            
            break;
            
        case 0:
            [self performSegueWithIdentifier:@"signout" sender:self];
            break;
    }
}

#pragma fetch people;
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
    if ([ps count]!=0) {
         _peo=[ps objectAtIndex:0];
    }
   
    
}

@end
