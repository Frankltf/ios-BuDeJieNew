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
+(UIBarButtonItem *)backItemWithImage:(UIImage *)image heightImage:(UIImage *)heightImage target:(nullable id)target action:(SEL)action{
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:heightImage forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    backButton.contentEdgeInsets=UIEdgeInsetsMake(0, -20, 0, 0);
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:backButton];
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
