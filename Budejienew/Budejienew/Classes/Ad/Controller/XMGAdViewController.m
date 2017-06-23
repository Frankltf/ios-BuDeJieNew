
//
//  XMGAdViewController.m
//  Budejienew
//
//  Created by admin on 2017/6/22.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGAdViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <HP_MJExtension/MJExtension.h>
#import "XMGAdItem.h"
#import <UIImageView+WebCache.h>
#import "XMGTabBarController.h"

#define XMGScreenW [UIScreen mainScreen].bounds.size.width
#define XMGScreenH [UIScreen mainScreen].bounds.size.height
#define iphone6P (XMGScreenH == 736)
#define iphone6 (XMGScreenH == 667)
#define iphone5 (XMGScreenH == 568)
#define iphone4 (XMGScreenH == 480)
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"
@interface XMGAdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImage;
@property (weak, nonatomic) IBOutlet UIView *addContainerView;
@property (weak, nonatomic) IBOutlet UIButton *skipBtn;
@property (nonatomic,weak) UIImageView *adView;
@property (nonatomic,strong) XMGAdItem *adItem;
@property (nonatomic,weak)NSTimer *timer;

@end

@implementation XMGAdViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setuplaunchImage];
    [self loadAdData];
    [self setupTimer];
    // Do any additional setup after loading the view.
}
-(UIImageView *)adView{
    if(_adView == nil){
        UIImageView *imageView=[[UIImageView alloc]init];
        [self.addContainerView addSubview:imageView];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toAd)];
        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled=YES;
        _adView=imageView;
    }
    return _adView;
}
-(void)setupTimer{
    _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}
-(void)timeChange{
    static int i=3;
    if(i==0){
        [self jump];
        return;
    }
    i--;
    [_skipBtn setTitle:[NSString stringWithFormat:@"跳转 0%d",i] forState:UIControlStateNormal];
}
-(void)toAd{
    NSURL *url=[NSURL URLWithString:_adItem.ori_curl];
    UIApplication *app=[UIApplication sharedApplication];
    if([app canOpenURL:url]){
        [app openURL:url];
    }
}
-(void)jump{
    XMGTabBarController *tabBar=[[XMGTabBarController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController=tabBar;
    [_timer invalidate];
}
- (IBAction)jumpClick:(id)sender {
    [self jump];
}
-(void)loadAdData{
    AFHTTPSessionManager *mr=[AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"code2"]=code2;
    [mr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [responseObject writeToFile:@"/ios3/ios-BuDeJieNew/Budejienew/ad.plist" atomically:YES];
        NSDictionary *adDict=[responseObject[@"ad"] lastObject];
        _adItem=[XMGAdItem mj_objectWithKeyValues:adDict];
        CGFloat h=XMGScreenW/_adItem.w * _adItem.h;
        self.adView.frame=CGRectMake(0, 0, XMGScreenW, h);
        [self.adView sd_setImageWithURL:[NSURL URLWithString:_adItem.w_picurl]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
-(void)setuplaunchImage{
    if(iphone6P){
        self.launchImage.image=[UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }else if(iphone6){
        self.launchImage.image=[UIImage imageNamed:@"LaunchImage-800-667h"];
    }else if(iphone5){
        self.launchImage.image=[UIImage imageNamed:@"LaunchImage-568h"];
    }else if(iphone4){
        self.launchImage.image=[UIImage imageNamed:@"LaunchImage-700"];
    }
    
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
