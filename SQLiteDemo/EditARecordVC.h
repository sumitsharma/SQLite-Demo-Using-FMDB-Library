//
//  EditARecordVC.h
//  SQLiteDemo
//
//  Created by Magnon International on 29/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StudentObject;

@interface EditARecordVC : UIViewController<UITextFieldDelegate>{
    
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIView *containerView;
    
    IBOutlet UITextField *txtUFName;
    IBOutlet UITextField *txtULName;
    IBOutlet UITextField *txtUCellNo;
    IBOutlet UITextField *txtUEmailId;
    IBOutlet UITextField *txtUPassword;
    
    IBOutlet UIButton *btnUpdate;
    IBOutlet UIButton *btnCancel;
    
    NSString *strfName, *strlName, *strCellNo, *strEmail, *strPassword;
    
    
}
-(IBAction)btnCancelIsClicked:(id)sender;
-(IBAction)btnUpdateIsClicked:(id)sender;

@property(nonatomic, retain)StudentObject *objectSO;

@end
