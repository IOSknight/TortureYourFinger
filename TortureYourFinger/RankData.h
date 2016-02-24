//
//  RankData.h
//  TortureYourFinger
//
//  Created by 刘畅 on 16/2/14.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Ranks+CoreDataProperties.h"


@interface RankData : NSObject
@property (nonatomic,strong)NSManagedObjectContext *context;
@property (nonatomic,strong)NSManagedObjectModel *model;
@property (nonatomic,strong)NSFetchedResultsController *controller;
@property (nonatomic,strong)NSString *userName;
@property (nonatomic,strong)NSArray *arrayForSort;

-(instancetype)init;
-(NSFetchedResultsController *)controller;

-(BOOL)saveChanges;
-(void)insertDataToParentStoreWithName:(NSString *)name WithScore:(NSInteger)score;
-(NSInteger)getPlayerRankWithScore:(NSInteger)score;
@end
