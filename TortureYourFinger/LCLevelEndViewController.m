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
    self.textForScore.text=@"score";
    self.valueForScore.text=self.score;
    
    
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
@end
