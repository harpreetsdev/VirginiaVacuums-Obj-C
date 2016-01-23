//
//  ServiceFactory.h
//  VirginiaVacuums-Obj-c
//
//  Created by Singh, Harpreet on 1/21/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface ServiceFactory : NSObject


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


+ (id)sharedInstance;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
