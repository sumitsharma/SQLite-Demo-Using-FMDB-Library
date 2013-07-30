//
//  ShowAllRecordsVC.m
//  SQLiteDemo
//
//  Created by Magnon International on 27/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import "ShowAllRecordsVC.h"

#import "FMDatabase.h"
#import "sqlite3.h"
#import "StudentObject.h"
#import "AppDelegate.h"
#import "EditARecordVC.h"
#import "HeaderView.h"


@interface ShowAllRecordsVC ()

@end

@implementation ShowAllRecordsVC

- (id)initWithStyle:(UITableViewStyle)style
{
    //self = [super initWithStyle:style];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self = [super initWithNibName:@"ShowAllRecordsVC_iPhone" bundle:nil];
    } else {
        self = [super initWithNibName:@"ShowAllRecordsVC" bundle:nil];
    }

    if (self) {
        // Custom initialization
        
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(Back)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    
    
   
}
-(void)Back{
    [[AppDelegate GetAppDelegate] addViewController];
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self checkDatabaseForRecords];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return arrayCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil)
    {
        NSString *nibName = @"CustomCell_iPhone";
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:nibName owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
        cell.selectionStyle=UITableViewCellSelectionStyleBlue;
    }
    StudentObject *objSO =[objSOArray objectAtIndex:indexPath.row];
    
    //text101
    UILabel *firstName101 = (UILabel*)[cell.contentView viewWithTag:101];
    firstName101.text = objSO.strFName;
    //text103
    UILabel *cellNo103 = (UILabel*)[cell.contentView viewWithTag:103];
    cellNo103.text = objSO.strCellNo;
    //text104
    UILabel *emailID104 = (UILabel*)[cell.contentView viewWithTag:104];
    emailID104.text = objSO.strEmailId;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        NSLog(@"Delete this row %d", indexPath.row);
        
        StudentObject *objSO = [objSOArray objectAtIndex:indexPath.row];
        [self deleteARecord:objSO];
        [self checkDatabaseForRecords];
        [self.tableView reloadData];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    HeaderView *headerView=[[HeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    NSArray *nibArray=[[NSBundle mainBundle] loadNibNamed:@"HeaderView_iphone4" owner:self options:nil];
    
    for (id view in nibArray) {
        if([view isKindOfClass:[HeaderView class]]){
            headerView=(HeaderView*)view;
        }
    }
    
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   return 44.0;
}

#pragma mark - check Database
-(void)checkDatabaseForRecords{
    arrayCount=0;
    objSOArray=[[NSMutableArray alloc] init];
    
    NSArray *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentString = [docsPath objectAtIndex:0];
    NSString *dbPath =[documentString stringByAppendingPathComponent:@"UserDatabase.sqlite"];
    
    
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    
    [database open];
    
    FMResultSet *results =[database executeQuery:@"SELECT * from tblPersonalData"];
    
    while ([results next]) {
        arrayCount++;
        StudentObject *objSO =[[StudentObject alloc] init];
        [objSOArray addObject:objSO];
        objSO.strFName= [results stringForColumn:@"firstName"];
        objSO.strLName=[results stringForColumn:@"lastName"];
        objSO.strCellNo=[results stringForColumn:@"cellNo"];
        objSO.strEmailId=[results stringForColumn:@"emailId"];
        objSO.strPassword=[results stringForColumn:@"password"];
        
    }
    
    [database close];
    
    
}

-(void)deleteARecord:(StudentObject*) getObjSO{
    
    NSArray *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentString = [docsPath objectAtIndex:0];
    NSString *dbPath =[documentString stringByAppendingPathComponent:@"UserDatabase.sqlite"];
    
    
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    
    [database open];
    
    [database executeUpdate:@"DELETE FROM tblPersonalData WHERE emailId = ?", getObjSO.strEmailId];

    [database close];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentObject *objSO =[objSOArray objectAtIndex:indexPath.row];
    
    EditARecordVC *objEditARecirdVC =[[EditARecordVC alloc] init];
    objEditARecirdVC.objectSO=objSO;
    [self.navigationController pushViewController:objEditARecirdVC animated:YES];
}

@end
