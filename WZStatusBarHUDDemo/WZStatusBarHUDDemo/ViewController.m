//
//  ViewController.m
//  WZStatusBarHUDDemo
//
//  Created by songbiwen on 16/6/22.
//  Copyright © 2016年 songbiwen. All rights reserved.
//

#import "ViewController.h"
#import "WZStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/** 成功 */
- (IBAction)sucess:(id)sender {
    //@"加载成功！"
    [WZStatusBarHUD showSuccessWithStatus:@"加载成功！"];
}


/** 失败 */
- (IBAction)fail:(id)sender {
    
    [WZStatusBarHUD showErrorWithStatus:@"加载失败！"];
}


/** 加载 */
- (IBAction)loading:(id)sender {
    [WZStatusBarHUD showLoadingWithstatus:@"正在加载..."];
}


/** 消失 */
- (IBAction)dismiss:(id)sender {
    [WZStatusBarHUD dismiss];
}

/** 自定义 */
- (IBAction)custom:(id)sender {
    
    [WZStatusBarHUD showStatus:@"你哈哈哈哈哈哈"];
}

@end
