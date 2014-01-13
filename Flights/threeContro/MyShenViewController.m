//
//  MyShenViewController.m
//  TripgCustomer
//
//  Created by XmL on 13-1-14.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "MyShenViewController.h"
#import "RootViewController.h"
#import "ASIHTTPRequest.h"
#import "NewItem.h"
#import "RecomShenPiXml.h"
#import "DeXMlModel.h"
#import "CompanyID.h"
#import "RecomYanzhXml.h"
#import "RecomTongYiXml.h"
#import "TongYiXmlModel.h"
#import "HuiYuanViewController.h"
#import "NewItem.h"
#import "GuanLiPiXML.h"
#import "GuanLiPi.h"


  UITabBarItem * tabBar2;

@interface MyShenViewController ()




@end

@implementation MyShenViewController
@synthesize strTag,oneArray,twoArray,myArray,start,tableArray,lbb,popArray,sstp;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithStr:(NSString *)str
{
    if (self = [super init]) {
        self.strTag = [NSString stringWithString:str];
    }
    
    return self;
    
}

-(id)initWithArray:(NSMutableArray *)oneary
{
    if (self = [super init]) {
        self.oneArray = [NSMutableArray arrayWithArray:oneary];
        
    }

    return self;
}


-(void)btnFanHui:(UIButton * )btnn
{
    
    if (start == YES ) {
        [myShRequest clearDelegatesAndCancel];
        
        RootViewController * rvc = [[[RootViewController alloc] init] autorelease];
    
        
        rvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:rvc animated:YES completion:NULL];
        start = NO;
        
    }if (yanStart == YES) {
        [yanRequset clearDelegatesAndCancel];
        
        RootViewController * rvc = [[[RootViewController alloc] init] autorelease];
     
        rvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:rvc animated:YES completion:NULL];

        yanStart = NO;
    }else{
    
        RootViewController * rvc = [[[RootViewController alloc] init] autorelease];
  
        rvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:rvc animated:YES completion:NULL];

    
    }
        
    
}

-(void)httpMyshding
{
   
    
       
       
   
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        
        NSString * mDept_id = [defaults objectForKey:@"dept_ID"];
        NSString * mRole_id = [defaults objectForKey:@"role_ID"];
        NSString * mCompany = [defaults objectForKey:@"dcompany"];
        NSString * mUser = [defaults objectForKey:@"duser_ID"];
        NSLog(@"mDept_id is  %@",mDept_id);
        NSLog(@"mRole_id  is %@",mRole_id);

    NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept_show/received_travel.php?Company_id=%@&User_id=%@&Page=1&Per_page=100",mCompany,mUser];
        NSLog(@" %@",strUrl);
    NSURL * url = [NSURL URLWithString:strUrl];
    
  
    
    myShRequest = [ASIHTTPRequest requestWithURL:url];
    [myShRequest setTag:1009];
    [myShRequest setDelegate:self];
    [myShRequest startAsynchronous];
    
    start = YES;

    [activity startAnimating];


}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    start = NO;
    yanStart = NO;
    [activity stopAnimating];
    if (request.tag == 1009) {
        
        NSLog(@" *********** %@",[request responseString]);

        self.myArray = [RecomShenPiXml recomShenPimend:[request responseString] ];
        NSLog(@"  %d",[self.myArray count]);
        if ([self.myArray count] == 0) {
            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"您没有审批内容!" message:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"确定"
                                                    otherButtonTitles:nil];
            
            [alertView show];
            [alertView release];
        }
        
        tabBar2.badgeValue = [NSString stringWithFormat:@"%d",[self.myArray count]];

        [myTableView reloadData];
                
        
    }if (request.tag == 10010) {
        
       NSLog(@" %@",[request responseString]);
        self.twoArray = [RecomTongYiXml recomTongYiString:[request responseString]];
        if ([twoArray count] != 0) {
            
            TongYiXmlModel * tonyXm =[self.twoArray objectAtIndex:0];
            if ([tonyXm.tResult isEqualToString:@"SUCCEED"]) {
                UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"审批成功!" message:nil
                    delegate:self
                    cancelButtonTitle:@"确定"
                    otherButtonTitles:nil];
                
                [alertView show];
                [alertView release];
                
                [self.myArray removeObjectAtIndex:k];
                [myTableView reloadData];
                
               
              
                tabBar2.badgeValue = [NSString stringWithFormat:@"%d",[self.myArray count]];
                NSString * theneNam = [NSString stringWithFormat:@"%d",[self.myArray count]];
                
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:theneNam,@"ThemeName", nil];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeTheme" object:self userInfo:dict];

                
            }else{
            
                UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"审批失败!" message:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"确定"
                                                        otherButtonTitles:nil];
                
                [alertView show];
                [alertView release];
            
            
            
            }
            
            
        }
        
    }
    if (request.tag == 10011) {
        
        NSLog(@" %@",[request responseString]);
        self.twoArray = [RecomTongYiXml recomTongYiString:[request responseString]];
        if ([twoArray count] != 0) {
            
            TongYiXmlModel * tonyXm =[self.twoArray objectAtIndex:0];
            if ([tonyXm.tResult isEqualToString:@"SUCCEED"]) {
                UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"已拒绝审批!" message:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"确定"
                                                        otherButtonTitles:nil];
                
                [alertView show];
                [alertView release];
                
                [self.myArray removeObjectAtIndex:k];
                [myTableView reloadData];
                
                
                
                tabBar2.badgeValue = [NSString stringWithFormat:@"%d",[self.myArray count]];
                NSString * theneNam = [NSString stringWithFormat:@"%d",[self.myArray count]];
                
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:theneNam,@"ThemeName", nil];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeTheme" object:self userInfo:dict];
                
                
            }else{
                
                UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"审批失败!" message:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"确定"
                                                        otherButtonTitles:nil];
                
                [alertView show];
                [alertView release];
                
                
                
            }
            
            
        }
    }
    
    if (request.tag == 2001) {
        NSLog(@"审批人： %@",[request responseString]);
        
        [self helpView]; ////////////
        
        self.popArray = [GuanLiPiXML recommendedParser:[request responseString]];
        
        NSLog(@"审批人 数组 %d",[self.popArray count]);
        
    
        
        [tableV reloadData];
        
    }
    
    
    

}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    start = NO;
    yanStart = NO;
    
    [activity stopAnimating];
    NSLog(@"error");
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"网络链接超时!" message:@"提交申请失败!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
    [alertView release];

    

}




