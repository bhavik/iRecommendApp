//
//  User.h
//  iRecommend
//
//  Created by Bhavik Shah on 1/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * last_name;
@property (nonatomic, retain) NSString * first_name;
@property (nonatomic, retain) NSNumber * id;

@end
