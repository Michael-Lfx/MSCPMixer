//
//  trackTableViewController.m
//  mixerTest005
//
//  Created by Christian Persson on 2012-04-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "trackTableViewController.h"
#import "AppDelegate.h"

@implementation trackTableViewController

@synthesize detailArr;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    UIBarButtonItem *cancelButton =
	[[UIBarButtonItem alloc] initWithTitle: @"Cancel"
                                     style: UIBarButtonItemStylePlain
                                    target: self
                                    action: @selector(cancel:)];
    self.navigationItem.rightBarButtonItem = cancelButton;
    [cancelButton release];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [super viewDidLoad];

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
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


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.detailArr count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    //  return [[detailArr objectAtIndex:section]count];
    int nrOfObjects = [[detailArr objectAtIndex:section]count];
    if (nrOfObjects > 20){
        return 20;
    }
    else{
        return nrOfObjects;     
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGSize size = tableView.frame.size;
    // create the parent view that will hold header Label
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width, 50.0)];
    
    // create the button object
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor clearColor];
    //     headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor blackColor];
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    headerLabel.font = [UIFont fontWithName:@"GothamHTF-Medium" size:(28.0)];
    headerLabel.frame = CGRectMake(10.0, 0.0, size.width, 50.0);
    
    // If you want to align the header text as centered
    // headerLabel.frame = CGRectMake(150.0, 0.0, 300.0, 44.0);
    
    NSMutableArray *sectionArr = [[NSMutableArray alloc]initWithArray:[detailArr objectAtIndex:section]];
    
    NSString *lbl;
    if([[sectionArr objectAtIndex:0] isKindOfClass:[SPTrack class]]){
        lbl = @"Tracks";
        
    }
  
    customView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
    headerLabel.text = [NSString stringWithFormat:lbl]; // i.e. array element
    [customView addSubview:headerLabel];
    
    return customView;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    for (UIView *view in cell.contentView.subviews){
        [view removeFromSuperview];
    }
    
    
    NSString *lbl;
    
    //    NSMutableArray *sectionArr = [[NSMutableArray alloc]initWithArray:[self.detailArr objectAtIndex:indexPath.section]];
    NSArray *sectionArr = [self.detailArr objectAtIndex:indexPath.section];
  
    if([[sectionArr objectAtIndex:0] isKindOfClass:[SPTrack class]]){
        
        SPTrack *track = [sectionArr objectAtIndex:indexPath.row];
        NSString *artists = [[track.artists valueForKey:@"name"] componentsJoinedByString:@","];
        lbl = [NSString stringWithFormat:@"%@ - %@",artists,track.name];
        
        UILabel *cue = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width-110, 10, 100, 20)];
        cue.text = @"Cue Song";
        cue.textAlignment = UITextAlignmentCenter;
        cue.textColor = [UIColor blackColor];
        cue.font = [UIFont fontWithName:@"GothamHTF-Medium" size:(18.0)];
        
        cue.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:cue];
        [cue release];
        
        NSTimeInterval interval = track.duration;
        long min = (long)interval / 60;    // divide two longs, truncates
        long sec = (long)interval % 60;    // remainder of long divide
        NSString* str = [[NSString alloc] initWithFormat:@"%02d:%02d", min, sec];
        
        UILabel *trackDuration = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width-170, 5, 50, 30)];
        trackDuration.text = str;
        trackDuration.textColor = [UIColor whiteColor];
        trackDuration.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:trackDuration];
        trackDuration.font = [UIFont fontWithName:@"GothamHTF-Medium" size:(18.0)];
        [trackDuration release];
        
        
    }
    
    if ([lbl length]== 0){
        NSLog(@"fuck");
    }
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(25, 5, self.view.frame.size.width-220, 30)];
    title.text = lbl;
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"GothamHTF-Medium" size:(18.0)];
    title.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview:title];
    [title release];
    
    //  cell.textLabel.text = lbl;
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
    UITableViewCell* theCell = [tableView cellForRowAtIndexPath:indexPath];
    
    //Then you change the properties (label, text, color etc..) in your case, the background color
    theCell.contentView.backgroundColor = [UIColor whiteColor];
    
    //Deselect the cell so you can see the color change
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSMutableArray *sectionArr = [[NSMutableArray alloc]initWithArray:[detailArr objectAtIndex:indexPath.section]];
    
    if([[sectionArr objectAtIndex:indexPath.row] isKindOfClass:[SPTrack class]]){
        AppDelegate *main = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        SPTrack *track = [sectionArr objectAtIndex:indexPath.row];
        [main addSongFromSearch:track.spotifyURL];
    }
    
    [sectionArr release];
}

- (void)cancel:(id)sender{
    
    AppDelegate *main = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    main.cueController.view.hidden = NO;
    
}

@end