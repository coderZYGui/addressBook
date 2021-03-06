//
//  ZYLoginVC.m
//  addressBook
//
//  Created by 罂粟 on 2017/9/7.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYLoginVC.h"
#import "MBProgressHUD+XMG.h"
#import "ZYContactVC.h"

@interface ZYLoginVC ()

/** 用户名 */
@property (weak, nonatomic) IBOutlet UITextField *userNameTextF;

/** 密码 */
@property (weak, nonatomic) IBOutlet UITextField *pwdTextF;

/** 登录按钮 */
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

/** 记住密码switch */
@property (weak, nonatomic) IBOutlet UISwitch *rememberSwitch;

/** 自动登录switch */
@property (weak, nonatomic) IBOutlet UISwitch *autoSwitch;

/** 背景图片 */
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

@implementation ZYLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 给文本框设置
    self.userNameTextF.placeholder = @"请输入账号...";
    self.pwdTextF.placeholder = @"请输入密码...";
    
    // 给文本框设置点击事件
    [self.userNameTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.pwdTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    // 密码不直接显示
    self.pwdTextF.secureTextEntry = YES;
    
    // 判断是否文本框是否有值
    [self textChange];
    
    // 设置毛玻璃
    UIToolbar *toobar = [[UIToolbar alloc] initWithFrame:self.bgImageView.bounds];
    toobar.barStyle = UIBarStyleDefault;
    toobar.alpha = 0.5;
    [self.bgImageView addSubview:toobar];
    
    self.title = @"朝阳通讯录";
    
    NSLog(@"%@",NSHomeDirectory());

}

// 文本框的事件方法
- (void)textChange
{
    // 当两个输入框都有值时,登录按钮可点击
    self.loginBtn.enabled  = self.userNameTextF.text.length && self.pwdTextF.text.length;
}

- (IBAction)remSwitchClick:(UISwitch *)btn {
    
    if (self.rememberSwitch.on == NO) {
        [self.autoSwitch setOn:NO animated:YES];
    }
    
}
- (IBAction)autoSwitchClick:(UISwitch *)sender {
    
    if (self.autoSwitch.on) {
        [self.rememberSwitch setOn:YES animated:YES];
    }
    
}


- (IBAction)loginBtnClick:(UIButton *)sender
{
    
    // 使用第三方框架来模拟网络延迟
    [MBProgressHUD showMessage:@"朝阳正在帮你登录.." toView:self.view];
    // 延迟执行任务(dispatch-GCD方法)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 判断账号密码是否正确
        if ([self.userNameTextF.text isEqualToString:@"ZY"] && [self.pwdTextF.text isEqualToString:@"123"]) {
            
            // 跳转到联系人界面
            ZYContactVC *contactVC = [[ZYContactVC alloc] init];
            // 给contactVC的属性赋值
            contactVC.name = self.userNameTextF.text;
            [self.navigationController pushViewController:contactVC animated:YES];
            
            // 当登录成功后,隐藏网络延迟
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }else{
            
            [MBProgressHUD hideHUDForView:self.view];
            //如果密码错误,显示登录错误
            [MBProgressHUD showError:@"您输入的账号或密码有误!" toView:self.view];
        }
        
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
