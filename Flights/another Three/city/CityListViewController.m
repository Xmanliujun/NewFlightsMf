//
//  CityListViewController.m
//
//  Created by Big Watermelon on 11-11-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CityListViewController.h"

@interface CityListViewController ()
@property (nonatomic, retain) UIImageView* checkImgView;
@property NSUInteger defaultSelectionRow;
@property NSUInteger defaultSelectionSection;
@end

@implementation CityListViewController
@synthesize tbView,tag,row;

#define CHECK_TAG 1110

@synthesize cities, keys, checkImgView, curSection, curRow, delegate;
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
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
   
     row = NO;
    checkImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check1.png"]];
    checkImgView.tag = CHECK_TAG;
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict"   
                                                   ofType:@"plist"]; 
    self.cities = [[[NSDictionary alloc]
                   initWithContentsOfFile:path] autorelease];
    
    
    
    self.keys = [[cities allKeys] sortedArrayUsingSelector:  
                 @selector(compare:)]; 
    
    NSString *defaultCity = [delegate getDefaultCity];
    
    
    
    NSLog(@"keys %d",[keys count]);
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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.返回section的个数
    return [keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.返回section每个里面内容的个数
    
    NSString *key = [keys objectAtIndex:section];  
    NSArray *citySection = [cities objectForKey:key];
    return [citySection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NSString *key = [keys objectAtIndex:indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    } 
    
    
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.textLabel.text = [[cities objectForKey:key] objectAtIndex:indexPath.row];
    
    if (indexPath.section == curSection && indexPath.row == curRow)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{  
    NSString *key = [keys objectAtIndex:section];  
    return key;  
}  

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView  
{  
    return keys;  
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
            
            NSLog(@"城市名代理启动");
            
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
            
            NSLog(@"城市名代理启动");
            
        }else{
        
            NSString* key = [keys objectAtIndex:curSection];
            [delegate citySelectionUpdate:[[cities objectForKey:key] objectAtIndex:curRow]withSection:curSection withRow:curRow withTag:self.tag];
        
        
        }
      
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
