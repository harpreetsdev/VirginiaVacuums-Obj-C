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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //ServiceFactory *serviceFactory = [ServiceFactory sharedInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
