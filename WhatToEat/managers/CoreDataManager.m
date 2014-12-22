//
//  DataManager.m
//  WhatToEat
//
//  Created by Wei Xie on 2014-12-22.
//  Copyright (c) 2014 WEI.XIE. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

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

- (id)init:(NSString *) entity
{
    self = [super init];
    return self;
}


- (BOOL)createContextForEntity: (NSString *)entity
{
    id delegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [delegate managedObjectContext];
    self.managedObject = [NSEntityDescription insertNewObjectForEntityForName:entity inManagedObjectContext:self.managedObjectContext];
    return YES;
}


- (void) setValue:(NSString *)value forKey:(NSString *)key
{
    [self.managedObject setValue:value forKey:key];
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

- (void) getValue:(NSString *)value forKey:(NSString *)key
{
    [self.managedObject setValue:value forKey:key];
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't get: %@", [error localizedDescription]);
    }
    
}
@end
