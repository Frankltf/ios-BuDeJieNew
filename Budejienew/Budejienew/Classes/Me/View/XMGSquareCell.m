//
//  XMGSquareCell.m
//  Budejienew
//
//  Created by admin on 2017/6/29.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGSquareCell.h"
#import <UIImageView+WebCache.h>
#import "XMGSquareItem.h"
@interface XMGSquareCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation XMGSquareCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setItem:(XMGSquareItem *)item{
    _item=item;
    self.nameLabel.text=item.name;
    [_headerImage sd_setImageWithURL:[NSURL URLWithString:item.icon]];
    
    
}
@end