-(void)dealloc
{
   [tableV release];
    [super dealloc];
}




-(void) changeColor:(NSNotification *) notify {
    
    NSDictionary *dict = [notify userInfo];
    
   
    NSString *mThem = [dict objectForKey:@"ThemeName"];
    NSLog(@"themeName  is  %@",mThem);
    
    
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000

    myArray = [[NSMutableArray alloc] initWithCapacity:0];
    tableArray = [[NSMutableArray alloc] initWithCapacity:0];
    twoArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    g = 1;
    p = 0;
    o = 0;
   
    NSLog(@"  %@",self.strTag);

    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 50, 30);
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * barBtn = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
    self.navigationItem.leftBarButtonItem = barBtn;
   
   
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor:) name:@"ChangeTheme" object:nil];
    
    spreadBoolDictionary = [[NSMutableDictionary alloc] initWithCapacity:0];
    spreadBoolSearchBarArray = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) style:UITableViewStylePlain];
    
    myTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    [myTableView release];
    
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
    [activity setCenter:CGPointMake(160, 220)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];
    
    [self httpMyshding];
    

    
}



-(void)tyJiaoBtn:(UIButton *)button
{

    

    NSLog(@" %d",[self.myArray count]);
    k = button.tag;
   
    if ([self.myArray count] != 0 ) {
        NewItem * ewBtnModel = [self.myArray objectAtIndex:button.tag];
        
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString * mDept_id = [defaults objectForKey:@"dept_ID"];
        NSString * mRole_id = [defaults objectForKey:@"role_ID"];
        NSString * mCompany = [defaults objectForKey:@"dcompany"];
        NSString * mUser = [defaults objectForKey:@"duser_ID"];
        NSLog(@"mDept_id is  %@",mDept_id);
        NSLog(@"mRole_id  is %@",mRole_id);
        
        NSLog(@"&&&&&&&&&&&  %@",self.sstp);
        
      
            
            NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept_show/permit.php?User_id=%@&Company_id=%@&Permit_id=%@&Agreement=Y&Approval_id=%@",mUser,mCompany,ewBtnModel.nTravel,self.sstp];
            NSLog(@" %@",strUrl);
            NSURL * url = [NSURL URLWithString:strUrl];
            myTongYiRequest = [ASIHTTPRequest requestWithURL:url];
            [myTongYiRequest setTag:10010];
            [myTongYiRequest setDelegate:self];
            [myTongYiRequest startAsynchronous];
            
            start = YES;
            
            [activity startAnimating];
     
 //           else{
//        
//        NSString * strUrl = [NSString stringWithFormat:@"http://www.tripg.com/interface_dept/permit.php?User_id=%@&Company_id=%@&Permit_id=%@&Agreement=Y&Approval_id=47126",mUser,mCompany,ewBtnModel.nTravel];
//        NSLog(@" %@",strUrl);
//        NSURL * url = [NSURL URLWithString:strUrl];
//        myTongYiRequest = [ASIHTTPRequest requestWithURL:url];
//        [myTongYiRequest setTag:10010];
//        [myTongYiRequest setDelegate:self];
//        [myTongYiRequest startAsynchronous];
//        
//        start = YES;
//        
//        [activity startAnimating];
//        }
        
    }else{
        
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"此账号没有审批权限!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        
        
    }

    
    
    
    
    
}



