//
//  BooksDetailViewController.h
//  iRecommend
//
//  Created by Bhavik Shah on 3/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BooksResultsViewController.h"


@interface BooksDetailViewController : UIViewController {
    NSString *selectedTitle;
    
    IBOutlet UIImageView *bookImage;
    IBOutlet UIView *bookDetailsView;
    IBOutlet UILabel *bookLabel;
    IBOutlet UILabel *bookAuthorLabel;
    NSString *bookLabelText;
    UIImage *bookImg;
    NSString *bookAuthor;
    NSString *bookImageURLString;
    

    
}
@property(nonatomic, retain)NSString *selectedTitle;
@property(nonatomic, retain)NSString *bookLabelText;
@property(nonatomic, retain)UIImageView *bookImage;
@property(nonatomic, retain)UILabel *bookLabel;
@property(nonatomic, retain)UILabel *bookAuthorLabel;
@property(nonatomic, retain)UIImage *bookImg;
@property(nonatomic, retain)NSString *bookAuthor;
@property(nonatomic, retain)NSString *bookImageURLString;

- (void)addRecommendations;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString *)name bookLabel:(NSString *)bookLabel bookImage:(UIImage *)bookImg bookAuthor:(NSString *)bookAuthor;


@end
