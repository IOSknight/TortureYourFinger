//
//  ViewController.m
//  TortureYourFinger
//
//  Created by 刘畅 on 16/1/3.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startCustomMode:(id)sender {
    
    LCTouchAreaViewController *TAVC=[[LCTouchAreaViewController alloc]initWithNibName:@"CustomMode" bundle:nil];
//    TAVC.navigationController.navigationBarHidden=NO;
    [self.navigationController pushViewController:TAVC animated:YES];
}
@end
