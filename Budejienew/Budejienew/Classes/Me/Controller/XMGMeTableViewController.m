//
//  XMGMeTableViewController.m
//  Budejienew
//
//  Created by admin on 2017/6/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGMeTableViewController.h"
#import "UIBarButtonItem+Item.h"
@interface XMGMeTableViewController ()

@end

@implementation XMGMeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)setupNavBar{
    UIBarButtonItem *settingItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] heightImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(dongzuo)];
    UIBarButtonItem *nightItem=[UIBarButtonItem itemWithImageS:[UIImage imageNamed:@"mine-moon-icon"] heightImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(nightOrDay:)];
    self.navigationItem.rightBarButtonItems=@[settingItem,nightItem];
    self.navigationItem.title=@"我的";
    

    
}
-(void)dongzuo{
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
