//
//  ResultsDetailViewController.m
//  iRecommend
//
//  Created by Bhavik Shah on 4/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ResultsDetailViewController.h"
#import "Constants.h"
#import "MyRecommendations.h"
#import "SBJSON.h"

@implementation ResultsDetailViewController
@synthesize imgView;
@synthesize titleLabel;
@synthesize subTitleLabel;
@synthesize mainTitle;
@synthesize img;
@synthesize subTitle;
@synthesize urlString;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString *)title subtitle:(NSString *)subtitle img:(UIImage *) imgSelected
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    

    self.mainTitle = title;
    self.subTitle = subtitle;
    self.img = imgSelected;
    
    NSLog(@"MAIN title is %@", mainTitle);
    
    return self;
}


- (NSString *)stringWithUrl:(NSURL *)url
{
    
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url
                                                              cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                                          timeoutInterval:30];
    // Fetch the JSON response
	NSData *urlData;
	NSURLResponse *response;
	NSError *error;
    
	// Make synchronous request
	urlData = [NSURLConnection sendSynchronousRequest:urlRequest
                                    returningResponse:&response
                                                error:&error];
    NSLog(@"Before passing param");
    
    [urlRequest setHTTPMethod:@"POST"];
    NSString *postString = @"name=catching%20fire&info=suzanne&imageurl=suzanne&catId=1";
    [urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
 	// Construct a String around the Data from the response
	return [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
}

- (id) objectWithUrl:(NSURL *)url
{
	SBJSON *jsonParser = [SBJSON new];
	NSString *jsonString = [self stringWithUrl:url];
    NSLog(@"Inside objectWithURL %@", jsonString);
    
	// Parse the JSON into an Object
	return [jsonParser objectWithString:jsonString error:NULL];
}

- (void) addRecommendations
{
    NSLog(@"Add Recommendation begin");
    //NSArray *returnedArray = [[NSMutableArray alloc] init];
    //  NSString *addRecommendationURL = @"/recommendation/addRecommendation";
    
    //NSString *recommendationURL = [NSString stringWithFormat:@"%@%@", RECOMMENDAPI_DEVELOPMENT_URL, addRecommendationURL];
    // NSURL *recommendationURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@", RECOMMENDAPI_DEVELOPMENT_URL, addRecommendationURL, @"?name=", bookLabelText, @"&info=", bookAuthor, @"imageurl=", bookAuthor, @"catId=1"]];
    //NSURL *recommendationURL = [NSString stringWithFormat:@"%@", addRecommendationURL ];
    
    NSString *recommendationURLString = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", RECOMMENDAPI_CREATE_DEVELOPMENT_URL, @"?name=", mainTitle, @"&info=", subTitle  , @"&imageurl=", urlString, @"&catId=2"];
    NSLog(@"STRING IS %@", recommendationURLString);
    
    NSString *encodedParam =  [recommendationURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
	NSString *recommendUrlString = [NSString stringWithFormat: @"%@", encodedParam];
    
	NSURL *url = [NSURL URLWithString:recommendUrlString];
    
    id response = [self objectWithUrl:url];
    
    if ([response isKindOfClass:[NSArray class]]) {
        //returnedArray = (NSArray *) response;
        //push the My Recommendation view here if recommendation was added properly
        NSLog(@"response is array class");
        
        
    }
    MyRecommendations *myRecommendations = [[MyRecommendations alloc] initWithNibName:@"MyRecommendations" bundle:nil];
    [self.navigationController pushViewController:myRecommendations animated:YES  ];    
	[myRecommendations release];
}



- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    titleLabel.text = mainTitle;
    subTitleLabel.text = subTitle;
    imgView.image = img;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
