//
//  ResultsDetailViewController.h
//  iRecommend
//
//  Created by Bhavik Shah on 4/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ResultsDetailViewController : UIViewController {

    
    IBOutlet UIImageView *imgView;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *subTitleLabel;
    NSString *mainTitle;
    UIImage *img;
    NSString *subTite;
    NSString *urlString;
}

@property(nonatomic, retain)UIImageView *imgView;
@property(nonatomic, retain)UILabel *titleLabel;
@property(nonatomic, retain)UILabel *subTitleLabel;
@property(nonatomic, retain)NSString *mainTitle;
@property(nonatomic, retain)UIImage *img;
@property(nonatomic, retain)NSString *subTitle;
@property(nonatomic, retain)NSString *urlString;


- (void)addRecommendations;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString *)title subtitle:(NSString *)subtitle img:(UIImage *) imgSelected;

@end
