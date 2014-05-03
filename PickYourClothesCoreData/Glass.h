//
//  Glass.h
//  PickYourClothesCoreData
//
//  Created by tianxiang zhang on 4/5/14.
//  Copyright (c) 2014 tianxiang zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Clothes.h"


@interface Glass : Clothes

@property (nonatomic, retain) NSString * style;
@property (nonatomic, retain) NSNumber * uniform;

@end
