//
//  ResultsViewController.h
//  iRecommend
//
//  Created by Bhavik Shah on 3/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ResultsViewController : UITableViewController {
    
    
    NSMutableArray *moviesResultsArray;
    
}
@property(nonatomic, retain)NSMutableArray *moviesResultsArray;

@end
