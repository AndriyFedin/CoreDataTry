//
//  Book.h
//  CoreDataTry
//
//  Created by Andriy Fedin on 7/22/12.
//  Copyright (c) 2012 111 Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Author, BookTag;

@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Author *writenBy;
@property (nonatomic, retain) BookTag *searchBy;

@end
