//
//  CityListViewController.m
//
//  Created by Big Watermelon on 11-11-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CListViewController.h"

@interface CListViewController ()
@property (nonatomic, retain) UIImageView* checkImgView;
@property NSUInteger defaultSelectionRow;
@property NSUInteger defaultSelectionSection;
@end

@implementation CListViewController
@synthesize tbView,row;

#define CHECK_TAG 1110

@synthesize cities, keys, checkImgView, curSection, curRow, delegate,tag;
@synthesize defaultSelectionRow, defaultSelectionSection;

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
    [tbView release];
   
    [cities release];
    [keys release];
    [checkImgView release];
     [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  
    [super didReceiveMemoryWarning];
    
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000

    row = NO;
    self.checkImgView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check"]] autorelease];
    
    checkImgView.tag = CHECK_TAG;
       
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Csdict" ofType:@"plist"];

    self.cities = [[[NSDictionary alloc]
                   initWithContentsOfFile:path] autorelease];
    
    
    
    self.keys = [[cities allKeys] sortedArrayUsingSelector:  
                 @selector(compare:)]; 
    
    NSString *defaultCity = [delegate getDefaultCity];
    
    NSLog(@"nochser  %d",self.curSection);
    NSLog(@"%d",self.curRow);
    NSLog(@"city %@",defaultCity);
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:curRow inSection:curSection];
                [self.tbView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
 
    self.keys = nil;
    self.cities = nil;
    self.checkImgView = nil;
    self.tbView = nil;
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
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if ([keys count] == 0) {
        return 1;
    }else{
        return [keys count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    if (keys.count==0) {
        return 1;
    }else{
        NSString *key = [keys objectAtIndex:section];
        NSArray *citySection = [cities objectForKey:key];
        return [citySection count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NSString *key = [keys objectAtIndex:indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    } else {
  
    }
    
  
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:25];
        cell.textLabel.text = [[cities objectForKey:key] objectAtIndex:indexPath.row];
        
    }else if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone){
        
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:18];
        cell.textLabel.text = [[cities objectForKey:key] objectAtIndex:indexPath.row];
        
        
        
    }
    
    if (indexPath.section == curSection && indexPath.row == curRow)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{  
    NSString *key = [keys objectAtIndex:section];
    if (keys.count == 0) {
        return nil;
    }else
        return key;
}  

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView  
{
        
         return keys; 
  
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        
        return 60.0f;
        
    }else if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone){
        
        return 40.0f;
        
    }
    return YES;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    if (row == YES  && self.curRow == indexPath.row) {
        NSIndexPath *prevIndexPath = [NSIndexPath indexPathForRow:curRow inSection:curSection];
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:prevIndexPath];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        self.curSection = indexPath.section;
        self.curRow = indexPath.row;
        NSLog(@"section jjj row  %d%d",curSection,curRow);
        self.curRow = 0;
        self.curSection = 0;
        row = NO;
    }
    else{
        row = YES;
        NSIndexPath *prevIndexPath = [NSIndexPath indexPathForRow:curRow inSection:curSection];
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:prevIndexPath];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        self.curSection = indexPath.section;
        self.curRow = indexPath.row;
        NSLog(@"section  row  %d%d",curSection,curRow);
        
        cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

    if (curRow != NSNotFound) {
        if (curSection == 0 && curRow == 0) {
            
            
            
        }else{
            
            NSString* key = [keys objectAtIndex:curSection];
            [delegate citySelectionUpdate:[[cities objectForKey:key] objectAtIndex:curRow]withSection:curSection withRow:curRow withTag:self.tag];
            
            
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];

    
}

- (IBAction)pressReturn:(id)sender {
   
    if (curRow != NSNotFound) {
        if (curSection == 0 && curRow == 0) {
            
          
            
        }else{
            
            NSString* key = [keys objectAtIndex:curSection];
            [delegate citySelectionUpdate:[[cities objectForKey:key] objectAtIndex:curRow]withSection:curSection withRow:curRow withTag:self.tag];
            
            
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
