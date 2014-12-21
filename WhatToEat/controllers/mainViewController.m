//
//  mainViewController.m
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-19.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import "MainViewController.h"
#import <CoreData/CoreData.h>

@interface MainViewController ()



@end


@implementation MainViewController
@synthesize managedObjectContext;


- (void)viewDidLoad {
        [super viewDidLoad];
    id delegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [delegate managedObjectContext];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *foodList = [NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:context];
    
    
    
    
    
    
    [foodList setValue:@"gonpao chiken" forKey:@"name"];
    [foodList setValue:@"noodle" forKey:@"name"];
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
