//
//  XMGLoginViewController.m
//  Budejienew
//
//  Created by admin on 2017/6/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGLoginViewController.h"
#import "XMGRegisterView.h"
@interface XMGLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *containView;

@end

@implementation XMGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XMGRegisterView *login=[XMGRegisterView loginView];
    [self.containView addSubview:login];
    
    XMGRegisterView *re=[XMGRegisterView registerView];
    [self.containView addSubview:re];
    // Do any additional setup after loading the view from its nib.
}
// viewDidLayoutSubviews:才会根据布局调整控件的尺寸
- (void)viewDidLayoutSubviews
{
    // 一定要调用super

//    // 设置登录view
//    XMGLoginRegisterView *loginView = self.middleView.subviews[0];
//    loginView.frame = CGRectMake(0, 0, self.middleView.xmg_width * 0.5, self.middleView.xmg_height);
//    
//    // 设置注册view
//    XMGLoginRegisterView *registerView = self.middleView.subviews[1];
//    registerView.frame = CGRectMake( self.middleView.xmg_width * 0.5, 0,self.middleView.xmg_width * 0.5, self.middleView.xmg_height);
//    
//    // 设置快速登录
//    XMGFastLoginView *fastLoginView = self.bottomView.subviews.firstObject;
//    fastLoginView.frame = self.bottomView.bounds;
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)regiseBtn:(UIButton *)sender {
    sender.selected=!sender.selected;
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
