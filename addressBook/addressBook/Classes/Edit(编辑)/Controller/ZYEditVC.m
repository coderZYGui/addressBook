//
//  ZYEditVC.m
//  addressBook
//
//  Created by 罂粟 on 2017/9/7.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYEditVC.h"
#import "ZYContactItem.h"

@interface ZYEditVC ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation ZYEditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:0 target:self action:@selector(editButton)];
    
    self.nameTextF.text = self.contactitem.name;
    self.phoneTextF.text = self.contactitem.phoneNumber;
    
}

- (void)editButton
{
    if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"编辑"]) {
        
        self.nameTextF.enabled = YES;
        self.phoneTextF.enabled = YES;
        //1. 当点击编辑按钮显示保存按钮
        self.saveBtn.hidden = NO;
        //2. 当点击编辑按钮设置phoneTextF为键盘第一响应者
        [self.phoneTextF becomeFirstResponder];
        
        //3. 当点击编辑按钮时,把编辑按钮的名字改为取消
        self.navigationItem.rightBarButtonItem.title = @"取消";
    }else{
        self.nameTextF.enabled = NO;
        self.phoneTextF.enabled = NO;
        self.saveBtn.hidden = YES;
        // 结束编辑
        [self.view endEditing:YES];
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        // 恢复之前的数据
        self.nameTextF.text = self.contactitem.name;
        self.phoneTextF.text = self.contactitem.phoneNumber;
        
    }

}

// 保存按钮的点击事件
- (IBAction)saveBtnClick:(id)sender {
    
    //当点击保存按钮后更改cell模型的数据
    self.contactitem.name = self.nameTextF.text;
    self.contactitem.phoneNumber = self.phoneTextF.text;
    
    // 通知控制器刷新tableView
    // 创建通知,并发布到通知中心
    [[NSNotificationCenter defaultCenter] postNotificationName:@"brushData" object:nil userInfo:nil];
    
    // 跳转到指定的控制器
    [self.navigationController popViewControllerAnimated:YES];
    
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
