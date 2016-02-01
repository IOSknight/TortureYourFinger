//
//  LCButtonGround.m
//  TortureYourFinger
//
//  Created by 刘畅 on 16/1/10.
//  Copyright © 2016年 LCfan. All rights reserved.
//

#import "LCButtonGround.h"
#import "LCButton.h"
#define frameWidth (frame.size.width)
#define frameHight (frame.size.height)

@implementation LCButtonGround
- (instancetype)initWithTouchView:(UIView *)touchView
{
    self = [super init];
    if (self) {
        self.array=[[NSMutableArray alloc]init];
        self.targetButtonArray=[[NSMutableArray alloc]init];
        
        for (int i=0; i<25; i++) {
            LCButton *btn=[[LCButton alloc]init];

            btn.isTargetButton=NO;
            btn.arrayIndex=i;
            btn.enabled=NO;
            btn.layer.masksToBounds=YES;
            btn.layer.borderColor=[UIColor blackColor].CGColor;
            btn.layer.borderWidth=1.0;
            btn.translatesAutoresizingMaskIntoConstraints=NO;
            [btn setButtonsColor];
            
            [touchView addSubview:btn];
            [self.array addObject:btn];
        }
        //生成按钮完毕，开始布局所有按钮
        [self setLayoutConstraintsWithSuperivewForButtons:touchView];
        
    }
    return self;
}




-(void)setAllTagetButtons:(NSInteger ) targetButtonNumbers;
{
    //C数组
    NSInteger temp[25];
    
    //给这个24个位置赋值
    for (int i=0; i<25; i++) {
        temp[i]=1;
    }
    
    //用于记录生成了几个targetButton
    NSInteger j=0;
    
    //开始随机选择targetButtonNumbers个按钮为targetButton
    while (j!=targetButtonNumbers) {
        NSInteger A=arc4random() %25;
        //找到合适的随机数否？
        if (temp[A]!=0) {
            temp[A]=0;
            LCButton* btn= self.array[A];
            
            btn.isTargetButton=YES;
            btn.enabled=YES;
            [btn setButtonsColor];
            
            [self.targetButtonArray addObject:btn];
            
            j++;
        }
    }
}

-(BOOL)judgeAllTargets
{
    BOOL b=YES;
    for (LCButton *btn in self.targetButtonArray) {
        b=btn.selected && b;
    }
    
    return b;
}

-(void)removeTargetButtons
{
    NSUInteger j =self.targetButtonArray.count;
    for (int i=0; i<j; i++) {
        //这是顺序表，你删完他还会调循序不要动下标
        LCButton* btn=self.targetButtonArray[0];
        btn.isTargetButton=NO;
        btn.selected=NO;
        [btn setButtonsColor];
        [self.targetButtonArray removeObject:btn];
    }
    NSLog(@"clean up");
}

-(void)setLayoutConstraintsWithSuperivewForButtons:(UIView *)superview
{
    for (int i=0; i<self.array.count; i++) {
        LCButton *btn=self.array[i];
        //top
        if (i/5==0) {
            NSLayoutConstraint* topToSuper=[NSLayoutConstraint
                                     constraintWithItem:btn
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:superview
                                     attribute:NSLayoutAttributeTop
                                     multiplier:1
                                     constant:0];
            [superview addConstraint:topToSuper];
        }
        //bottom
        if (i/5==4) {
            NSLayoutConstraint* bottomToSuper=[NSLayoutConstraint
                                     constraintWithItem:btn
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:superview
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1
                                     constant:0];
            [superview addConstraint:bottomToSuper];
        }else {
            NSLayoutConstraint* bottom=[NSLayoutConstraint
                                     constraintWithItem:btn
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.array[i+5]
                                     attribute:NSLayoutAttributeTop
                                     multiplier:1
                                     constant:0];
            [superview addConstraint:bottom];
        }
        
        //leading
        if (i%5==0) {
            NSLayoutConstraint* leading=[NSLayoutConstraint
                                        constraintWithItem:btn
                                        attribute:NSLayoutAttributeLeading
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:superview
                                        attribute:NSLayoutAttributeLeading
                                        multiplier:1
                                        constant:0];
            [superview addConstraint:leading];
        }
        //trailing
        if (i%5==4) {
            NSLayoutConstraint* trailing=[NSLayoutConstraint
                                         constraintWithItem:btn
                                         attribute:NSLayoutAttributeTrailing
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:superview
                                         attribute:NSLayoutAttributeTrailing
                                         multiplier:1
                                         constant:0];
            [superview addConstraint:trailing];
        }else{
            NSLayoutConstraint* trailing=[NSLayoutConstraint
                                          constraintWithItem:btn
                                          attribute:NSLayoutAttributeTrailing
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.array[i+1]
                                          attribute:NSLayoutAttributeLeading
                                          multiplier:1
                                          constant:0];
            [superview addConstraint:trailing];
        }
        
        if (i!=24) {
        //width
        NSLayoutConstraint *widthEqual=[NSLayoutConstraint
                                        constraintWithItem:btn
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.array[i+1]
                                        attribute:NSLayoutAttributeWidth
                                        multiplier:1
                                        constant:0];
        [superview addConstraint:widthEqual];
        
        //height
        NSLayoutConstraint *heightEqual=[NSLayoutConstraint
                                        constraintWithItem:btn
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.array[i+1]
                                        attribute:NSLayoutAttributeHeight
                                        multiplier:1
                                        constant:0];
        [superview addConstraint:heightEqual];
        }
    }
    NSLog(@"setlayout");
}
@end
