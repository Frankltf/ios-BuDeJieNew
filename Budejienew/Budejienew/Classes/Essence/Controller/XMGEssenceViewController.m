//
//  XMGEssenceViewController.m
//  Budejienew
//
//  Created by admin on 2017/6/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGEssenceViewController.h"
#import "UIBarButtonItem+Item.h"
@interface XMGEssenceViewController ()

@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    [self setupNavBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupNavBar{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] heightImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(dongzuo)];
    
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] heightImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(dongzuo)];
    
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
-(void)dongzuo{
    NSLog(@"%d",111);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
