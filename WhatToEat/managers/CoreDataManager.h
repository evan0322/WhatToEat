//
//  DataManager.h
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-22.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import "FoodInfo.h"

@interface CoreDataManager : NSObject 


+ (CoreDataManager*)sharedInstance;

- (BOOL)createContextForEntity: (NSString *)entity;
- (void)setValue:(id)value forKey:(NSString *)key;
- (void)getValue:(id)value forKey:(NSString *)key;

@property (nonatomic,readwrite) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,readwrite) NSPersistentStoreCoordinator* persistentStoreCoordinator;
@property (nonatomic,strong) FoodInfo *managedObject;

@end
