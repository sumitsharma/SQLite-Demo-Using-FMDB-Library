//
//  ViewController.m
//  SQLiteDemo
//
//  Created by Magnon International on 27/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

#import "FMDatabase.h"
#import "sqlite3.h"

@interface ViewController ()

@end

@implementation ViewController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self = [super initWithNibName:@"ViewController_iPhone" bundle:nibBundleOrNil];
    } else {
        self = [super initWithNibName:@"ViewController_iPad" bundle:nibBundleOrNil];
    }
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self createDatabase];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButtons & Action
-(IBAction)btnInsertARowIsClicked:(id)sender{
    
    [[AppDelegate GetAppDelegate] addInsertARowVC];
    
}
-(IBAction)btnDeleteARowIsClicked:(id)sender{
    [[AppDelegate GetAppDelegate] addDeleteARowVC];
}
-(IBAction)btnUpdateARowIsClicked:(id)sender{
     [[AppDelegate GetAppDelegate] addUpdateARowVC];
}
-(IBAction)btnShowAllRecordsIsClicked:(id)sender{
     [[AppDelegate GetAppDelegate] addShowAllRecordsVC];
}

#pragma mark - Create Database if not exist

-(void)createDatabase{
    
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir =[docPaths objectAtIndex:0];
    NSString *dbPath = [documentDir stringByAppendingPathComponent:@"UserDatabase.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    [database open];
    [database executeUpdate:@"CREATE TABLE tblPersonalData (id INTEGER  PRIMARY KEY DEFAULT NULL,firstName VARCHAR DEFAULT NULL,lastName VARCHAR DEFAULT NULL,cellNo VARCHAR DEFAULT NULL,emailID VARCHAR DEFAULT NULL, password VACRHAR DEFAULT NULL)"];
    [database close];
    
}
@end
