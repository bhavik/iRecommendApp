//
//  BooksViewController.m
//  iRecommend
//
//  Created by Bhavik Shah on 3/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CategoryViewController.h"
#import "BooksViewController.h"
#import "MoviesViewController.h"
#import "BooksMoreViewController.h"


@implementation CategoryViewController

@synthesize tableViewArray;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    self.title = @"Pick a Category";

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
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"Books",@"Music",@"Movies",@"Games",@"Restaurants", @"Cosmetics", @"Websites", @"Apps", @"Youtube Videos", nil];
    self.tableViewArray = array;
    [array release];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
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
    // Return the number of rows in the section.
    return [tableViewArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.textLabel.text = [tableViewArray objectAtIndex:indexPath.row];
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
    NSString *stringAtIndex = [tableViewArray objectAtIndex:indexPath.row];
  if (stringAtIndex == @"Books") {
      BooksMoreViewController *booksMoreViewController = [[BooksMoreViewController alloc] initWithNibName:@"BooksMoreViewController" bundle:nil selected:stringAtIndex];
        [self.navigationController pushViewController:booksMoreViewController animated:YES];
        [booksMoreViewController release];
    
    }
    else if (stringAtIndex == @"Restaurants") {
        //Will need to rename BooksMoreController to take in anything that can call Google API such as Restaurants for Latitude
        BooksMoreViewController *booksMoreViewController = [[BooksMoreViewController alloc] initWithNibName:@"BooksMoreViewController" bundle:nil selected:stringAtIndex];
        [self.navigationController pushViewController:booksMoreViewController animated:YES];
        [booksMoreViewController release];
        
    }
    else if (stringAtIndex == @"Movies") {
        //Will need to rename BooksMoreController to take in anything that can call Google API such as Restaurants for Latitude
        BooksMoreViewController *booksMoreViewController = [[BooksMoreViewController alloc] initWithNibName:@"BooksMoreViewController" bundle:nil selected:stringAtIndex];
        [self.navigationController pushViewController:booksMoreViewController animated:YES];
        [booksMoreViewController release];
        
    }
     // ...
     // Pass the selected object to the new view controller.
    /*
     
    NSString *message = [NSString stringWithFormat:@"You selected %@",[tableViewArray objectAtIndex:indexPath.row]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                          
                                                    message: message delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
    
    [alert show];
    
    [alert release];
     */
}

@end
