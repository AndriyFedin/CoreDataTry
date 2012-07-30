//
//  AppDelegate.h
//  CoreDataTry
//
//  Created by Andriy Fedin on 7/22/12.
//  Copyright (c) 2012 111 Minutes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AuthorsController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AuthorsController *viewController;
@property (nonatomic, strong) UITabBarController *tabBarController;

@end
