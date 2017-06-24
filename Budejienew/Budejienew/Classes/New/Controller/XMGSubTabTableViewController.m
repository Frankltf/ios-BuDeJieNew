//
//  XMGSubTabTableViewController.m
//  Budejienew
//
//  Created by 刘腾飞 on 2017/6/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGSubTabTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "XMGSubTabItem.h"
#import <HP_MJExtension/MJExtension.h>
#import "XMGSubTagViewCell.h"
 static NSString * const ID=@"cell";
@interface XMGSubTabTableViewController ()
@property (nonatomic,strong)NSArray *arr;
@end

@implementation XMGSubTabTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGSubTagViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    self.title=@"推荐标签";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)loadData{
    AFHTTPSessionManager *mr=[AFHTTPSessionManager manager];
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    [mr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *  _Nullable responseObject) {
        [responseObject writeToFile:@"/Users/liutengfei/pratice/ios-BuDeJieNew/Budejienew/subTab.plist" atomically:YES];
        _arr=[XMGSubTabItem mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XMGSubTagViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if(cell==nil){
//        //cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//        cell=[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([XMGSubTagViewCell class]) owner:nil options:nil][0];
//    }
    
    XMGSubTabItem *item=self.arr[indexPath.row];
    //cell.textLabel.text=item.theme_name;
    cell.item=item;
    // Configure the cell...
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
