//
//  Recommendations.h
//  iRecommend
//
//  Created by Bhavik Shah on 1/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Recommendations : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSNumber * rec_id;
@property (nonatomic, retain) NSNumber * user_id;

@end
