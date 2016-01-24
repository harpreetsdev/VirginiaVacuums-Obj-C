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
    [self setUpView];
    self.productsTableView.delegate = self;
    self.productsTableView.dataSource = self;
}

- (void) setUpView {
    
    self.scrollView.contentSize = CGSizeMake(600, self.introductionTextView.frame.origin.y + self.introductionTextView.frame.size.height + 60);
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //id <NSFetchedResultsSectionInfo> menuScreenInfo = [[serviceFactory.menuFetchedResultsController sections] objectAtIndex:section]; [menuScreenInfo numberOfObjects];
    return 3;// Added a static number of rows for now.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.productsTableView = tableView;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"]; // Subclass of the Custom matrix cell class.
        
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    }
    
    ProductDetail *productDetail = [serviceFactory.menuFetchedResultsController objectAtIndexPath:indexPath];     
    
    cell.textLabel.text = productDetail.menuTitleText;
    NSString *imageString = [NSString stringWithFormat:@"%@", productDetail.menuCellImg];
    cell.imageView.image = [UIImage imageNamed:imageString];
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
