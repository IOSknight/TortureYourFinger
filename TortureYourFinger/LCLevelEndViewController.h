//
//  LCLevelEndViewController.h
//  TortureYourFinger
//
//  Created by 刘畅 on 16/1/18.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankData.h"
#import "RankTableViewController.h"


@interface LCLevelEndViewController : UIViewController
@property (nonatomic) NSInteger score;
@property (strong,nonatomic) NSDictionary *dic;
@property (strong,nonatomic) RankData *rankData;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;

@property (weak, nonatomic) IBOutlet UILabel *Evaluate;
@property (weak, nonatomic) IBOutlet UILabel *textForScore;
@property (weak, nonatomic) IBOutlet UILabel *valueForScore;

@property (copy,nonatomic) void (^RestartGame) (void);
@property (copy,nonatomic) void (^backToMainMenu) (void);
- (IBAction)Chart:(id)sender;

- (IBAction)restartGame:(id)sender;
- (IBAction)shareScore:(id)sender;
- (IBAction)backToMainMenu:(id)sender;

@end
