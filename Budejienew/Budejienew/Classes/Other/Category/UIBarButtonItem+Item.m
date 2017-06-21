//
//  UIBarButtonItem+Item.m
//  Budejienew
//
//  Created by admin on 2017/6/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)
+(UIBarButtonItem *)itemWithImage:(UIImage *)image heightImage:(UIImage *)heightImage target:(nullable id)target action:(SEL)action{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:heightImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containView=[[UIView alloc]initWithFrame:btn.bounds];
    [containView addSubview:btn];
    return [[UIBarButtonItem alloc]initWithCustomView:containView];
}
+(UIBarButtonItem *)itemWithImageS:(UIImage *)image heightImage:(UIImage *)heightImage target:(nullable id)target action:(SEL)action{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:heightImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containView=[[UIView alloc]initWithFrame:btn.bounds];
    [containView addSubview:btn];
    return [[UIBarButtonItem alloc]initWithCustomView:containView];
}
@end
