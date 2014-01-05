//
//  AddRecommendationsView.h
//  iRecommend
//
//  Created by Bhavik Shah on 1/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddRecommendationsView : UIViewController {
    IBOutlet UITextField *recName;
    IBOutlet UITextField *recDesc;
    
}
@property (nonatomic, retain) UITextField *recName;
@property (nonatomic, retain) UITextField *recDesc;

-(IBAction)switchback:(id)sender;
-(IBAction)screentouch:(id) sender;

@end
