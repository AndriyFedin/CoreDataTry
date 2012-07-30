//
//  AppDelegate.m
//  CoreDataTry
//
//  Created by Andriy Fedin on 7/22/12.
//  Copyright (c) 2012 111 Minutes. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataLayer.h"

#import "AuthorsViewController.h"
#import "BooksController.h"
#import "TagsController.h"

#import "Book.h"
#import "Author.h"
#import "BookTag.h"


@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    
    [self stuffDB];
    
    UINavigationController *localNavigationController;
    _tabBarController = [[UITabBarController alloc] init];
    NSMutableArray *localControllersArray = [[NSMutableArray alloc] initWithCapacity:3];
    
    AuthorsViewController *authContr;
    authContr = [[AuthorsViewController alloc] initWithTabBar];
    
    localNavigationController = [[UINavigationController alloc] initWithRootViewController:authContr];
    
    [localControllersArray addObject:localNavigationController];
    
    BooksController *bookContr;
    bookContr = [[BooksController alloc] initWithTabBar];
    localNavigationController = [[UINavigationController alloc] initWithRootViewController:bookContr];
    [localControllersArray addObject:localNavigationController];

    TagsController *tagContr;
    tagContr = [[TagsController alloc] initWithTabBar];
    localNavigationController = [[UINavigationController alloc] initWithRootViewController:tagContr];
    [localControllersArray addObject:localNavigationController];

    
    
    _tabBarController.viewControllers = localControllersArray;
    
    
    
    //UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:_tabBarController];
    self.window.rootViewController = _tabBarController;
    
    //[_window addSubview:_tabBarController.view];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)stuffDB
{
    // authors
    Author *author0 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    author0.name = @"Victor Balalayka";
    Author *author1 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    author1.name = @"Marry Twohills";
    Author *author2 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    author2.name = @"Alex Standing";
    Author *author3 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    author3.name = @"Terry Bigballs";
    Author *author4 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    author4.name = @"Jeremy Mouse";
    Author *author8 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    author8.name = @"Porkey Pig";
    Author *author9 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    author9.name = @"Evelyn Flat";
    Author *author10 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    author10.name = @"Evgeniy Poster";
    Author *author11 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    author11.name = @"Markus Salo";
    
    
    // tags
    BookTag *tag0 = [NSEntityDescription insertNewObjectForEntityForName:@"BookTag" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    tag0.tag = @"SciFi";
    BookTag *tag1 = [NSEntityDescription insertNewObjectForEntityForName:@"BookTag" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    tag1.tag = @"Action";
    BookTag *tag2= [NSEntityDescription insertNewObjectForEntityForName:@"BookTag" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    tag2.tag = @"Romance";
    BookTag *tag3 = [NSEntityDescription insertNewObjectForEntityForName:@"BookTag" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    tag3.tag = @"Childish";
    BookTag *tag4 = [NSEntityDescription insertNewObjectForEntityForName:@"BookTag" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    tag4.tag = @"Drama";
    BookTag *tag5 = [NSEntityDescription insertNewObjectForEntityForName:@"BookTag" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    tag5.tag = @"Guide";
    BookTag *tag6 = [NSEntityDescription insertNewObjectForEntityForName:@"BookTag" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    tag6.tag = @"Trash";
    BookTag *tag7 = [NSEntityDescription insertNewObjectForEntityForName:@"BookTag" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    tag7.tag = @"Funny";
    
    
    // books
    
    Book *book0 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book0.name = @"The story of Porkey the Pig";
    book0.writenBy = author8;
    book0.searchBy = tag6;
    
    Book *book1 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book1.name = @"Alcohol in our lives";
    book1.writenBy = author0;
    book1.searchBy = tag5;
    
    Book *book2 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book2.name = @"Never let monkey in your pocket";
    book2.writenBy = author3;
    book2.searchBy = tag4;
    
    Book *book3 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book3.name = @"Shiny new corpse";
    book3.writenBy = author1;
    book3.searchBy = tag3;
    
    Book *book4 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book4.name = @"Shopping list";
    book4.writenBy = author10;
    book4.searchBy = tag2;
    
    Book *book5 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book5.name = @"Tales from Red Lights Street";
    book5.writenBy = author1;
    book5.searchBy = tag3;
    
    Book *book6 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book6.name = @"One little sad camel";
    book6.writenBy = author0;
    book6.searchBy = tag6;
    
    Book *book7 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book7.name = @"Marvin The Grean";
    book7.writenBy = author11;
    book7.searchBy = tag4;
    
    Book *book8 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book8.name = @"Eleven guitars";
    book8.writenBy = author1;
    book8.searchBy = tag5;
    
    Book *book9 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book9.name = @"What's that smell?";
    book9.writenBy = author8;
    book9.searchBy = tag7;
    
    Book *book10 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book10.name = @"My 6734'th birthday";
    book10.writenBy = author3;
    book10.searchBy = tag1;
    
    Book *book11 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:[CoreDataLayer getInstance].managedObjectContext];
    book11.name = @"Dark hole";
    book11.writenBy = author9;
    book11.searchBy = tag2;
    
    
    //[[CoreDataLayer getInstance].managedObjectContext save:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
