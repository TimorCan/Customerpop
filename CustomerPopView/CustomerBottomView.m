//
//  CustomerBottomView.m
//  CustomerPopView
//
//  Created by juxi-ios on 16/1/14.
//  Copyright © 2016年 周灿. All rights reserved.
//

#import "CustomerBottomView.h"
#import <QuartzCore/QuartzCore.h>

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define MAXValue  20
@implementation CustomerBottomView


- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        
        self.dataArray = [NSArray arrayWithArray:array];
        [self setupBottomView];
    }
    return self;
}


-(void)setupBottomView
{
    self.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0,SCREEN_HEIGHT, SCREEN_WIDTH, 0.496*SCREEN_HEIGHT);
    [self configHeadView];
    [self congfigContentView];
    
}


-(void)configHeadView
{
    
    //已答字符串长度
    NSString * str1 = [NSString stringWithFormat:@"已答%lu",(unsigned long)self.dataArray.count];
    
    
     NSString * str2= [NSString stringWithFormat:@"已答%lu",(unsigned long)(MAXValue - self.dataArray.count)];
    UILabel * titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, SCREEN_HEIGHT *0.051)];
    titlelabel.font = [UIFont systemFontOfSize:13.f];
    NSString * titltStr = [NSString stringWithFormat:@"%@  %@",str1,str2];
    
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:titltStr];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0,str1.length)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(titltStr.length - str2.length,str2.length)];
    
    titlelabel.attributedText = str;
    [self addSubview:titlelabel];
    
    /*******button >******/
    
    UIButton * dissMissBtn = [[UIButton alloc]init];
    dissMissBtn.bounds = CGRectMake(0, 0, 80, SCREEN_HEIGHT *0.051);
    dissMissBtn.center = CGPointMake(self.center.x, SCREEN_HEIGHT *0.051*0.5);
//    dissMissBtn.backgroundColor =[UIColor redColor];
    [dissMissBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:dissMissBtn];
}

-(void)congfigContentView
{
    CGFloat x = (SCREEN_WIDTH - SCREEN_WIDTH*0.07*2 -SCREEN_WIDTH*0.09*4)/5.0;
    
    
    for(NSInteger i =  0 ; i<4; i++)
    {
        for (NSInteger j = 0; j<5; j++) {
            
            UIButton * button = [[UIButton alloc]init];
            button.frame = CGRectMake(SCREEN_WIDTH*0.07+j*(x+SCREEN_WIDTH*0.09),i*(x+SCREEN_WIDTH*0.09)+SCREEN_HEIGHT *0.051+10, x, x);
            button.layer.cornerRadius = x/2.0;
            NSString * buttonTitle =[NSString stringWithFormat:@"%d",i*5+j+1];
            [button setTitle:buttonTitle forState:UIControlStateNormal];
            button.clipsToBounds =YES;
            button.tag = i*5+j+1;
            button.backgroundColor =[UIColor whiteColor];
            button.layer.borderWidth = 0.7;
            button.layer.borderColor = [UIColor lightGrayColor].CGColor;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            for (NSString * title in self.dataArray) {
                if ([title isEqualToString:buttonTitle]) {
                    button.backgroundColor =[UIColor colorWithRed:74.0/255.0 green:148.0/255.0 blue:79/255.0 alpha:1.0];
                    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    button.layer.borderWidth = 0;

                }
            }
            
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
    }
    
}

-(void)buttonClick:(UIButton *)sender
{
    NSLog(@"%ld",(long)sender.tag);
}

//出来吧，比卡丘
-(void)show
{
   [UIView animateWithDuration:.75 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.7 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       self.frame = CGRectMake(0,SCREEN_HEIGHT - 0.496*SCREEN_HEIGHT, SCREEN_WIDTH, 0.496*SCREEN_HEIGHT);
       
       
   } completion:^(BOOL finished) {
       
       
   }];
}
/**
 *  奔跑吧，少年
 */
-(void)dismiss
{
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(0,SCREEN_HEIGHT, SCREEN_WIDTH, 0.496*SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        
    }];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIColor * color = [UIColor lightGrayColor];
    [color set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetLineWidth(context, 1.5);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 0, 0);  //起点坐标
    CGContextAddLineToPoint(context, SCREEN_WIDTH, 1);   //终点坐标
     CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
//     CGContextStrokePath(context);
   
     CGContextSetLineWidth(context, 1);  //线宽
    CGContextMoveToPoint(context, 0,SCREEN_HEIGHT *0.051);  //起点坐标
    CGContextAddLineToPoint(context, SCREEN_WIDTH, SCREEN_HEIGHT *0.051);   //终点坐标
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
   
   
    
    CGPoint sPoints[3];//坐标点
    sPoints[0] =CGPointMake(self.center.x-10, SCREEN_HEIGHT *0.051*0.4);//坐标1
    sPoints[1] =CGPointMake(self.center.x, SCREEN_HEIGHT *0.051*0.4+10);//坐标2
    sPoints[2] =CGPointMake(self.center.x+10, SCREEN_HEIGHT *0.051*0.4);//坐标3
    CGContextAddLines(context, sPoints, 3);//添加线
    CGContextStrokePath(context);
    
    
}

@end
