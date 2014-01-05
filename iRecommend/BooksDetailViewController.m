//
//  BooksDetailViewController.m
//  iRecommend
//
//  Created by Bhavik Shah on 3/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BooksDetailViewController.h"
#import "BooksResultsViewController.h"
#import "Constants.h"
#import "MyRecommendations.h"

#import "SBJSON.h"


@implementation BooksDetailViewController
@synthesize selectedTitle;
@synthesize bookImage;
@synthesize bookLabel;
@synthesize bookAuthorLabel;
@synthesize bookLabelText;
@synthesize bookImg;
@synthesize bookAuthor;
@synthesize bookImageURLString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString *)name bookLabel:(NSString *)bookNameText bookImage:(UIImage *)bookSelectedImage bookAuthor:(NSString *)bookSelectedAuthor
{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization        
    }
    NSLog(@"title is %@", bookLabelText);

    bookLabelText = bookNameText;
    bookImg = bookSelectedImage;
    bookAuthor = bookSelectedAuthor;
    
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
    
    NSString *recommendationURLString = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", RECOMMENDAPI_CREATE_DEVELOPMENT_URL, @"?name=", bookLabelText, @"&info=", bookAuthor  , @"&imageurl=", bookImageURLString, @"&catId=1"];
    
    NSString *encodedParam =  [recommendationURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSString *urlString = [NSString stringWithFormat: @"%@", encodedParam];
	NSLog(@"URL IS %@", urlString);
    
	NSURL *url = [NSURL URLWithString:urlString];
	    
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
    [bookAuthor release];
    [bookAuthorLabel release];
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
    bookLabel.text = bookLabelText;
    bookImage.image = bookImg;
    bookAuthorLabel.text = bookAuthor;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [bookImage release];
    bookImage = nil;
    [bookDetailsView release];
    bookDetailsView = nil;
    [bookLabel release];
    bookLabel = nil;

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
