//
//  BooksViewController.m
//  iRecommend
//
//  Created by Bhavik Shah on 3/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BooksViewController.h"
#import "GTLBooks.h"


@implementation BooksViewController
@synthesize booksTitleArray;
@synthesize booksImageArray;
@synthesize booksAuthorArray;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    self.title=@"Recommend a Book";

    NSMutableArray *booksTitleArray;
    booksTitleArray = [[NSMutableArray alloc]init];    
    NSMutableArray *booksImageArray;
    booksImageArray = [[NSMutableArray alloc]init];    
    
    GTLServiceBooks *service = [[GTLServiceBooks alloc] init];
    
    GTLQueryBooks *query = 
    [GTLQueryBooks queryForVolumesListWithQ:@"Malcolm Gladwell"];
    //query.filter = kGTLBooksFilterFreeEbooks;
    
    [service executeQuery:query
        completionHandler:^(GTLServiceTicket *ticket,
                            id object, NSError *error) {
            // callback
            if (error == nil) {
                GTLBooksVolumes *results = object;
                for (GTLBooksVolume *volume in results) {

                }
            }
        }];
    
    [super viewDidLoad];
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
