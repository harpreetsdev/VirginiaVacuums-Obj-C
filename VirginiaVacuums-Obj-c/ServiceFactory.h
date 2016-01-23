//
//  ServiceFactory.h
//  VirginiaVacuums-Obj-c
//
//  Created by Singh, Harpreet on 1/21/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ProductDetail.h"
@interface ServiceFactory : NSObject <NSFetchedResultsControllerDelegate>


@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSFetchedResultsController *menuFetchedResultsController;
@property (strong, nonatomic) NSArray *vacuumCleanerArray;
@property (strong, nonatomic) NSArray *airPurifierArray;
@property (strong, nonatomic) NSArray *replacementPartsArray;



+ (id)sharedInstance;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
