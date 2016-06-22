//
//  WZStatusBarHUD.h
//  WZStatusBarHUD
//
//  Created by songbiwen on 16/6/22.
//  Copyright © 2016年 songbiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZStatusBarHUD : NSObject

/** 只显示文字 */
+ (void)showStatus:(NSString*)status;


/** 显示图片与文字 */
+ (void)showImage:(UIImage*)image status:(NSString*)status;


/** 成功状态 */
+ (void)showSuccessWithStatus:(NSString*)status;


/** 失败状态 */
+ (void)showErrorWithStatus:(NSString*)status;


/** 正在加载 */
+ (void)showLoadingWithstatus:(NSString*)status;


/** 消失 */
+ (void)dismiss;



@end
