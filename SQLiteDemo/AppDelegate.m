//
//  AppDelegate.m
//  SQLiteDemo
//
//  Created by Magnon International on 27/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "InsertARowVC.h"
#import "DeleteARowVC.h"
#import "UpdateARowVC.h"
#import "ShowAllRecordsVC.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [self releaseViews];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    
    [self addViewController];
    return YES;
}

#pragma mark - methods Definition here
-(void)addInsertARowVC{
    
    self.window.rootViewController=nil;
    [self releaseViews];
    objInsertARowVC = [[InsertARowVC alloc] initWithNibName:@"InsertARowVC" bundle:nil];
    self.window.rootViewController =objInsertARowVC;
}
-(void)addDeleteARowVC{
    
    self.window.rootViewController=nil;
    [self releaseViews];
    objDeleteARowVC=[[DeleteARowVC alloc] initWithNibName:@"DeleteARowVC" bundle:nil];
    self.window.rootViewController=objDeleteARowVC;
}
-(void)addUpdateARowVC{
    self.window.rootViewController=nil;
    [self releaseViews];
    objUpdateARowVC =[[UpdateARowVC alloc] initWithNibName:@"UpdateARowVC" bundle:nil];
    self.window.rootViewController=objUpdateARowVC;
    
}
-(void)addShowAllRecordsVC{
    
    self.window.rootViewController=nil;
    [self releaseViews];
    objShowAllRecordsVC =[[ShowAllRecordsVC alloc] initWithNibName:@"ShowAllRecordsVC" bundle:nil];
    navigationController=[[UINavigationController alloc] initWithRootViewController:objShowAllRecordsVC];
    self.window.rootViewController=navigationController;
}

-(void)addViewController{
    self.window.rootViewController=nil;
    [self releaseViews];
    objViewControllerVC =[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController=objViewControllerVC;
}

-(void) releaseViews{
    

    ReleaseObj(objUpdateARowVC);
    ReleaseObj(objInsertARowVC);
    ReleaseObj(objUpdateARowVC);
    ReleaseObj(objDeleteARowVC);
    ReleaseObj(objViewControllerVC);
}

+(AppDelegate *)GetAppDelegate{
    return (AppDelegate*)([UIApplication sharedApplication].delegate);
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
