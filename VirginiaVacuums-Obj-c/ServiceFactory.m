//
//  ServiceFactory.m
//  VirginiaVacuums-Obj-c
//
//  Created by Singh, Harpreet on 1/21/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

#import "ServiceFactory.h"

@implementation ServiceFactory

+(id)sharedInstance
{
    static ServiceFactory *serviceFactory; // Singleton method to initialize the Service factory only once.
    static dispatch_once_t once;
    
    dispatch_once (&once, ^{
        if (serviceFactory == nil) {
            
            serviceFactory = [[self alloc] init];
        }
    });
    
    return serviceFactory;
    
}

- (void) writeproductModelDataToPersistentStore // Write detail view data to the Persistent store during first install.
{
    NSString *jsonString = [[NSBundle mainBundle] pathForResource:@"ProductData" ofType:@"json"];
    NSError *error;
    NSString *dataString = [NSString stringWithContentsOfFile:jsonString encoding:NSUTF8StringEncoding error:&error];
    
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSArray *resultArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    for (NSDictionary *dictionary in resultArray) {
        
        NSLog(@"Dictionary = %@", dictionary);
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"ProductDetail" inManagedObjectContext:self.managedObjectContext];
        ProductDetail *productModel = [[ProductDetail alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        
        productModel.productType = dictionary[@"productType"];
        
        NSArray *productMenuArray = [dictionary valueForKeyPath:@"productDetail.menuScreen"];
        
        for (NSDictionary *menu in productMenuArray) {
            productModel.menuTitleText = menu[@"titleText"];
            productModel.menuCellImg = menu[@"titleText"];
        }
        
        NSArray *productDetailArray = [dictionary valueForKeyPath:@"productDetail.productDetailScreen"];
        
        for (NSDictionary *detailScreen in productDetailArray) {
            productModel.productDetailPageTitle = detailScreen[@"detailPageProductTitle"];
            productModel.productDetailPageImg = detailScreen[@"detailPageProductImage"];
            productModel.productFeatureText = detailScreen[@"productFeatureText"];
        }
    }
    
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "HSR.VirginiaVacuums_Obj_c" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"VirginiaVacuums_Obj_c" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"VirginiaVacuums_Obj_c.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


@end
