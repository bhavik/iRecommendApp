//
//  RecCategory.h
//  iRecommend
//
//  Created by Bhavik Shah on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recommendations;

@interface RecCategory : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * cat_name;
@property (nonatomic, retain) NSString * cat_desc;
@property (nonatomic, retain) Recommendations * rec_relation;

@end
