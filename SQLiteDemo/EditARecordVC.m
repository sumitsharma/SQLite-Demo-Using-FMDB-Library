//
//  EditARecordVC.m
//  SQLiteDemo
//
//  Created by Magnon International on 29/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import "EditARecordVC.h"
#import "StudentObject.h"
#import "FMDatabase.h"

@interface EditARecordVC ()

@end

@implementation EditARecordVC

@synthesize objectSO;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self = [super initWithNibName:@"EditARecord_iphone4" bundle:nil];
    } else {
        self = [super initWithNibName:@"ShowAllRecordsVC" bundle:nil];
    }
    if (self) {
        // Custom initialization
    }
    

    return self;
}

-(void)selectParticularUser: (NSString*)email{
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"Edit Record";
    
    [scrollView addSubview:containerView];
    scrollView.contentSize=containerView.frame.size;
    
    txtUFName.text=objectSO.strFName;
    txtULName.text=objectSO.strLName;
    txtUCellNo.text=objectSO.strCellNo;
    txtUEmailId.text=objectSO.strEmailId;
    txtUPassword.text=objectSO.strPassword;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - custom methods
-(IBAction)btnCancelIsClicked:(id)sender{
    NSLog(@"***** > %@", [self.navigationController navigationItem]);
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)btnUpdateIsClicked:(id)sender{
    
    strfName=txtUFName.text;
    strlName=txtULName.text;
    strCellNo=txtUCellNo.text;
    strEmail=txtUEmailId.text;
    strPassword=txtUPassword.text;
    
    
    [self updateDatabase:strfName :strlName :strCellNo :strEmail :strPassword];
}
#pragma mark - update Record Here
-(void)updateDatabase:(NSString*)fName :(NSString*)lName :(NSString*)cellNo :(NSString*)emailID :(NSString*)password{
    
    NSArray *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath =[docsPath objectAtIndex:0];
    NSString *dbPath =[documentPath stringByAppendingPathComponent:@"UserDatabase.sqlite"];
    
    FMDatabase *database =[FMDatabase databaseWithPath:dbPath];
    [database open];
    
    [database executeUpdate:@"UPDATE tblPersonalData set firstName = ?, lastName = ?, cellNo = ?, password = ? where emailId = ?",fName, lName,cellNo,password, emailID];
    
    [database close];
}

#pragma mark - textfield delegate here

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if (textField==txtUEmailId) {
        
    }
}

@end