-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString * cellId = [NSString stringWithFormat:@"cell%d%d",indexPath.section,indexPath.row];
    NSString * cellTd = [NSString stringWithFormat:@"id%d%d",indexPath.section,indexPath.row];
    
    if (tableView.tag==100) {
     
        NSString * cellID = [NSString stringWithFormat:@"id%d%d",indexPath.section,indexPath.row];
        UITableViewCell * cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID]autorelease];
       // ShenPiRen * sren = [self.wwarray objectAtIndex:0];
        if (nil == cell) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
            
            
        }
        // cell.contentView.backgroundColor =[UIColor greenColor];
        
        GuanLiPi * sren = [self.popArray objectAtIndex:indexPath.row];
        // cell.backgroundColor=[UIColor greenColor];
        leopq=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 210, 30)];
        //lab.text=[NSString stringWithFormat:@"%@",sren.mmOperate_name];
        leopq.text=[NSString stringWithFormat:@"%@",sren.yy_APPROVAL_NAME];
        leopq.font=[UIFont fontWithName:@"Arial" size:17];
        leopq.backgroundColor = [UIColor clearColor];
        leopq.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:leopq];
        
        return cell;
    }
    
    
    
    if (tableView != myTableView) {
        
        if([[spreadBoolSearchBarArray objectForKey:indexPath] intValue]){
             
            UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellTd];
            
            if (cell == nil) {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
               
                
                 }
                UILabel * la = [[UILabel alloc] initWithFrame:CGRectMake(5, 3, 210, 20)];
                la.tag = 200;
                la.backgroundColor = [UIColor clearColor];
                la.font = [UIFont fontWithName:@"Arial" size:15];
                la.textAlignment = NSTextAlignmentLeft;
                [cell addSubview:la];
                [la release];
                
                UILabel * laq = [[UILabel alloc] initWithFrame:CGRectMake(5, 25, 210, 20)];
                laq.tag = 201;
                laq.backgroundColor = [UIColor clearColor];
                laq.font = [UIFont fontWithName:@"Arial" size:15];
                laq.textAlignment = NSTextAlignmentLeft;
                [cell addSubview:laq];
                [laq release];
                
                UILabel * lay = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 110, 20)];
                lay.tag = 202;
                lay.backgroundColor = [UIColor clearColor];
                lay.font = [UIFont fontWithName:@"Arial" size:15];
                lay.textAlignment = NSTextAlignmentLeft;
                [cell addSubview:lay];
                [lay release];
                
                UILabel * laj = [[UILabel alloc] initWithFrame:CGRectMake(155, 50, 105, 20)];
                laj.tag = 203;
                laj.backgroundColor = [UIColor clearColor];
                laj.font = [UIFont fontWithName:@"Arial" size:15];
                laj.textAlignment = NSTextAlignmentLeft;
                [cell addSubview:laj];
                [laj release];
                
                UILabel * law = [[UILabel alloc] initWithFrame:CGRectMake(5, 70, 210, 50)];
                law.tag = 205;
                law.backgroundColor = [UIColor clearColor];
                law.font = [UIFont fontWithName:@"Arial" size:15];
                law.textAlignment = NSTextAlignmentLeft;
                law.numberOfLines = 0;
                [cell addSubview:law];
                [law release];
                
                
           
            
            
            if ([self.myArray count] != 0) {
                NewItem * aabl = [self.myArray objectAtIndex:indexPath.row];
                UILabel * lab = (UILabel *)[cell viewWithTag:200];
                lab.text = [NSString stringWithFormat:@"出差日期:%@",aabl.nStart_date];
                UILabel * labq = (UILabel *)[cell viewWithTag:201];
                labq.text = [NSString stringWithFormat:@"返回日期:%@",aabl.nEnd_date];
                UILabel * layu = (UILabel *)[cell viewWithTag:202];
                layu.text = [NSString stringWithFormat:@"预算:￥%@",aabl.nEstimated_amounts];
                UILabel * lajk = (UILabel *)[cell viewWithTag:203];
                lajk.text = [NSString stringWithFormat:@"借款:￥%@",aabl.nLoan_amounts];
                UILabel * labw = (UILabel *)[cell viewWithTag:205];
                labw.text = [NSString stringWithFormat:@"申请内容:%@",aabl.nDescription];
                
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            
            UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellTd];
            
                if (cell == nil) {
                    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
                    
                    
                    }
                    UILabel * la = [[UILabel alloc] initWithFrame:CGRectMake(5, 3, 80, 30)];
                    la.tag = 100;
                    la.backgroundColor = [UIColor clearColor];
                    la.textAlignment = NSTextAlignmentCenter;
                    la.font = [UIFont fontWithName:@"Arial" size:15];
                    [cell addSubview:la];
                    [la release];
                    
                    UILabel * la1 = [[UILabel alloc] initWithFrame:CGRectMake(110, 3, 100, 30)];
                    la1.tag = 101;
                    la1.backgroundColor = [UIColor clearColor];
                    la1.textAlignment = NSTextAlignmentCenter;
                    la1.font = [UIFont fontWithName:@"Arial" size:15];
                    [cell addSubview:la1];
                    [la1 release];
                    
                    UILabel * la2 = [[UILabel alloc] initWithFrame:CGRectMake(5, 35, 280, 30)];
                    la2.tag = 102;
                    la2.backgroundColor = [UIColor clearColor];
                    la2.textAlignment = NSTextAlignmentCenter;
                    la2.font = [UIFont fontWithName:@"Arial" size:15];
                    [cell addSubview:la2];
                    [la2 release];
                    
                    tyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                    tyBtn.frame = CGRectMake(250, 10, 60, 30);
                    tyBtn.tag = indexPath.row;
                    [tyBtn setImage:[UIImage imageNamed:@"同意.png"] forState:UIControlStateNormal];
                    [tyBtn addTarget:self action:@selector(tyJiaoBtn:) forControlEvents:UIControlEventTouchUpInside];
                    [cell addSubview:tyBtn];
                    
                    
                   
                
                
               
            if ([self.myArray count] != 0) {
                NewItem * aabl = [self.myArray objectAtIndex:indexPath.row];
                UILabel * lab = (UILabel *)[cell viewWithTag:100];
                lab.text = [NSString stringWithFormat:@"部门:%@",aabl.nDept_name];
                UILabel * lab1 = (UILabel *)[cell viewWithTag:101];
                lab1.text = [NSString stringWithFormat:@"人员:%@",aabl.nTravel_realname];
                UILabel * lab2 = (UILabel *)[cell viewWithTag:102];
                lab2.text = [NSString stringWithFormat:@"出差日期:%@",aabl.nStart_date];
                
            }
            
        
           
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
    }
 
    }
    if ([[spreadBoolDictionary objectForKey:indexPath] intValue]) {
        
       
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellTd];
        
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
           
            
            }
            UILabel * la = [[UILabel alloc] initWithFrame:CGRectMake(5, 3, 210, 20)];
            la.tag = 200;
            la.backgroundColor = [UIColor clearColor];
            la.font = [UIFont fontWithName:@"Arial" size:15];
            la.textAlignment = NSTextAlignmentLeft;
            [cell addSubview:la];
            [la release];
            
            UILabel * laq = [[UILabel alloc] initWithFrame:CGRectMake(5, 25, 210, 20)];
            laq.tag = 201;
            laq.backgroundColor = [UIColor clearColor];
            laq.font = [UIFont fontWithName:@"Arial" size:15];
            laq.textAlignment = NSTextAlignmentLeft;
            [cell addSubview:laq];
            [laq release];
            
            UILabel * lay = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 110, 20)];
            lay.tag = 202;
            lay.backgroundColor = [UIColor clearColor];
            lay.font = [UIFont fontWithName:@"Arial" size:15];
            lay.textAlignment = NSTextAlignmentLeft;
            [cell addSubview:lay];
            [lay release];
            
            UILabel * laj = [[UILabel alloc] initWithFrame:CGRectMake(110, 50, 105, 20)];
            laj.tag = 203;
            laj.backgroundColor = [UIColor clearColor];
            laj.font = [UIFont fontWithName:@"Arial" size:15];
            laj.textAlignment = NSTextAlignmentLeft;
            [cell addSubview:laj];
            [laj release];
            
            UILabel * law = [[UILabel alloc] initWithFrame:CGRectMake(5, 70, 210, 75)];
            law.tag = 205;
            law.backgroundColor = [UIColor clearColor];
            law.font = [UIFont fontWithName:@"Arial" size:15];
            law.textAlignment = NSTextAlignmentLeft;
            law.numberOfLines = 0;
            [cell addSubview:law];
            [law release];
            
            
            tyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            tyBtn.frame = CGRectMake(230, 55, 80, 30);
            tyBtn.tag = indexPath.row;
            [tyBtn setImage:[UIImage imageNamed:@"同意.png"] forState:UIControlStateNormal];
            [tyBtn addTarget:self action:@selector(tyJiaoBtn:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:tyBtn];
            
            tzbutn = [UIButton buttonWithType:UIButtonTypeCustom];
            tzbutn.frame = CGRectMake(230, 110, 80, 30);
            tzbutn.tag = indexPath.row;
            [tzbutn setImage:[UIImage imageNamed:@"拒绝.png"] forState:UIControlStateNormal];
            [tzbutn addTarget:self action:@selector(tzbutn:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:tzbutn];
            
            bbttn=[UIButton buttonWithType:UIButtonTypeCustom];
            bbttn.frame=CGRectMake(230, 3, 80, 30);
            [bbttn addTarget:self action:@selector(XiaJiShenPibbttn:) forControlEvents:UIControlEventTouchUpInside];
            [bbttn setImage:[UIImage imageNamed:@"上级审批人.png"] forState: UIControlStateNormal];
            [cell addSubview:bbttn];

            
            lbb=[[UILabel alloc]initWithFrame:CGRectMake(2, 2, 76, 26)];
            lbb.text=@"上级审批人";
            lbb.font=[UIFont fontWithName:@"Arial" size:15];
            lbb.textAlignment=NSTextAlignmentCenter;
            lbb.backgroundColor=[UIColor clearColor];
            lbb.textColor = [UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
            [bbttn addSubview:lbb];
        [lbb release];
            
         
            
        
        
        
        
        if ([self.myArray count] != 0) {
            NewItem * aabl = [self.myArray objectAtIndex:indexPath.row];
            UILabel * lab = (UILabel *)[cell viewWithTag:200];
            lab.text = [NSString stringWithFormat:@"出差日期:%@",aabl.nStart_date];
            UILabel * labq = (UILabel *)[cell viewWithTag:201];
            labq.text = [NSString stringWithFormat:@"返回日期:%@",aabl.nEnd_date];
            UILabel * layu = (UILabel *)[cell viewWithTag:202];
            layu.text = [NSString stringWithFormat:@"预算:￥%@",aabl.nEstimated_amounts];
            UILabel * lajk = (UILabel *)[cell viewWithTag:203];
            lajk.text = [NSString stringWithFormat:@"借款:￥%@",aabl.nLoan_amounts];
            UILabel * labw = (UILabel *)[cell viewWithTag:205];
            labw.text = [NSString stringWithFormat:@"申请内容:%@",aabl.nDescription];
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellTd];
        
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
            
            
          }  
            UILabel * la = [[UILabel alloc] initWithFrame:CGRectMake(5, 3, 150, 20)];
            la.tag = 100;
            la.backgroundColor = [UIColor clearColor];
            la.textAlignment = NSTextAlignmentCenter;
            la.font = [UIFont fontWithName:@"Arial" size:15];
            [cell addSubview:la];
            [la release];
            
            UILabel * la1 = [[UILabel alloc] initWithFrame:CGRectMake(155, 3, 100, 20)];
            la1.tag = 101;
            la1.backgroundColor = [UIColor clearColor];
            la1.textAlignment = NSTextAlignmentCenter;
            la1.font = [UIFont fontWithName:@"Arial" size:15];
            [cell addSubview:la1];
            [la1 release];
            
            UILabel * la2 = [[UILabel alloc] initWithFrame:CGRectMake(5, 25, 250, 30)];
            la2.tag = 102;
            la2.backgroundColor = [UIColor clearColor];
            la2.textAlignment = NSTextAlignmentCenter;
            la2.font = [UIFont fontWithName:@"Arial" size:15];
            [cell addSubview:la2];
            [la2 release];


            
            UILabel *ll=[[UILabel alloc]initWithFrame:CGRectMake(250, 10, 60, 30)];
            ll.backgroundColor=[UIColor clearColor];
            ll.text=@"查看";
            ll.textColor=[UIColor greenColor];
            ll.textAlignment=NSTextAlignmentCenter;
            [cell addSubview:ll];
            [ll release];
            
            
            
        
        
        
        
        if ([self.myArray count] != 0) {
            NewItem * aabl = [self.myArray objectAtIndex:indexPath.row];
            UILabel * lab = (UILabel *)[cell viewWithTag:100];
            lab.text = [NSString stringWithFormat:@"部门:%@",aabl.nDept_name];
            UILabel * lab1 = (UILabel *)[cell viewWithTag:101];
            lab1.text = [NSString stringWithFormat:@"人员:%@",aabl.nTravel_realname];
            UILabel * lab2 = (UILabel *)[cell viewWithTag:102];
            lab2.text = [NSString stringWithFormat:@"出差日期:%@",aabl.nStart_date];
            
            
        }
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

        }
    
}

