//
//  LCTouchAreaViewController.h
//  TortureYourFinger
//
//  Created by 刘畅 on 16/1/6.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCButtonGround.h"
#import "LCButton.h"
#import "LCLevelEndViewController.h"


@interface LCTouchAreaViewController : UIViewController

@property (nonatomic)NSInteger targetButtonNumbers;
@property (nonatomic,strong) NSTimer *jurgeTargetTimer;
@property (nonatomic,strong) NSTimer *countDownTimer;
@property (nonatomic,strong)LCButtonGround *ground;
@property (nonatomic)NSInteger seconds;
@property (nonatomic)NSInteger score;
@property (nonatomic,strong) NSDictionary* dic;

@property (weak, nonatomic) IBOutlet UILabel *countDownTimerLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *guide;

@end