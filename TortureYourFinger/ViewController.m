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
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    _textFieldForName.text=[defaults objectForKey:@"lastUserName"];
    
    [_textFieldForName addTarget:self action:@selector(textFieldForNameDidChanged) forControlEvents:UIControlEventEditingChanged];
    
    if (_textFieldForName.text==nil || [_textFieldForName.text isEqual:@""]) {
        _scoreModeButton.enabled=NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startCustomMode:(id)sender {
    
    LCTouchAreaViewController *TAVC=[[LCTouchAreaViewController alloc]initWithNibName:@"CustomMode" bundle:nil];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:_textFieldForName.text forKey:@"lastUserName"];
    [self.navigationController pushViewController:TAVC animated:YES];
}

-(void)textFieldForNameDidChanged
{
    if (_textFieldForName.text!=nil && ![_textFieldForName.text isEqual:@""]) {
        _scoreModeButton.enabled=YES;
    }
}
@end
