//
//  XMGRegisterView.m
//  Budejienew
//
//  Created by admin on 2017/6/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGRegisterView.h"

@implementation XMGRegisterView
+(instancetype)loginView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
+(instancetype)registerView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
