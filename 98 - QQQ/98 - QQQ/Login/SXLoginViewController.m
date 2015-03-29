//
//  SXLoginViewController.m
//  98 - QQQ
//
//  Created by 董 尚先 on 15/2/21.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXLoginViewController.h"
#import "SXXMPPTools.h"

@interface SXLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *hostNameText;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation SXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景图片
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg.jpg"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
}

// 文本变化
// 提示：如果选择clear when editing，点击文本框不会触发本方法
- (IBAction)textChanged {
    // 确保三个文本都输入了内容
    self.loginButton.enabled = (self.nameText.text.length > 0
                                && self.passwordText.text.length > 0
                                && self.hostNameText.text.length > 0);
}

// 用户登录
- (IBAction)login {
    // 保存至用户偏好
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.nameText.text forKey:SXLoginUserNameKey];
    [defaults setObject:self.passwordText.text forKey:SXLoginPasswordKey];
    [defaults setObject:self.hostNameText.text forKey:SXLoginHostnameKey];
    
    [defaults synchronize];
    
    // 连接服务器开始登录
    [[SXXMPPTools sharedXMPPTools] connectionWithFailed:^(NSString *errorMessage) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:errorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    }];
}

@end
