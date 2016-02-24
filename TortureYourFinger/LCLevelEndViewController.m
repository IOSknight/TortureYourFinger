//
//  LCLevelEndViewController.m
//  TortureYourFinger
//
//  Created by 刘畅 on 16/1/18.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import "LCLevelEndViewController.h"

@interface LCLevelEndViewController ()

@end

@implementation LCLevelEndViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _valueForScore.text=[NSString stringWithFormat:@"%ld",(long)_score];
    [self setEvaluationLabel];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    _rankData=[[RankData alloc]init];
    [_rankData insertDataToParentStoreWithName:[defaults objectForKey:@"lastUserName"] WithScore:_score];
    [self setTheRankLabel];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)restartGame:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.RestartGame];
}

- (IBAction)shareScore:(id)sender {
}

- (IBAction)backToMainMenu:(id)sender {

    self.backToMainMenu();
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    NSLog(@"viewWillDisapear");

}

-(void)setEvaluationLabel
{
    
    if (!_dic) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"words" ofType:@"plist"];
        NSDictionary *rootDic=[NSDictionary dictionaryWithContentsOfFile:path];
        _dic=[rootDic objectForKey:@"evaluation"];
    }
    
    UILabel *label=_Evaluate;

    if (0<_score && _score<=100) {
        label.text=[_dic objectForKey:@"okay"];
    }else if(100<_score && _score<=400){
        label.text=[_dic objectForKey:@"good"];
    }else if(400<_score){
        label.text=[_dic objectForKey:@"amazing"];
    }
}

-(void)setTheRankLabel
{
    NSString *rank=[NSString stringWithFormat:@"%ld",(long)[_rankData getPlayerRankWithScore:_score]];
    _rankLabel.text=[[@"进入了排行榜第" stringByAppendingString:rank] stringByAppendingString:@"名"];
    
}

-(void)Chart:(id)sender
{
    RankTableViewController *RTVC=[[RankTableViewController alloc]initWithNibName:@"RankTableView" bundle:nil];
    [self presentViewController:RTVC animated:YES completion:nil];
}
@end
