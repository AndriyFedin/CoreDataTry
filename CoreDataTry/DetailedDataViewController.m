//
//  DetailedDataViewController.m
//  CoreDataTry
//
//  Created by Andriy Fedin on 7/22/12.
//  Copyright (c) 2012 111 Minutes. All rights reserved.
//

#import "DetailedDataViewController.h"
#import "CoreDataLayer.h"
#import "Book.h"

@interface DetailedDataViewController ()

@property (nonatomic, strong) Author *author;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSFetchedResultsController *FRController;


@end



@implementation DetailedDataViewController

@synthesize author = _author;
@synthesize table = _table;
@synthesize FRController = _FRController;

- (id)initWithAuthor:(Author*)anAuthor;
{
    self = [super init];
    if (self) {
        _author = anAuthor;
        self.view.backgroundColor = [UIColor whiteColor];
        
        UILabel *lblAuthorName = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 320, 30)];
        lblAuthorName.text = [NSString stringWithFormat:@"Author name: %@.", _author.name];
        [self.view addSubview:lblAuthorName];
        UILabel *lblTableTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 320, 30)];
        [self.view addSubview:lblTableTitle];
        
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"writenBy.name contains[cd]%@",_author.name];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Book"];
        fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"writenBy.name" ascending:YES]];
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
        else {
            NSLog(@"\n\nbooks of %@:", _author.name);
            for (Book *book in _FRController.fetchedObjects) {
                NSLog(@"%@", book.name);
            }
        }
        
        if (_FRController.fetchedObjects.count > 0) {
            lblTableTitle.text = @"Author's books below.";
        }
        else {
            lblTableTitle.text = @"No books found.";
        }
        
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, lblTableTitle.frame.origin.y + lblTableTitle.frame.size.height, 320, self.view.frame.size.height - (lblTableTitle.frame.origin.y + lblTableTitle.frame.size.height)) style:UITableViewStylePlain]; 
        _table.delegate = self;
        _table.dataSource = self;
        [self.view addSubview:_table];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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

@end
