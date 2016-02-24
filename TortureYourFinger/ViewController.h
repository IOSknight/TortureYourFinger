//
//  ViewController.h
//  TortureYourFinger
//
//  Created by 刘畅 on 16/1/3.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCTouchAreaViewController.h"


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldForName;
@property (weak, nonatomic) IBOutlet UIButton *scoreModeButton;

- (IBAction)startCustomMode:(id)sender;

@end

