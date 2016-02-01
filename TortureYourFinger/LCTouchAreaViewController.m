//
//  LCTouchAreaViewController.m
//  TortureYourFinger
//
//  Created by 刘畅 on 16/1/6.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import "LCTouchAreaViewController.h"

@implementation LCTouchAreaViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.targetButtonNumbers=2;
   
    
    self.ground=[[LCButtonGround alloc]initWithTouchView:[self.view viewWithTag:1]];
   
    [self startGame];

}


-(void)viewDidLayoutSubviews
{
    NSLog(@"viewDidLayoutSubviews");
    LCButton *btn =self.ground.array[0];
    NSLog(@"btn size w %f h %f",btn.bounds.size.width,btn.bounds.size.height);

}

-(void)viewWillAppear:(BOOL)animated
{
    
    NSLog(@"view will appear");
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self endGame];
    NSLog(@"lctouchareaview: view will disappear");
}

-(void)resetLevel
{

    if ([self.ground judgeAllTargets]) {
        self.score=self.score+10;
        [self.ground removeTargetButtons];
        [self.ground setAllTagetButtons:self.targetButtonNumbers];
    }
}

-(void)startGame
{
    [self.ground setAllTagetButtons:self.targetButtonNumbers];
    //3秒用作测试
    self.seconds=1000;
    [self UPdateCountDownTimer];
    self.jurgeTargetTimer=[NSTimer scheduledTimerWithTimeInterval:0.05f
                                                           target:self
                                                         selector:@selector(resetLevel)
                                                         userInfo:nil repeats:YES];
    self.countDownTimer=[NSTimer scheduledTimerWithTimeInterval:1.0f
                                                         target:self
                                                       selector:@selector(UPdateCountDownTimer)
                                                       userInfo:nil repeats:YES];
}

-(void)endGame
{
    [self.ground removeTargetButtons];
    [self.jurgeTargetTimer invalidate];
    self.jurgeTargetTimer=nil;
    [self.countDownTimer invalidate];
    self.countDownTimer=nil;
    NSLog(@"endGame");
}

-(void)UPdateCountDownTimer
{
    if (self.seconds==0) {
        LCLevelEndViewController *levc=[[LCLevelEndViewController alloc]initWithNibName:@"LevelEnd" bundle:nil];
        levc.score=[NSString stringWithFormat:@"%ld",(long)self.score];
        //对应重来
        levc.RestartGame=^{
            [self startGame];
            NSLog(@"run starGame in block");
        };
        //对应返回
        levc.backToMainMenu=^{
            [self.navigationController popToRootViewControllerAnimated:NO];
            NSLog(@" run backToMainMenu in block ");
        };
        
        [self presentViewController:levc animated:YES completion:nil];
    }else {
        [self setCountDownLabel];
    }
}

-(void)setCountDownLabel
{
    UILabel *label=self.countDownTimerLabel;
    if ([label.text isEqual:@"timer"]) {
        label.text=[NSString stringWithFormat:@"%ld",(long)self.seconds];
    }else {
        self.seconds=self.seconds-1;
        label.text= [NSString stringWithFormat: @"%ld", (long)self.seconds];
    }
}
//-(void)setGuideLabel
//{
//    UILabel *label=self.guide;
//    if ([label.text isEqualToString:@"guide"]) {
//        label.text=[NSString stringWithFormat:@"";
//    }
//}
//-(void)setScoreLabel
//
//    }

@end
