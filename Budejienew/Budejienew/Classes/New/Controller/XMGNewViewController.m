//
//  XMGNewViewController.m
//  Budejienew
//
//  Created by admin on 2017/6/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGNewViewController.h"
#import "UIBarButtonItem+Item.h"
#import "XMGSubTabTableViewController.h"
@interface XMGNewViewController ()

@end

@implementation XMGNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    // Do any additional setup after loading the view.
}
-(void)setupNavBar{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] heightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(dongzuo)];
    
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
-(void)dongzuo{
    XMGSubTabTableViewController *subTab=[[XMGSubTabTableViewController alloc]init];
    [self.navigationController pushViewController:subTab animated:YES];
    NSLog(@"%d",333);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
