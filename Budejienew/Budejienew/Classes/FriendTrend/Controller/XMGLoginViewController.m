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
    XMGRegisterView *re=[XMGRegisterView loginView];
    [self.containView addSubview:re];
    // Do any additional setup after loading the view from its nib.
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
