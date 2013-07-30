//
//  ShowAllRecordsVC.h
//  SQLiteDemo
//
//  Created by Magnon International on 27/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowAllRecordsVC : UITableViewController<UITableViewDataSource,UITableViewDelegate>{
    NSInteger arrayCount;
    NSMutableArray *objSOArray;
   
}

@end
