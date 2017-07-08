//
//  XMGEssenceViewController.m
//  Budejienew
//
//  Created by admin on 2017/6/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGEssenceViewController.h"
#import "UIBarButtonItem+Item.h"

#import "XMGAllViewController.h"
#import "XMGVideoViewController.h"
#import "XMGVoiceViewController.h"
#import "XMGPictureViewController.h"
#import "XMGWordViewController.h"

#define xmg_w
@interface XMGEssenceViewController ()<UIScrollViewDelegate>
@property (nonatomic,weak)UIButton *previousButton;
@property (nonatomic,weak)UIScrollView *scrollview;
@property(nonatomic,weak)UIView *titleview;
@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    [self setupAllChildVcs];
    [self setupNavBar];
    [self setupScrollview];
    [self setupTitleView];
    // Do any additional setup after loading the view.
}
- (void)setupAllChildVcs
{
    [self addChildViewController:[[XMGAllViewController alloc] init]];
    [self addChildViewController:[[XMGVideoViewController alloc] init]];
    [self addChildViewController:[[XMGVoiceViewController alloc] init]];
    [self addChildViewController:[[XMGPictureViewController alloc] init]];
    [self addChildViewController:[[XMGWordViewController alloc] init]];
}
-(void)setupTitleView{
    UIView *titleView=[[UIView alloc]init];
    titleView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    titleView.frame=CGRectMake(0, 64, self.view.frame.size.width, 35);
    [self.view addSubview:titleView];
    self.titleview=titleView;
    [self setupTitleButtons:titleView];
    [self setupTitleUnderline];
}
-(void)setupTitleButtons:(UIView *)titleView{
    NSArray *titles=@[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSUInteger count=titles.count;
    CGFloat titleBtutonW=self.view.frame.size.width/count;
    CGFloat titleButtonH=titleView.frame.size.height;
    for(NSUInteger i=0;i<count;i++){
        UIButton *titleButton=[[UIButton alloc]init];
        [titleButton addTarget:self action:@selector(titleBtn:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:titleButton];
        titleButton.frame=CGRectMake(i*titleBtutonW, 0,titleBtutonW,titleButtonH);
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
}
-(void)titleBtn:(UIButton *)titleButton{
    [self.previousButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.previousButton=titleButton;
    [UIView animateWithDuration:1 animations:^{
        NSUInteger index=[self.titleview.subviews indexOfObject:titleButton];
        CGFloat offsetx= index * self.scrollview.frame.size.width;
        self.scrollview.contentOffset=CGPointMake(offsetx, self.scrollview.contentOffset.y);
    }];
}
-(void)setupTitleUnderline{
    
}
-(void)setupScrollview{
    UIScrollView *scrollview=[[UIScrollView alloc]init];
    scrollview.backgroundColor=[UIColor blueColor];
    scrollview.frame=self.view.bounds;
    scrollview.delegate=self;
    [self.view addSubview:scrollview];
    self.scrollview=scrollview;
    for(NSUInteger i=0;i<5;i++){
        UIView *childvc=self.childViewControllers[i].view;
        childvc.frame=CGRectMake(i*scrollview.frame.size.width, 0, scrollview.frame.size.width, scrollview.frame.size.height);
        [scrollview addSubview:childvc];
    }
//    for(NSUInteger i=0;i<5;i++){
//        UITableView *table=[[UITableView alloc]init];
//        table.frame=CGRectMake(i*scrollview.frame.size.width, 0, scrollview.frame.size.width, scrollview.frame.size.height);
//        [scrollview addSubview:table];
//    }
    
    scrollview.contentSize=CGSizeMake(5*scrollview.frame.size.width, 0);
    
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%d",22);
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
