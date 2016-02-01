//
//  LCLevelEndViewController.h
//  TortureYourFinger
//
//  Created by 刘畅 on 16/1/18.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LCLevelEndViewController : UIViewController
@property (strong,nonatomic) NSString* score;
@property (weak, nonatomic) IBOutlet UILabel *Evaluate;
@property (weak, nonatomic) IBOutlet UILabel *beyondOrther;
@property (weak, nonatomic) IBOutlet UILabel *textForScore;
@property (weak, nonatomic) IBOutlet UILabel *valueForScore;
@property (copy,nonatomic) void (^RestartGame) (void);
@property (copy,nonatomic) void (^backToMainMenu) (void);

- (IBAction)restartGame:(id)sender;
- (IBAction)shareScore:(id)sender;
- (IBAction)backToMainMenu:(id)sender;

@end
