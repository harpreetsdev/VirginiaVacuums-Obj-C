//
//  ProductDetail+CoreDataProperties.h
//  VirginiaVacuums-Obj-c
//
//  Created by HARPREET SINGH on 1/24/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ProductDetail.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetail (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *menuCellImg;
@property (nullable, nonatomic, retain) NSString *menuTitleText;
@property (nullable, nonatomic, retain) NSString *productDetailPageImg;
@property (nullable, nonatomic, retain) NSString *productDetailPageTitle;
@property (nullable, nonatomic, retain) NSString *productFeatureText;
@property (nullable, nonatomic, retain) NSString *productType;
@property (nullable, nonatomic, retain) NSString *fetch;
@property (nullable, nonatomic, retain) NSString *seq;

@end

NS_ASSUME_NONNULL_END
