//
//  Ranks+CoreDataProperties.h
//  TortureYourFinger
//
//  Created by 刘畅 on 16/2/19.
//  Copyright © 2016年 LCfan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Ranks.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ranks (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *playerName;
@property (nullable, nonatomic, retain) NSNumber *score;

@end

NS_ASSUME_NONNULL_END
