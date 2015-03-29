//
//  SXMainViewController.m
//  98 - QQQ
//
//  Created by 董 尚先 on 15/2/22.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXMainViewController.h"
#import "SXXMPPTools.h"

@interface SXMainViewController ()

@end

@implementation SXMainViewController
- (IBAction)back {
    [[SXXMPPTools sharedXMPPTools] logout];
    
    // 切换界面
    [[NSNotificationCenter defaultCenter] postNotificationName:SXLoginResultNotification object:@(NO)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
