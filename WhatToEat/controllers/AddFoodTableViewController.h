//
//  AddFoodTableViewController.h
//  WhatToEat
//
//  Created by WEI XIE on 2014-12-20.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataManager.h"

@interface AddFoodTableViewController : UITableViewController {
    UITextField *nameField;
}


- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@end
