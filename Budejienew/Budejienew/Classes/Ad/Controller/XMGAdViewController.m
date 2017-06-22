
//
//  XMGAdViewController.m
//  Budejienew
//
//  Created by admin on 2017/6/22.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGAdViewController.h"


//#define XMGScreenW [UIScreen mainScreen].bounds.size.width
//#define XMGScreenH [UIScreen mainScreen].bounds.size.height
//#define iphone6P (XMGScreenH === 736)
//#define iphone6 (XMGScreenH === 667)
//#define iphone5 (XMGScreenH === 568)
//#define iphone4 (XMGScreenH === 480)
//#define XMGScreenW [UIScreen mainScreen].bounds.size.width

#define XMGScreenW [UIScreen mainScreen].bounds.size.width
#define XMGScreenH [UIScreen mainScreen].bounds.size.height
#define iphone6P (XMGScreenH == 736)
#define iphone6 (XMGScreenH == 667)
#define iphone5 (XMGScreenH == 568)
#define iphone4 (XMGScreenH == 480)

@interface XMGAdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImage;
@property (weak, nonatomic) IBOutlet UIView *addContainerView;
@property (weak, nonatomic) IBOutlet UIButton *skipBtn;

@end

@implementation XMGAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setuplaunchImage];
    // Do any additional setup after loading the view.
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
