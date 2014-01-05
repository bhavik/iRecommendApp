//
//  SecondViewController.h
//  iRecommend
//
//  Created by Bhavik Shah on 12/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import <CoreData/CoreData.h>


@interface RecommendView : UITableViewController <NSFetchedResultsControllerDelegate> {
    NSManagedObjectContext *managedObjectContext;
}
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
-(IBAction) addRecommendations;



@end
