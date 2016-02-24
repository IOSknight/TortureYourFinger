//
//  RankTableViewController.h
//  TortureYourFinger
//
//  Created by 刘畅 on 16/2/10.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankData.h"
#import "RankTableViewCell.h"
#import "Ranks+CoreDataProperties.h"


@interface RankTableViewController : UITableViewController

@property (nonatomic,strong)RankData* rankData;


@end
