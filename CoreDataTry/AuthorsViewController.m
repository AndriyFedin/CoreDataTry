//
//  AuthorsViewController.m
//  CoreDataTry
//
//  Created by Andriy Fedin on 7/22/12.
//  Copyright (c) 2012 111 Minutes. All rights reserved.
//

#import "AuthorsViewController.h"
#import "CoreDataLayer.h"
#import "Author.h"
#import "Book.h"
#import "BookTag.h"
#import "DetailedDataViewController.h"

@interface AuthorsViewController () 

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *searchController;
@property (nonatomic, strong) NSFetchedResultsController *FRController;

@end



@implementation AuthorsViewController

@synthesize searchBar = _searchBar;
@synthesize searchController = _searchController;
@synthesize FRController = _FRController;


-(id) initWithTabBar {
    self = [super init];
    if (self) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 360, 44)];
        self.title = @"Authors";        
        //self.tabBarItem.title = @"Authors";
        //self.navigationItem.title = @"Authors";
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:_searchBar];
    self.tableView.tableHeaderView = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    _searchController = [[UISearchDisplayController alloc] initWithSearchBar:(UISearchBar*)self.tableView.tableHeaderView contentsController:self];
    
    _searchController.delegate = self;
    _searchController.searchResultsDataSource = self;
    _searchController.searchResultsDelegate = self;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Author"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    
    _FRController = [[NSFetchedResultsController alloc]
                                              initWithFetchRequest:fetchRequest
                                              managedObjectContext:[CoreDataLayer getInstance].managedObjectContext
                                              sectionNameKeyPath:nil
                                              cacheName:nil];
    
    NSError *error;
    BOOL success = [_FRController performFetch:&error];
    if (!success) {
        NSLog(@"\nFetch error\n%@",error);
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_FRController.fetchedObjects) {
        return _FRController.fetchedObjects.count;
    }
    else {
        assert(@" SOMETHING WRONG!!!");
        return 0;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                       reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[_FRController.fetchedObjects objectAtIndex:indexPath.row] name];
    return cell;
}

#pragma mark -
#pragma mark - UISearchDisplayDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller 
shouldReloadTableForSearchString:(NSString *)searchString 
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains[cd]%@",searchString];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Author"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    fetchRequest.predicate = predicate;    
    
    _FRController = [[NSFetchedResultsController alloc]
                     initWithFetchRequest:fetchRequest
                     managedObjectContext:[CoreDataLayer getInstance].managedObjectContext
                     sectionNameKeyPath:nil
                     cacheName:nil];
    NSError *error;
    BOOL success = [_FRController performFetch:&error];
    if (!success) {
        NSLog(@"\nFetch error\n%@",error);
    }
    
    return YES;
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didHideSearchResultsTableView:(UITableView *)tableView
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Author"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    
    _FRController = [[NSFetchedResultsController alloc]
                     initWithFetchRequest:fetchRequest
                     managedObjectContext:[CoreDataLayer getInstance].managedObjectContext
                     sectionNameKeyPath:nil
                     cacheName:nil];
    NSError *error;
    BOOL success = [_FRController performFetch:&error];
    if (!success) {
        NSLog(@"\nFetch error\n%@",error);
    }
}

#pragma mark -
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"clicked name %@", [[_FRController.fetchedObjects objectAtIndex:indexPath.row] name]);
    [self.navigationController pushViewController:[[DetailedDataViewController alloc] initWithAuthor:[_FRController.fetchedObjects objectAtIndex:indexPath.row]] animated:YES];
}

@end
