//
//  CoreDataLayer.m
//  CoreDataTry
//
//  Created by Andriy Fedin on 7/22/12.
//  Copyright (c) 2012 111 Minutes. All rights reserved.
//

#import "CoreDataLayer.h"

@interface CoreDataLayer ()
- (NSPersistentStoreCoordinator*)persistentCoordinator;
- (NSURL *)applicationDocumentsDirectory;
@end


@implementation CoreDataLayer

@synthesize objModel = _objModel;
@synthesize persistentCoordinator = _persistentCoordinator;
@synthesize managedObjectContext = _managedObjectContext;

+ (CoreDataLayer*)getInstance
{
    static CoreDataLayer *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CoreDataLayer alloc] init];
    });
    return instance;
}

- (NSManagedObjectModel*)objModel
{
    if (!_objModel) {
        _objModel = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle mainBundle]]];
    }
    return _objModel;
}

- (NSPersistentStoreCoordinator*)persistentCoordinator
{
    if (!_persistentCoordinator) {
        NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CD.sqlite"];
        NSError *error = nil;
        _persistentCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self objModel]];
        if (![_persistentCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    return _persistentCoordinator;
}

- (NSManagedObjectContext*)managedObjectContext
{
    if (!_managedObjectContext) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:[self persistentCoordinator]];
    }
    return _managedObjectContext;
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
