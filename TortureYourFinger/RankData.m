//
//  RankData.m
//  TortureYourFinger
//
//  Created by 刘畅 on 16/2/14.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import "RankData.h"

@implementation RankData


-(instancetype)init
{
    self=[super init];
    
    if (self) {
    //model and coordinator
    _model=[NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *psc=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:_model];
     
    //SQLite路径
    NSString *documentDirectory=
    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path=[documentDirectory stringByAppendingPathComponent:@"rankData.sqlite"];
    NSURL *storeDataURL=[NSURL fileURLWithPath:path];
    NSLog(@"url %@",storeDataURL);
    
    NSError *error= nil;
    if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                           configuration:nil URL:storeDataURL
                                 options:nil
                                   error:&error])
    {
        @throw [NSException exceptionWithName:@"OpenFailure"
                                       reason:[error localizedDescription]
                                     userInfo:nil];
    }
        
    _context=[[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    _context.persistentStoreCoordinator=psc;
        
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
        
    NSEntityDescription *ED=[NSEntityDescription entityForName:@"Ranks" inManagedObjectContext:_context];
    request.entity=ED;
        
        NSSortDescriptor *SD=[[NSSortDescriptor alloc]initWithKey:@"score" ascending:NO];
    request.sortDescriptors=@[SD];
        NSLog(@"request: %@",request);
        
    _controller=[[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:_context sectionNameKeyPath:nil cacheName:nil];
        NSLog(@"_controller:%@",_controller);
        
    if (![_controller performFetch:&error]) {
        NSLog(@"error fetching data %@",[error localizedFailureReason]);
    }
}
    return self;
}

-(BOOL)saveChanges
{
    NSError *error;
    BOOL successful=[self.context save:&error];
    if (!successful) {
        NSLog(@"error saving: %@",[error localizedDescription]);
    }
    return successful;
}

-(void)insertDataToParentStoreWithName:(NSString *)name WithScore:(NSInteger)score
{
    Ranks *rank=(Ranks*)[NSEntityDescription insertNewObjectForEntityForName:@"Ranks" inManagedObjectContext:self.context];
    rank.playerName=name;
    rank.score=[NSNumber numberWithInteger:score];
    [self saveChanges];
}


-(NSInteger)getPlayerRankWithScore:(NSInteger)score;
{

    _arrayForSort=[NSArray arrayWithArray:self.controller.fetchedObjects];
    NSInteger i;
    for (int i=0;i<_arrayForSort.count; i++) {
        NSInteger s=[[_arrayForSort[i] score] integerValue];
        if (score >= s) {
            break;
        }
    }
    return i+1;
}
@end
