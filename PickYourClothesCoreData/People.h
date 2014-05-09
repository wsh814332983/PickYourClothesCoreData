//
//  People.h
//  Pods
//
//  Created by tianxiang zhang on 5/4/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Clothes;

@interface People : NSManagedObject

@property (nonatomic, retain) id image;
@property (nonatomic, retain) NSString * mail;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSSet *owner;
@end

@interface People (CoreDataGeneratedAccessors)

- (void)addOwnerObject:(Clothes *)value;
- (void)removeOwnerObject:(Clothes *)value;
- (void)addOwner:(NSSet *)values;
- (void)removeOwner:(NSSet *)values;

@end
