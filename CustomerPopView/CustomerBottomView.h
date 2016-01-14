//
//  CustomerBottomView.h
//  CustomerPopView
//
//  Created by juxi-ios on 16/1/14.
//  Copyright © 2016年 周灿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerBottomView : UIView


@property(nonatomic,strong)NSArray * dataArray;
- (instancetype)initWithArray:(NSArray *)array;
-(void)show;
-(void)dismiss;
@end