-(void)tzbutn:(UIButton *)butn
{
    NSLog(@"1 3");
    
    NSLog(@" %d",[self.myArray count]);
    k = butn.tag;
    
    if ([self.myArray count] != 0 ) {
        NewItem * ewBtnModel = [self.myArray objectAtIndex:butn.tag];
        
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString * mDept_id = [defaults objectForKey:@"dept_ID"];
        NSString * mRole_id = [defaults objectForKey:@"role_ID"];
        NSString * mCompany = [defaults objectForKey:@"dcompany"];
        NSString * mUser = [defaults objectForKey:@"duser_ID"];
        NSLog(@"mDept_id is  %@",mDept_id);
        NSLog(@"mRole_id  is %@",mRole_id);
        
        NSLog(@"&&&&&&&&&&&  %@",self.sstp);
        
        if(self.sstp != nil){
            
            NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept_show/permit.php?User_id=%@&Company_id=%@&Permit_id=%@&Agreement=N&Approval_id=%@",mUser,mCompany,ewBtnModel.nTravel,self.sstp];
            NSLog(@" %@",strUrl);
            NSURL * url = [NSURL URLWithString:strUrl];
            myTongYiRequest = [ASIHTTPRequest requestWithURL:url];
            [myTongYiRequest setTag:10011];
            [myTongYiRequest setDelegate:self];
            [myTongYiRequest startAsynchronous];
            
            start = YES;
            
            [activity startAnimating];
        }else{
        
            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"审批人不能为空!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
            [alertView release];
        
        
        }
        
    }else{
        
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"此账号没有审批权限!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        
        
    }

    
    
}

