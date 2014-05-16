//
//  People.h
<<<<<<< HEAD
//  Pods
//
//  Created by tianxiang zhang on 5/4/14.
//
=======
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/5/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
>>>>>>> FETCH_HEAD
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Clothes;

@interface People : NSManagedObject

<<<<<<< HEAD
@property (nonatomic, retain) id image;
@property (nonatomic, retain) NSString * mail;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSNumber * age;
=======
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) id image;
>>>>>>> FETCH_HEAD
@property (nonatomic, retain) NSSet *owner;
@end

@interface People (CoreDataGeneratedAccessors)

- (void)addOwnerObject:(Clothes *)value;
- (void)removeOwnerObject:(Clothes *)value;
- (void)addOwner:(NSSet *)values;
- (void)removeOwner:(NSSet *)values;

@end
