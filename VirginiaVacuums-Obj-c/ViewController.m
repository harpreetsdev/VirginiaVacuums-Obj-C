//
//  ViewController.m
//  VirginiaVacuums-Obj-c
//
//  Created by HARPREET SINGH on 1/20/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *pageTitleLabel;
@property (weak, nonatomic) IBOutlet UITableView *productsTableView;
@property (weak, nonatomic) IBOutlet UITextView *introductionTextView;

@end

@implementation ViewController
{
    ServiceFactory *serviceFactory;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    serviceFactory = [ServiceFactory sharedInstance];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> menuScreenInfo = [[serviceFactory.menuFetchedResultsController sections] objectAtIndex:section];
    return [menuScreenInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.productsTableView = tableView;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"]; // Subclass of the Custom matrix cell class.
        
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
    }
    
        ProductDetail *productDetail = [serviceFactory.menuFetchedResultsController objectAtIndexPath:indexPath]; // The Credit Fetched results controller returns an Array of Fetched objects from the credit card section that can be used to populate the rows of the section.
    
    
        cell.textLabel.text = @"RandomText";
    
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
