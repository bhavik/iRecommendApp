//
//  BooksViewController.h
//  iRecommend
//
//  Created by Bhavik Shah on 3/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BooksViewController : UIViewController {
    UISearchBar *sBar;
    NSMutableArray *booksTitleArray;
    NSMutableArray *booksAuthorArray;
    NSMutableArray *booksImageArray;
    
}

@property(nonatomic, retain)NSMutableArray *booksTitleArray;
@property(nonatomic, retain)NSMutableArray *booksAuthorArray;
@property(nonatomic, retain)NSMutableArray *booksImageArray;

@end
