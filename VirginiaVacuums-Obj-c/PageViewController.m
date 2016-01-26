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

#pragma mark - Page View Controller Data Source Delegate Methods

- (ProductDetailViewController *)viewControllerAtIndex:(NSUInteger)index isBefore:(BOOL)beforeIndicator after:(BOOL)afterIndicator {
    if (([self.productArray count] == 0) || (index >= [self.productArray count])) {
        return nil;
    }
    ProductDetailViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
        pageContentViewController.productType = self.productType;
        pageContentViewController.productIndex = index;
    
       return pageContentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((ProductDetailViewController *) viewController).productIndex;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index isBefore:YES after:NO];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((ProductDetailViewController *) viewController).productIndex;
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == [self.productArray count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index isBefore:NO after:YES];
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
