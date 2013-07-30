//
//  InsertARowVC.h
//  SQLiteDemo
//
//  Created by Magnon International on 27/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsertARowVC : UIViewController<UITextFieldDelegate>{
    IBOutlet UIButton *btnAddRow;
    IBOutlet UIButton *btncancel;
    
    IBOutlet UITextField *txtFirstName;
    IBOutlet UITextField *txtLastName;
    IBOutlet UITextField *txtEmailID;
    IBOutlet UITextField *txtCellNo;
    IBOutlet UITextField *txtPassword;
    
    NSString *strFirstName, *strLastName, *strCellNo, *strEmailID, *strPassword;
    
    IBOutlet UIView *containerView;
    IBOutlet UIScrollView *scrollView;
}

-(IBAction)btnAddRowIsClicked:(id)sender;
-(IBAction)btncancelIsClicked:(id)sender;
@end
