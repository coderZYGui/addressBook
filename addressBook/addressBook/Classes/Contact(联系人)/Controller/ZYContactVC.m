//
//  ZYContactVC.m
//  addressBook
//
//  Created by 罂粟 on 2017/9/7.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYContactVC.h"
#import "ZYAddContactVC.h"
#import "ZYContactItem.h"
#import "ZYEditVC.h"

@interface ZYContactVC ()<ZYAddContactVCDelegate>

@property (nonatomic,strong) NSMutableArray *contactDataArr;

@end

@implementation ZYContactVC

- (NSMutableArray *)contactDataArr
{
    if (!_contactDataArr) {
        _contactDataArr = [NSMutableArray array];
    }
    return _contactDataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@的通讯录",self.name];
    // 设置导航条左边控件
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:0 target:self action:@selector(zhuX)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:0 target:self action:@selector(addContact)];
    
    // 监听通知
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:@"brushData" object:nil];
    
}

// 监听通知的方法
- (void) reloadTableView
{
    // 刷新表格
    [self.tableView reloadData];
    
}

// 移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"brushData" object:nil];
}

// 注销的点击事件
- (void)zhuX
{
    // 创建警示控制器
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"您确定要注销吗?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    // 创建动作按钮
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        // 当点击确定后跳转到上一控制器
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    // 把动作按钮添加到控制器上
    [alertVC addAction:OKAction];
    [alertVC addAction:cancelAction];
    
    // 显示控制器
    [self presentViewController:alertVC animated:YES completion:nil];
}

// 添加的点击事件
- (void)addContact
{
    ZYAddContactVC *addContactVC = [[ZYAddContactVC alloc] init];
    
    // 设置代理
    addContactVC.delegate = self;
    
    [self.navigationController pushViewController:addContactVC animated:YES];
}


// 实现代理方法
- (void)addContactVC:(ZYAddContactVC *)addContactVC andItem:(ZYContactItem *)contactItem
{
    // 把传入的模型数据放入数组中
    [self.contactDataArr addObject:contactItem];
    // 刷新表格
    [self.tableView reloadData];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}

#pragma -mark tableView的数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contactDataArr.count;
}

/**
 设置cell的内容
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    // 根据指定的ID标识去缓存池中去取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:ID];
        }
    
    // 设置cell的数据
    // 取出每一行的模型
    ZYContactItem *item = self.contactDataArr[indexPath.row];
    // 给每一行的数据赋值
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.phoneNumber;

    return cell;
}

// 当前选中的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 当前徐那种cell的数据模型
    ZYContactItem *item = self.contactDataArr[indexPath.row];
    // 跳转到编辑界面
    ZYEditVC *editVC = [[ZYEditVC alloc] init];
    // 赋值给编辑界面的数据
    editVC.contactitem = item;
    [self.navigationController pushViewController:editVC animated:YES];
    
}

@end
