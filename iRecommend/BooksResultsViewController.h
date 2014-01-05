//
//  BooksResultsViewController.h
//  iRecommend
//
//  Created by Bhavik Shah on 3/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BooksResultsViewController : UITableViewController {

    NSMutableArray *booksTitleArray;
    NSMutableArray *booksAuthorArray;
    NSMutableArray *booksImageArray;
    NSString *selectedTitle;
    NSString *selectedImage;
    NSString *selectedAuthor;

    NSMutableArray *moviesResultsArray;

}
@property(nonatomic, retain)NSMutableArray *booksTitleArray;
@property(nonatomic, retain)NSMutableArray *booksAuthorArray;
@property(nonatomic, retain)NSMutableArray *booksImageArray;
@property(nonatomic, copy)NSString *selectedTitle;
@property(nonatomic, retain)NSString *selectedImage;
@property(nonatomic, retain)NSString *selectedAuthor;

@property(nonatomic, retain)NSMutableArray *moviesResultsArray;

@end
