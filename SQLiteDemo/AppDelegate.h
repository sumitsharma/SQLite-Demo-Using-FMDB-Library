//
//  AppDelegate.h
//  SQLiteDemo
//
//  Created by Magnon International on 27/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class InsertARowVC;
@class DeleteARowVC;
@class UpdateARowVC;
@class ShowAllRecordsVC;


@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    InsertARowVC *objInsertARowVC;
    DeleteARowVC *objDeleteARowVC;
    UpdateARowVC *objUpdateARowVC;
    ShowAllRecordsVC *objShowAllRecordsVC;
    ViewController *objViewControllerVC;
    UINavigationController *navigationController;
}

@property (strong, nonatomic) UIWindow *window;

-(void)addInsertARowVC;
-(void)addDeleteARowVC;
-(void)addUpdateARowVC;
-(void)addShowAllRecordsVC;
-(void)addViewController;
-(void)releaseViews;

+(AppDelegate *)GetAppDelegate;

@end
