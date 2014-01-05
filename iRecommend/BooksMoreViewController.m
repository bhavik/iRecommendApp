//
//  BooksMoreViewController.m
//  iRecommend
//
//  Created by Bhavik Shah on 3/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#import "BooksMoreViewController.h"
#import "ResultsViewController.h"

#import "BooksResultsViewController.h"

#import "GTLBooks.h"

#import "Constants.h"
#import "SBJSON.h"

@implementation BooksMoreViewController

@synthesize booksTitleArray;
@synthesize booksImageArray;
@synthesize booksAuthorArray;
@synthesize moviesResultsArray;
@synthesize placesResultsArray;

@synthesize searchDisplayController;
@synthesize savedSearchTerm;
@synthesize feedArray;
@synthesize selectedCategory;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil selected:(NSString *)selected 
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization        
    }
    NSLog(@"BooksMoreViewController.m: selectedCategory is %@", selected);
    self.selectedCategory = selected;
    
    return self;

}

- (void)dealloc
{
    [searchDisplayController release];
    [searchBar release];
    [savedSearchTerm release];
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
    NSArray *feed = [self downloadRecommendFeed];
    //NSLog(@"Here is the title of the feed: %@", [feed valueForKey:@"name"]);
    //NSMutableArray *feedArray  = [[NSMutableArray alloc] init];
     
    if ([self feedArray] == nil)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [self setFeedArray:array];
        [array release], array = nil;
    }    
    for (id object in feed) {
        [feedArray addObject:object];
    }
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    // Restore search term
    if ([self savedSearchTerm])
    {
        [[[self searchDisplayController] searchBar] setText:[self savedSearchTerm]];
    }
}

- (NSString *)stringWithUrl:(NSURL *)url
{
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
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

- (NSArray *) downloadRecommendFeed 
{
    NSArray *returnedArray = [[NSMutableArray alloc] init];
	id response = [self objectWithUrl:[NSURL URLWithString:RECOMMENDAPI_DEVELOPMENT_URL]];
    if ([response isKindOfClass:[NSArray class]]) {
        returnedArray = (NSArray *) response;
    }
    
    return returnedArray;
}
- (void)viewDidUnload
{
    booksTitleArray = nil;
    booksImageArray = nil;
    booksAuthorArray = nil;
    searchBar = nil;
    
    [booksTitleArray release];
    [booksImageArray release];
    [booksAuthorArray release];

    [super viewDidUnload];
    
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self setSavedSearchTerm:[[[self searchDisplayController] searchBar] text]];
	
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
/*
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller 
shouldReloadTableForSearchString:(NSString *)searchString
{
    NSLog(@"Inside searchDisplayController");
    [self handleSearchForTerm:searchString];
    
    return YES;
}
*/
- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    
    [self handleSearchForTerm:theSearchBar.text];
}

