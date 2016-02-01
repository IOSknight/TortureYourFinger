//
//  LCButtonGround.h
//  TortureYourFinger
//
//  Created by 刘畅 on 16/1/10.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCButton.h"
#ifdef DEBUG
#else
#define NSLog(...) {};
#endif


@interface LCButtonGround : UIView
@property (strong,nonatomic)NSMutableArray *array;
@property (strong,nonatomic)NSMutableArray *targetButtonArray;

-(void)setAllTagetButtons:(NSInteger ) targetButtonNumbers;
-(BOOL)judgeAllTargets;
-(void)removeTargetButtons;
-(instancetype)initWithTouchView:(UIView *) touchView;

@end
