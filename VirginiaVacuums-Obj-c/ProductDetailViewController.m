//
//  ProductDetailViewController.m
//  VirginiaVacuums-Obj-c
//
//  Created by HARPREET SINGH on 1/24/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *productFeatureText;




@end

@implementation ProductDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self bindVacuumViews];
    
}

- (void) setUpView {
    
    self.scrollView.contentSize = CGSizeMake(600, self.productFeatureText.frame.origin.y + self.productFeatureText.frame.size.height + 60);
    
    
}

- (void) bindVacuumViews {
    NSString *imageString = [[[ServiceFactory sharedInstance] vacuumCleanerArray][self.productIndex] valueForKey:@"productDetailPageImg"];
    UIImage *prodImg = [UIImage imageNamed:imageString];
    self.productImageView.image = prodImg;
    self.productNameLabel.text = [[[ServiceFactory sharedInstance] vacuumCleanerArray][self.productIndex] valueForKey:@"productDetailPageTitle"];
    self.productFeatureText.text = [[[ServiceFactory sharedInstance] vacuumCleanerArray][self.productIndex] valueForKey:@"productFeatureText"];
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

//@interface NSLayoutConstraint (Description);
//
//@end
//
//@implementation NSLayoutConstraint (Description)
//
//-(NSString *)description {
//    return [NSString stringWithFormat:@"id: %@, constant: %f", self.identifier, self.constant];
//}
//
//
//@end
//



/* 
 <NSLayoutConstraint:0x7f87a2607df0 H:[UIButton:0x7f87a2612bb0]-(545)-|   (Names: '|':UIView:0x7f87a2612440 )>
 <NSLayoutConstraint:0x7f993e1451d0 H:[UIButton:0x7f993e140320]-(545)-|   (Names: '|':UIView:0x7f993e140190 )>
*/