//
//  CompanyViewController.h
//  Flights
//
//  Created by mac on 12-10-25.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompanyViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    NSDictionary *cities;
    NSArray *keys;
    id delegate;
    UITableView *tbView;
    NSString *tag;
}
@property (nonatomic,retain) NSString * tag;
@property (nonatomic, retain) IBOutlet UITableView *tbView;
@property (nonatomic, retain) NSDictionary *cities;
@property (nonatomic, retain) NSArray *keys;
@property (nonatomic, assign) id delegate;
@property NSUInteger curSection;
@property NSUInteger curRow;
- (IBAction)pressReturn:(id)sender;
@end

@protocol CompanyViewControllerProtocol
- (void) companySelectionUpdate:(NSString*)selectedCity withSection:(NSUInteger)newSection withRow:(NSUInteger)newRow withTag:(NSString *)tag;
- (NSString*) getDefaultCity;

@end
