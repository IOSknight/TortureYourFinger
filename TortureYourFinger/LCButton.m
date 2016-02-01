//
//  LCButton.m
//  TortureYourFinger
//
//  Created by 刘畅 on 16/1/5.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import "LCButton.h"

@implementation LCButton


-(void)setButtonsColor
{
    if (_isTargetButton==YES && self.selected==NO) {
        self.backgroundColor=[UIColor redColor];
    }else if(_isTargetButton==NO){
        self.backgroundColor=[UIColor grayColor];
    }else if(_isTargetButton==YES && self.selected==YES){
        self.backgroundColor=[UIColor greenColor];
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.selected=YES;
    [self setButtonsColor];
    NSLog(@"touchBegan");
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.selected=NO;
    [self setButtonsColor];
    NSLog(@"touchEnded");

}

//扩大点击反应区域
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    
    CGRect bound = self.bounds;
    NSLog(@"pointInside w %f h %f",self.bounds.size.width,self.bounds.size.height);
    bound = CGRectInset(bound, -0.2 * bound.size.width,-0.2* bound.size.height);
    NSLog(@"pointInside bounds w %f h %f",bound.size.width,bound.size.height);
    NSLog(@"index %ld", (long)self.arrayIndex);
    return CGRectContainsPoint(bound, point);
}

-(void)layoutSubviews
{
    NSLog(@"button layoutSubviews");
    NSLog(@"btn size w %f h %f",self.bounds.size.width,self.bounds.size.height);
}
@end
