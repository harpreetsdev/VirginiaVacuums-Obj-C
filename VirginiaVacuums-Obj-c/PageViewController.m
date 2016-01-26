//
//  PageViewController.m
//  VirginiaVacuums-Obj-c
//
//  Created by HARPREET SINGH on 1/26/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) NSArray *productArray;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpViews];
    
}
- (void) setUpViews {
    
   if ([self.productType isEqualToString:@"VacuumCleaner"]) {
       self.productArray = [[ServiceFactory sharedInstance] vacuumCleanerArray];
   } else if ([self.productType isEqualToString:@"AirPurifier"]) {
       self.productArray = [[ServiceFactory sharedInstance] airPurifierArray];
    } else if ([self.productType isEqualToString:@"ReplacementPart"]) {
        self.productArray = [[ServiceFactory sharedInstance] replacementPartsArray];
    }
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    ProductDetailViewController *initialViewController = [self viewControllerAtIndex:self.productIndex isBefore:NO after:NO];
    NSArray *viewControllers = @[initialViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
