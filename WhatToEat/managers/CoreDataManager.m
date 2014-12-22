//
//  DataManager.m
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-22.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

NSManagedObjectContext* managedObjectContext;
NSPersistentStoreCoordinator* persistentStoreCoordinator;
FoodInfo *foodInfo;

#pragma mark -
#pragma mark Singleton
+ (id)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject;
}

- (id)init
{   
    self = [super init];
    id delegate = [[UIApplication sharedApplication] delegate];
    managedObjectContext = [delegate managedObjectContext];
    return self;
}

/*
- (BOOL)createContextForEntity: (NSString *)entity
{
    id delegate = [[UIApplication sharedApplication] delegate];
    managedObjectContext = [delegate managedObjectContext];
    foodInfo = [NSEntityDescription insertNewObjectForEntityForName:entity inManagedObjectContext:managedObjectContext];
    return YES;
}

*/


- (void) setValue:(NSString *)value forEntity:(NSString *)entity forKey:(NSString *)key
{
    foodInfo = [NSEntityDescription insertNewObjectForEntityForName:@"FoodInfo" inManagedObjectContext:managedObjectContext];
    [foodInfo setValue:value forKey:key];
    NSError *error;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

/*
- (void) getValue:(NSString *)value forKey:(NSString *)key
{
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"FoodInfo" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    for (FoodInfo *info in fetchedObjects) {
        NSLog(@"name: %@",info.name);
    };
}*/



- (NSArray *) getFoodInfosForEntity:(NSString *)entity
{
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDiscription = [NSEntityDescription entityForName:@"FoodInfo" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entityDiscription];
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}

- (void) clearDataForEntity:(NSString *)entity
{
    if (!managedObjectContext) {
        return;
    }
    NSArray *deletingObjects = [self getFoodInfosForEntity:entity];
    for (FoodInfo *deletingObject in deletingObjects){
        [managedObjectContext deleteObject:deletingObject];
    }
}

@end
