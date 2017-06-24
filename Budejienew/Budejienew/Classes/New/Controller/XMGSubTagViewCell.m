//
//  XMGSubTagViewCell.m
//  Budejienew
//
//  Created by 刘腾飞 on 2017/6/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGSubTagViewCell.h"
//#import "XMGSubTabItem.h"
#import <UIImageView+WebCache.h>
@interface XMGSubTagViewCell ()
//@property (weak, nonatomic) IBOutlet UILabel *topTitle;
//@property (weak, nonatomic) IBOutlet UILabel *bottomTitle;
//@property (weak, nonatomic) IBOutlet UIImageView *imageface;

@end


@implementation XMGSubTagViewCell
//-(void)setItem:(XMGSubTabItem *)item{
//    _item=item;
//    _topTitle.text=item.theme_name;
//    _bottomTitle.text=item.sub_number;
////    [_imageface sd_setImageWithURL:[NSURL URLWithString:item.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
//}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
