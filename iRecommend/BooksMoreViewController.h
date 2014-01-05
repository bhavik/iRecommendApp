//
//  BooksMoreViewController.h
//  iRecommend
//
//  Created by Bhavik Shah on 3/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface BooksMoreViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate> {
    
    IBOutlet UISearchBar *searchBar;
    IBOutlet UITableView *tableView;
    
    NSMutableArray *booksTitleArray;
    NSMutableArray *booksAuthorArray;
    NSMutableArray *booksImageArray;
    
    NSMutableArray *moviesResultsArray;
    NSMutableArray *placesResultsArray;
    
    IBOutlet UISearchDisplayController *searchDisplayController;
    NSString *savedSearchTerm;
    NSMutableArray *feedArray;
    NSString *selectedCategory;
}

@property(nonatomic, retain)NSMutableArray *booksTitleArray;
@property(nonatomic, retain)NSMutableArray *booksAuthorArray;
@property(nonatomic, retain)NSMutableArray *booksImageArray;

@property(nonatomic, retain)NSMutableArray *moviesResultsArray;
@property(nonatomic, retain)NSMutableArray *placesResultsArray;

@property(nonatomic, retain)NSMutableArray *feedArray;

@property(nonatomic, copy)NSString *savedSearchTerm;
@property(nonatomic, copy)NSString *selectedCategory;
//@property(nonatomic, retain) IBOutlet UITableView *tableView;


@property (nonatomic, retain) IBOutlet UISearchDisplayController *searchDisplayController;

- (void)handleSearchForTerm:(NSString *)searchTerm;
- (void)handleBookSearchForTerm:(NSString *)searchTerm;
- (void)handleRestaurantSearchForTerm:(NSString *)searchTerm;
- (void)handleMoviesSearchForTerm:(NSString *)searchTerm;
- (NSArray *)downloadRecommendFeed;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil selected:(NSString *)selected;


@end
