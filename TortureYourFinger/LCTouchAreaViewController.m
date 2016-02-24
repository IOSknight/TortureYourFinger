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
    
    _targetButtonNumbers=2;
    _ground=[[LCButtonGround alloc]initWithTouchView:[self.view viewWithTag:1]];
}


-(void)viewDidLayoutSubviews
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self setScoreLabel];
    [self setCountDownLabel];
    [self setGuideLabel];
    [self startGame];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self endGame];
}

-(void)resetLevel
{

    if ([_ground judgeAllTargets]) {
        [self setScoreLabel];
        [_ground removeTargetButtons];
        [_ground setAllTagetButtons:_targetButtonNumbers];
    }
}

-(void)startGame
{
    [_ground setAllTagetButtons:_targetButtonNumbers];
    _seconds=1;
    [self UPdateCountDownTimer];
    _jurgeTargetTimer=[NSTimer scheduledTimerWithTimeInterval:0.05f
                                                           target:self
                                                         selector:@selector(resetLevel)
                                                         userInfo:nil repeats:YES];
    _countDownTimer=[NSTimer scheduledTimerWithTimeInterval:1.0f
                                                         target:self
                                                       selector:@selector(UPdateCountDownTimer)
                                                       userInfo:nil repeats:YES];
}

-(void)endGame
{
    [_ground removeTargetButtons];
    [_jurgeTargetTimer invalidate];
    _jurgeTargetTimer=nil;
    [_countDownTimer invalidate];
    _countDownTimer=nil;
    _score=0;
    _guide.text=@"guide";
    NSLog(@"endGame");
}

-(void)UPdateCountDownTimer
{
    if (_seconds==0) {
        LCLevelEndViewController *levc=[[LCLevelEndViewController alloc]initWithNibName:@"LevelEnd" bundle:nil];
        levc.score=_score;
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
    UILabel *label=_countDownTimerLabel;
    if (_seconds!=0) {
        _seconds=_seconds-1;
        label.text= [NSString stringWithFormat: @"%ld", (long)_seconds];
    }
}
-(void)setGuideLabel
{
    
    if (!_dic) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"words" ofType:@"plist"];
        NSDictionary *rootDic=[NSDictionary dictionaryWithContentsOfFile:path];
        _dic=[rootDic objectForKey:@"guideWords"];
    }

    UILabel *label=_guide;
    if ([label.text isEqualToString:@"guide"]) {
        label.text=[_dic objectForKey:@"guide"];
    }
    
    if (0<_score && _score<=50) {
        label.text=[_dic objectForKey:@"comeOn"];
    }else if(50<_score && _score<=100){
        label.text=[_dic objectForKey:@"notBad"];
    }else if(100<_score && _score<=200){
        label.text=[_dic objectForKey:@"good"];
    }else if(200<_score && _score<=400){
        label.text=[_dic objectForKey:@"cool"];
    }else if(400<_score){
        label.text=[_dic objectForKey:@"amazing"];
    }
}
-(void)setScoreLabel
{
    if (!_score) {
        _score=0;
    }else{
        _score=_score+10;
        _scoreLabel.text= [NSString stringWithFormat: @"%ld", (long)_score];
        [self setGuideLabel];
    }
}

@end
