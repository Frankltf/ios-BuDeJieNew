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

static NSString * const ID=@"cell";
@interface XMGMeTableViewController ()<UICollectionViewDataSource>

@end

@implementation XMGMeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    [self setupFoot];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    collection.backgroundColor=[UIColor redColor];
    self.tableView.tableFooterView=collection;
    collection.dataSource=self;
    [collection registerNib:[UINib nibWithNibName:@"XMGSquareCell" bundle:nil] forCellWithReuseIdentifier:ID];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor=[UIColor blueColor];
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
