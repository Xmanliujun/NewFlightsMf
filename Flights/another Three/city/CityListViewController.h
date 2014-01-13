//
//  CityListViewController.h
//  citylistdemo
//
//  Created by BW on 11-11-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CityListViewController : UIViewController {
    NSDictionary *cities;  
    NSArray *keys;
    id delegate;
    UITableView *tbView;
    NSString * tag;
    BOOL row ;
}
@property (nonatomic, retain) IBOutlet UITableView *tbView;
@property (nonatomic,assign)BOOL row;
@property (nonatomic,retain) NSString * tag;
@property (nonatomic, retain) NSDictionary *cities;  
@property (nonatomic, retain) NSArray *keys;
@property (nonatomic, assign) id delegate;
@property NSUInteger curSection;
@property NSUInteger curRow;
- (IBAction)pressReturn:(id)sender;
@end

@protocol CityListViewControllerProtocol
- (void) citySelectionUpdate:(NSString*)selectedCity withSection:(NSUInteger)newSection withRow:(NSUInteger)newRow withTag:(NSString *)tag;
- (NSString*) getDefaultCity;
@end

