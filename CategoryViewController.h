//
//  BooksViewController.h
//  iRecommend
//
//  Created by Bhavik Shah on 3/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CategoryViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *tableViewArray;    
}

@property (nonatomic, retain) NSArray *tableViewArray;


@end
