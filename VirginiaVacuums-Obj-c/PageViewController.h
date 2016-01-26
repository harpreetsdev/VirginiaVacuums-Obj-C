//
//  PageViewController.h
//  VirginiaVacuums-Obj-c
//
//  Created by HARPREET SINGH on 1/26/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceFactory.h"
#import "ProductDetailViewController.h"
@interface PageViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) NSString *productType;
@property (nonatomic) NSInteger productIndex;

@end