- (void)handleSearchForTerm:(NSString *)searchTerm
{
    NSLog(@"SELECTED CATEGORY IS %@", selectedCategory);
    
    if (selectedCategory == @"Books") {
        [self handleBookSearchForTerm:searchTerm];
    }
    else if (selectedCategory == @"Restaurants") {
        [self handleRestaurantSearchForTerm:searchTerm];
    }
    else if (selectedCategory == @"Movies") {
        [self handleMoviesSearchForTerm:searchTerm];
    }
}
- (void)handleBookSearchForTerm:(NSString *)searchTerm
{

    if ([self booksTitleArray] == nil)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [self setBooksTitleArray:array];
        [array release], array = nil;
    }
    if ([self booksImageArray] == nil)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [self setBooksImageArray:array];
        [array release], array = nil;
    }
    if ([self booksAuthorArray] == nil)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [self setBooksAuthorArray:array];
        [array release], array = nil;
    }
	
	/*
    [[self booksTitleArray] removeAllObjects];
	
    if ([[self savedSearchTerm] length] != 0)
    {
        [[self booksTitleArray] addObject:savedSearchTerm];
    }
    */
    
    GTLServiceBooks *service = [[GTLServiceBooks alloc] init];
    
    GTLQueryBooks *query = 
    [GTLQueryBooks queryForVolumesListWithQ:searchTerm];
    //query.filter = kGTLBooksFilterFreeEbooks;
    
    [service executeQuery:query
        completionHandler:^(GTLServiceTicket *ticket,
                            id object, NSError *error) {
            // callback
            if (error == nil) {
                GTLBooksVolumes *results = object;
                for (GTLBooksVolume *volume in results) {
                    NSString *titleStr = volume.volumeInfo.title;
                    [booksTitleArray addObject:titleStr];
                    NSString *imglinks = volume.volumeInfo.imageLinks.thumbnail;
                    if (imglinks != nil) {
                        [booksImageArray addObject:imglinks];
                    } 
                    else {
                        //need to add blank image file and add the object here instead of titleStr
                        [booksImageArray addObject:titleStr];
                    }
                    NSArray *authorArray = volume.volumeInfo.authors;
                    if (authorArray) {
                        [booksAuthorArray addObject:authorArray];
                    }
                }
            }            
            BooksResultsViewController *booksResultsViewController = [[BooksResultsViewController alloc] initWithNibName:@"BooksResultsViewController" bundle:nil];
            [self.navigationController pushViewController:booksResultsViewController animated:YES];
            booksResultsViewController.booksTitleArray = self.booksTitleArray;
            booksResultsViewController.booksImageArray = self.booksImageArray;
            booksResultsViewController.booksAuthorArray = self.booksAuthorArray;
            booksTitleArray = nil;
            booksImageArray = nil;
            booksAuthorArray = nil;
            
            searchBar = nil;
        }];
    
}
- (void)handleMoviesSearchForTerm:(NSString *)searchTerm
{
    
    if ([self moviesResultsArray] == nil)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [self setMoviesResultsArray:array];
        [array release], array = nil;
    }
    
    NSString *moviesQueryURLString = [NSString stringWithFormat:@"%@%@%@%@%@", ROTTEN_TOMATOES_MOVIES_SEARCH, @"?apikey=", API_KEY_ROTTEN_TOMATOES, @"&q=", searchTerm  , @"&page_limit=1"];
    
    NSString *encodedParam =  [moviesQueryURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSString *urlString = [NSString stringWithFormat: @"%@", encodedParam];
	NSLog(@"URL IS %@", urlString);
    
	NSURL *moviesQueryURL = [NSURL URLWithString:urlString];
    id response = [self objectWithUrl:moviesQueryURL];

    if ([response isKindOfClass:[NSDictionary class]]) {
        //returnedArray = (NSArray *) response;
        //push the My Recommendation view here if recommendation was added properly
        NSLog(@"response is dictionary class");
        moviesResultsArray = [[response objectForKey:@"movies"] retain];
    }
    ResultsViewController *resultsViewController = [[ResultsViewController alloc] initWithNibName:@"ResultsViewController" bundle:nil];
    [self.navigationController pushViewController:resultsViewController animated:YES];
    resultsViewController.moviesResultsArray = self.moviesResultsArray;
    
}

- (void)handleRestaurantSearchForTerm:(NSString *)searchTerm
{
    //Need to decide on which api to use to get restaurant information (could be Foursquare?)
    
    if ([self placesResultsArray] == nil)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [self setPlacesResultsArray:array];
        [array release], array = nil;
    }
    NSString *restaurantQueryURLString = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", FOURSQURE_VENUE_SEARCH, @"client_id=", API_CLIENT_ID_FOURSQURE, @"&client_secret=", API_CLIENT_SECRET_FOURSQURE, @"&query=", searchTerm  , @"&near=streamwood,il"];
    
    NSString *encodedParam =  [restaurantQueryURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSString *urlString = [NSString stringWithFormat: @"%@", encodedParam];
	NSLog(@"RESTUARANT URL IS %@", urlString);
    
	NSURL *restaurantQueryURL = [NSURL URLWithString:urlString];
    id response = [self objectWithUrl:restaurantQueryURL];
    
    if ([response isKindOfClass:[NSDictionary class]]) {
        //returnedArray = (NSArray *) response;
        //push the My Recommendation view here if recommendation was added properly
        NSLog(@"RESTAURANT response is dictionary class");
        placesResultsArray = [[response objectForKey:@"venues"] retain];
    }
    ResultsViewController *resultsViewController = [[ResultsViewController alloc] initWithNibName:@"ResultsViewController" bundle:nil];
    [self.navigationController pushViewController:resultsViewController animated:YES];
    resultsViewController.moviesResultsArray = self.placesResultsArray;
    

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [feedArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    //NSLog(@"adding to cell %@", [booksTitleArray objectAtIndex:indexPath.row]);
    
    //cell.textLabel.text = [booksTitleArray objectAtIndex:indexPath.row];   
    NSDictionary *dict = [feedArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dict objectForKey:@"name"];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
