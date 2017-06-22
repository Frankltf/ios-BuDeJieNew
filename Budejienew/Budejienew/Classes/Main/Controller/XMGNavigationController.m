//
//  XMGNavigationController.m
//  Budejienew
//
//  Created by admin on 2017/6/22.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGNavigationController.h"
#import "UIBarButtonItem+Item.h"
@interface XMGNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XMGNavigationController
+(void)load{
    UINavigationBar *navBar=[UINavigationBar appearance];
    
    NSMutableDictionary *attr=[NSMutableDictionary dictionary];
    attr[NSFontAttributeName]=[UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:attr];
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(self.childViewControllers.count>0){
                viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] heightImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(backButton)];
    }
    [super pushViewController:viewController animated:animated];
}
-(void)backButton{
    [self popViewControllerAnimated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    pan.delegate=self;
    self.interactivePopGestureRecognizer.enabled=NO;
    
    // Do any additional setup after loading the view.
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.childViewControllers.count > 1;
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