-(void)XiaJiShenPibbttn:(id)sender
{
    NSLog(@"///");
    
    qview.hidden=YES;
    //[self helpView];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString * mDept_id = [defaults objectForKey:@"dept_ID"];
    NSString * mRole_id = [defaults objectForKey:@"role_ID"];
    NSString * mCompany = [defaults objectForKey:@"dcompany"];
    
    NSLog(@"mDept_id is  %@",mDept_id);
    NSLog(@"mRole_id  is %@",mCompany);
    NSLog(@"mRole_id  is %@",mRole_id);
    
    
    
    NewItem * qwnew = [self.myArray objectAtIndex:0];
    NSLog(@"审批人： %@",qwnew.nSort_no);
    
    NSString * urlStr = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept_show/get_next_approval.php?Company_id=%@&Dept_id=%@&Sort_no=%@",mCompany,mDept_id,qwnew.nSort_no];
   
    NSLog(@"%@",urlStr);
    NSURL * url = [NSURL URLWithString:urlStr];
    
    yy_request = [ASIHTTPRequest requestWithURL:url];
    [yy_request setTag:2001];
    [yy_request setDelegate:self];
    [yy_request startAsynchronous];
    
    start= YES;

    
}

-(void)helpView
{
    qview.hidden=YES;
    
    if (self.view.bounds.size.height > 460.0f) {
        
        qview.hidden=YES;
        
        qview=[[UIView alloc]initWithFrame:CGRectMake(30, 0, 320,768)];
        [self.view addSubview:qview];
        qview.backgroundColor=[UIColor whiteColor];
        
        
        
        tableVie = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 416) style:UITableViewStylePlain];
        tableVie.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        tableVie.delegate = self;
        tableVie.dataSource = self;
        [qview addSubview:tableVie];
        
        
    }else{
        qview.hidden=YES;
    
        qview=[[UIView alloc]initWithFrame:CGRectMake(5, 120, 210,120)];
        [self.view addSubview:qview];
        qview.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
        
        
        tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 120) style:UITableViewStylePlain];
        tableV.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        tableV.backgroundColor = [UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
        tableV.tag=100;
        tableV.delegate = self;
        tableV.dataSource = self;
        [qview addSubview:tableV];
        
        
        
        
    }


}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    qview.hidden = YES;
    if (tableView.tag == 100) {
        
        qview.hidden = YES;
        if ([self.popArray count] != 0) {
            
            GuanLiPi * sren = [self.popArray objectAtIndex:indexPath.row];
            NSLog(@"cell %@",sren.yy_APPROVAL_NAME);
            lbb.text=[NSString stringWithFormat:@"%@",sren.yy_APPROVAL_NAME];
            
            self.sstp = [NSString stringWithFormat:@"%@",sren.yy_APPROVAL_ID];
            NSLog(@"&&&&&&&&&&&  %@",sstp);
        
    }
        
    }    
        

    
    if (tableView != myTableView) {
        NSString* s = [spreadBoolSearchBarArray objectForKey:indexPath];
        if (!s) {
            [spreadBoolSearchBarArray setObject:[NSString stringWithFormat:@"1"] forKey:indexPath];
            
            
        }else{
            
            s = [NSString stringWithFormat:@"%d", ![s intValue]];
            
            [spreadBoolSearchBarArray removeObjectForKey:indexPath];
            
            [spreadBoolSearchBarArray setObject:s forKey:indexPath];
            
        }
        
        NSArray* array = [NSArray arrayWithObject:indexPath];
        [tableView reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationAutomatic];
        
        return;
    }
    
    NSString* s = [spreadBoolDictionary objectForKey:indexPath];
    
    if (!s) {
        [spreadBoolDictionary setObject:[NSString stringWithFormat:@"1"] forKey:indexPath];
        
        
        
    }else{
        
        s = [NSString stringWithFormat:@"%d", ![s intValue]];
        
        [spreadBoolDictionary removeObjectForKey:indexPath];
        
        [spreadBoolDictionary setObject:s forKey:indexPath];
        
    }
    
    NSArray* array = [NSArray arrayWithObject:indexPath];
    [tableView reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==100) {
 
    return [self.popArray count];

    }
    if (tableView == myTableView) {
        return [self.myArray count];

    }
    return YES;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag==100) {
        
        return 30.0f;
    }
    
    if (tableView != myTableView) {
        if ([[spreadBoolSearchBarArray objectForKey:indexPath] intValue]){
            return 150;
        }else{
            return 60;
        }
        
    }

    if ([[spreadBoolDictionary objectForKey:indexPath] intValue]){
        return 150;
    }else{
        return 60;
    }


}

- (void)didReceiveMemoryWarning
{
   
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end
