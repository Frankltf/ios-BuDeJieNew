//
//  XMGMeTableViewController.m
//  Budejienew
//
//  Created by admin on 2017/6/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGMeTableViewController.h"
#import "UIBarButtonItem+Item.h"
#import "XMGSettingTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "XMGSquareItem.h"
#import "XMGSquareCell.h"
#import <HP_MJExtension/MJExtension.h>

static NSString * const ID=@"cell";
@interface XMGMeTableViewController ()<UICollectionViewDataSource>
@property (nonatomic,strong)NSArray *squareArr;
@property(nonatomic,weak)UICollectionView *collectionV;
@end

@implementation XMGMeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    [self setupFoot];
    [self loadData];
    self.tableView.sectionHeaderHeight=0;
    self.tableView.sectionFooterHeight=10;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)loadData{
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    // 2.拼接请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"square";
    parameters[@"c"] = @"topic";
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [responseObject writeToFile:@"/ios3/ios-BuDeJieNew/Budejienew/square.plist" atomically:nil];
        NSArray *dicArr=responseObject[@"square_list"];
        _squareArr=[XMGSquareItem mj_objectArrayWithKeyValuesArray:dicArr];
        
        self.tableView.tableFooterView=self.collectionV;
        [self.collectionV reloadData];
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"%@",error);
    }];
}
-(void)setupFoot{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    NSInteger cols=4;
    CGFloat margin=4;
    CGFloat itemWH=([UIScreen mainScreen].bounds.size.width-(cols-1)*margin)/cols;
    
    layout.itemSize=CGSizeMake(itemWH, itemWH);
    layout.minimumInteritemSpacing=margin;
    layout.minimumLineSpacing=margin;
    
    
    
    UICollectionView *collection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
    _collectionV=collection;
    collection.backgroundColor=[UIColor redColor];
    self.tableView.tableFooterView=collection;
    collection.dataSource=self;
    collection.scrollEnabled=NO;
    [collection registerNib:[UINib nibWithNibName:@"XMGSquareCell" bundle:nil] forCellWithReuseIdentifier:ID];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.squareArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XMGSquareCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor=[UIColor blueColor];
    cell.item=self.squareArr[indexPath.row];
    return cell;
}
-(void)setupNavBar{
    UIBarButtonItem *settingItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] heightImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(dongzuo)];
    UIBarButtonItem *nightItem=[UIBarButtonItem itemWithImageS:[UIImage imageNamed:@"mine-moon-icon"] heightImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(nightOrDay:)];
    self.navigationItem.rightBarButtonItems=@[settingItem,nightItem];
    self.navigationItem.title=@"我的";
}
-(void)dongzuo{
    XMGSettingTableViewController *setting=[[XMGSettingTableViewController alloc]init];
    setting.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:setting animated:YES];
    NSLog(@"%d",333);
}
-(void)nightOrDay:(UIButton *)button{
    button.selected=!button.selected;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



@end
