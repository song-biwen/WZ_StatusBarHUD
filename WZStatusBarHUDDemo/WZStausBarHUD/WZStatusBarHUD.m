//
//  WZStatusBarHUD.m
//  WZStatusBarHUD
//
//  Created by songbiwen on 16/6/22.
//  Copyright © 2016年 songbiwen. All rights reserved.
//

#import "WZStatusBarHUD.h"


#define WZFont [UIFont systemFontOfSize:12]
#define WZImage(img) [UIImage imageNamed:img]
#define WZScreenWidth [UIScreen mainScreen].bounds.size.width

static const CGFloat WZWindowH = 20;
static const CGFloat WZTimeInterval = 0.25;
static const CGFloat WZTimerTimeInterval = 2.0;

@implementation WZStatusBarHUD

static UIWindow *window_;
static NSTimer  *timer_;

/** 显示window */
+ (void)setupWindow {
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.frame = CGRectMake(0, -WZWindowH, WZScreenWidth, WZWindowH);
    window_.backgroundColor = [UIColor orangeColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    [UIView animateWithDuration:WZTimeInterval animations:^{
        
        CGRect frame = window_.frame;
        frame.origin.y = 0;
        window_.frame = frame;
        
    }];
}

/** 只显示文字 */
+ (void)showStatus:(NSString*)status {
    [WZStatusBarHUD showImage:nil status:status];
}


/** 显示图片与文字 */
+ (void)showImage:(UIImage*)image status:(NSString*)status {
    
    //暂停定时器
    [timer_ invalidate];
    
    //显示window
    [self setupWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    
    [button setTitle:status forState:UIControlStateNormal];
    button.titleLabel.font = WZFont;
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.userInteractionEnabled = NO;
    
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:WZTimerTimeInterval target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
}


/** 成功状态 */
+ (void)showSuccessWithStatus:(NSString*)status {
    [WZStatusBarHUD showImage:WZImage(@"WZStausBarHUD.bundle/success") status:status];
}


/** 失败状态 */
+ (void)showErrorWithStatus:(NSString*)status {
    [WZStatusBarHUD showImage:WZImage(@"WZStausBarHUD.bundle/error") status:status];
}


/** 正在加载 */
+ (void)showLoadingWithstatus:(NSString*)status {
    //显示window
    [WZStatusBarHUD setupWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    [button setTitle:status forState:UIControlStateNormal];
    button.titleLabel.font = WZFont;
    button.userInteractionEnabled = NO;
    [button.titleLabel sizeToFit];
    
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGFloat centerX = (WZScreenWidth - button.titleLabel.frame.size.width) * 0.5 - 20;
    CGFloat centerY = WZWindowH * 0.5;
    activityIndicatorView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:activityIndicatorView];
    
    [activityIndicatorView startAnimating];
}


/** 消失 */
+ (void)dismiss {
    
    [UIView animateWithDuration:WZTimeInterval animations:^{
        
        CGRect frame = window_.frame;
        frame.origin.y = -WZWindowH;
        window_.frame = frame;
        
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
        
    }];
}


@end
