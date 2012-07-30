//
//  DetailedDataViewController.h
//  CoreDataTry
//
//  Created by Andriy Fedin on 7/22/12.
//  Copyright (c) 2012 111 Minutes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Author.h"

@interface DetailedDataViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (id)initWithAuthor:(Author*)anAuthor;

@end
