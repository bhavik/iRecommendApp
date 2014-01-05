//
//  BooksResultsViewController.m
//  iRecommend
//
//  Created by Bhavik Shah on 3/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BooksResultsViewController.h"
#import "BooksDetailViewController.h"

@implementation BooksResultsViewController
@synthesize booksTitleArray;
@synthesize booksAuthorArray;
@synthesize booksImageArray;
@synthesize selectedTitle;
@synthesize selectedImage;
@synthesize selectedAuthor;

@synthesize moviesResultsArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    NSLog(@"inside results");
    self = [super initWithStyle:style];
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
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [selectedTitle release];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [booksTitleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.textLabel.text = [booksTitleArray objectAtIndex:indexPath.row];    
    UIImage *theImage = [UIImage imageNamed:[booksImageArray objectAtIndex:indexPath.row]];
    NSString *imgStr = [booksImageArray objectAtIndex:indexPath.row];
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgStr]]];
    NSArray *authorArray;
    if ([booksAuthorArray objectAtIndex:indexPath.row] != nil) {
        authorArray = [booksAuthorArray objectAtIndex:indexPath.row];
    }         
    NSString *authorStr;
    if (authorArray) {
        authorStr = [authorArray objectAtIndex:0];
    }
    if (img) {
        cell.imageView.image = img;
    }
    if (authorStr) {
        cell.detailTextLabel.text = authorStr;
    }
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
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
    self.selectedTitle = [booksTitleArray objectAtIndex:indexPath.row];
    //NSLog(@"title is %@", selectedTitle);
    
    NSString *bookImageStr = [booksImageArray objectAtIndex:indexPath.row];
    UIImage *bookImg = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:bookImageStr]]];
    NSArray *authorArray = [booksAuthorArray objectAtIndex:indexPath.row];
    
    NSString *authorStr = @"test";
    if (authorArray) {
        authorStr = [authorArray objectAtIndex:0];
    }
    
    
    BooksDetailViewController *booksDetailViewController = [[BooksDetailViewController alloc] initWithNibName:@"BooksDetailViewController" bundle:nil title:selectedTitle bookLabel:selectedTitle bookImage:bookImg bookAuthor:authorStr];
    
    booksDetailViewController.title = selectedTitle;
    booksDetailViewController.bookImage.image = bookImg;
    booksDetailViewController.bookLabel.text = selectedTitle;
    booksDetailViewController.bookImageURLString = bookImageStr;
    
    [self.navigationController pushViewController:booksDetailViewController animated:YES];    
     
    [booksDetailViewController release];

    
       
}

@end
