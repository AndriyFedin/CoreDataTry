//
//  CoreDataLayer.h
//  CoreDataTry
//
//  Created by Andriy Fedin on 7/22/12.
//  Copyright (c) 2012 111 Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CoreDataLayer : NSObject

@property (nonatomic, strong) NSManagedObjectModel *objModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentCoordinator;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

+ (CoreDataLayer*)getInstance;

@end
