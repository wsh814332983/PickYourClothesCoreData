//
//  Clothes.h
//  PickYourClothesCoreData
//
<<<<<<< HEAD
//  Created by tianxiang zhang on 5/5/14.
=======
//  Created by tianxiang zhang on 5/3/14.
>>>>>>> FETCH_HEAD
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class People;

@interface Clothes : NSManagedObject

@property (nonatomic, retain) NSString * brand;
@property (nonatomic, retain) NSString * brandseries;
@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSString * describe;
@property (nonatomic, retain) id image;
@property (nonatomic, retain) NSString * kindOf;
@property (nonatomic, retain) NSNumber * landry;
@property (nonatomic, retain) NSString * name;
<<<<<<< HEAD
@property (nonatomic, retain) NSNumber * onUse;
=======
>>>>>>> FETCH_HEAD
@property (nonatomic, retain) NSNumber * rate;
@property (nonatomic, retain) NSDate * selectTime;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * useTime;
<<<<<<< HEAD
@property (nonatomic, retain) NSDate * addTime;
=======
@property (nonatomic, retain) NSNumber * onUse;
>>>>>>> FETCH_HEAD
@property (nonatomic, retain) People *belong;

@end
