//
//  InsertARowVC.m
//  SQLiteDemo
//
//  Created by Magnon International on 27/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import "InsertARowVC.h"
#import "AppDelegate.h"
#import "FMDatabase.h"

@interface InsertARowVC ()

@end

@implementation InsertARowVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self = [super initWithNibName:@"InsertARowVC_iPhone4" bundle:nibBundleOrNil];
    } else {
        
        self = [super initWithNibName:@"InsertARowVC_iPad" bundle:nibBundleOrNil];
    }
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [scrollView addSubview:containerView];
    scrollView.contentSize=containerView.frame.size;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - method Definition here
-(IBAction)btnAddRowIsClicked:(id)sender{
    
    strFirstName=txtFirstName.text;
    strLastName=txtLastName.text;
    strCellNo=txtCellNo.text;
    strEmailID=txtEmailID.text;
    strPassword=txtPassword.text;
    
    [self insertRow:strFirstName :strLastName :strCellNo :strEmailID :strPassword ];
        
    txtFirstName.text=@"";
    txtLastName.text=@"";
    txtEmailID.text=@"";
    txtCellNo.text=@"";
    txtPassword.text=@"";
}
-(IBAction)btncancelIsClicked:(id)sender{
    [[AppDelegate GetAppDelegate] addViewController];

}
#pragma mark - textfield Delegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    containerView.frame=CGRectMake(0, 0, 320, 2000);
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField==txtPassword || textField == txtEmailID) {
     containerView.frame=CGRectMake(0, -230, 320, 2000);   
    }
    
}

#pragma mark - Insert Row in Database
-(void)insertRow:(NSString*)fName : (NSString*)lName :(NSString*) cNo :(NSString*)email : (NSString*)password{
    
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir =[docPaths objectAtIndex:0];
    NSString *dbPaths = [documentDir stringByAppendingPathComponent:@"UserDatabase.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:dbPaths];
    [database open];
    //[database executeUpdate:@"INSERT INTO tblPersonalData(firstName, lastName, cellNo, emailID, password) VALUES (strFirstName, strLastName, strCellNo, strEmailID, strPassword)"];
    
    [database executeUpdate:@"INSERT INTO tblPersonalData (firstName, lastName, cellNo, emailID, password) VALUES (?, ?, ?, ?, ?)", [NSString stringWithFormat:@"%@", strFirstName], [NSString stringWithFormat:@"%@", strLastName], [NSString stringWithFormat:@"%@", strCellNo], [NSString stringWithFormat:@"%@", strEmailID], [NSString stringWithFormat:@"%@", strPassword],nil];

    
    [database close];
}
@end
