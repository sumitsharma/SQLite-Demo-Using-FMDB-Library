//
//  DeleteARowVC.m
//  SQLiteDemo
//
//  Created by Magnon International on 27/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import "DeleteARowVC.h"
#import "AppDelegate.h"

@interface DeleteARowVC ()

@end

@implementation DeleteARowVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self = [super initWithNibName:@"DeleteARowVC_iPhone4" bundle:nil];
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnBackisClicked:(id)sender{
    [[AppDelegate GetAppDelegate] addViewController];
}

@end
