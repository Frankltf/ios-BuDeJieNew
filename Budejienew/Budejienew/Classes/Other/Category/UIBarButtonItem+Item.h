//
//  UIBarButtonItem+Item.h
//  Budejienew
//
//  Created by admin on 2017/6/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)
+(UIBarButtonItem *)itemWithImage:(UIImage *)image heightImage:(UIImage *)heightImage target:(nullable id)target action:(SEL)action;
+(UIBarButtonItem *)itemWithImageS:(UIImage *)image heightImage:(UIImage *)heightImage target:(nullable id)target action:(SEL)action;
@end
