//
//  LCButton.h
//  TortureYourFinger
//
//  Created by 刘畅 on 16/1/5.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LCButton : UIButton
@property (nonatomic) BOOL isTargetButton;
@property (nonatomic) NSInteger arrayIndex;
@property (nonatomic) bool isPressed;
@property (nonatomic) BOOL isAdjustAreaForPointInside;

-(void)setButtonsColor;


@end
