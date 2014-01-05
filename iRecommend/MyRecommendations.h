//
//  MyRecommendations.h
//  iRecommend
//
//  Created by Bhavik Shah on 3/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyRecommendations : UITableViewController {
    IBOutlet UITableView *tableView;
    NSMutableArray *feedArray;
    UINavigationBar *navigationBar;
}

@property(nonatomic, retain)NSMutableArray *feedArray;
@property (nonatomic, retain) UINavigationBar *navigationBar;

@end
