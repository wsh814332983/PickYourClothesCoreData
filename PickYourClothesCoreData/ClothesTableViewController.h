//
//  ClothesTableViewController.h
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/6/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickYourClothesCoreDataTableViewCell.h"
#import "Clothes.h"
#import "ShowDetailViewController.h"
<<<<<<< HEAD
=======
#import <QuartzCore/QuartzCore.h>
>>>>>>> FETCH_HEAD

@interface ClothesTableViewController : UITableViewController <NSFetchedResultsControllerDelegate,UISearchBarDelegate,UISearchDisplayDelegate,UIActionSheetDelegate>
- (IBAction)signout:(id)sender;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong,nonatomic) NSFetchedResultsController *fetchrearch;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong,nonatomic) NSMutableArray *filtarray;
@property (strong,nonatomic) NSMutableArray *cloth;

<<<<<<< HEAD
=======


>>>>>>> FETCH_HEAD
@property (weak,nonatomic) NSString *name;
@property (weak,nonatomic) Clothes *clothpara;
@end
