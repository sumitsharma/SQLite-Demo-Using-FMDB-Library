//
//  ViewController.h
//  SQLiteDemo
//
//  Created by Magnon International on 27/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    IBOutlet UIButton *btnInsertARow;
    IBOutlet UIButton *btnDeleteARow;
    IBOutlet UIButton *btnUpdateARow;
    IBOutlet UIButton *btnShowAllRecords;
    
}

-(IBAction)btnInsertARowIsClicked:(id)sender;
-(IBAction)btnDeleteARowIsClicked:(id)sender;
-(IBAction)btnUpdateARowIsClicked:(id)sender;
-(IBAction)btnShowAllRecordsIsClicked:(id)sender;

@end
