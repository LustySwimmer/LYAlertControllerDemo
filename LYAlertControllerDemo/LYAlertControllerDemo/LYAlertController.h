//
//  LYAlertController.h
//  LYAlertControllerDemo
//
//  Created by Lusty on 2018/7/6.
//  Copyright © 2018年 Lusty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYAlertController : UIAlertController

/* 标题最大显示行数 */
@property (nonatomic, assign) NSInteger maxTitleNumberOfLines;
/* 内容最大显示行数 */
@property (nonatomic, assign) NSInteger maxMessageNumberOfLines;
/* 标题对齐方式 */
@property (nonatomic, assign) NSTextAlignment titleTextAlignment;
/* 内容对齐方式 */
@property (nonatomic, assign) NSTextAlignment messageTextAlignment;

#pragma mark - 便捷调用方法

+ (instancetype)ly_alertControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                               confirmTitle:(NSString *)confirmTitle
                                    handler:(void(^)(UIAlertAction *action))handler;

+ (instancetype)ly_alertControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                cancelTitle:(NSString *)cancelTitle
                               confirmTitle:(NSString *)confirmTitle
                                    handler:(void(^)(UIAlertAction *action))handler;

+ (instancetype)ly_alertControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                     titles:(NSArray <NSString *>*)titles
                                    handler:(void(^)(UIAlertAction *action))handler;

+ (instancetype)ly_alertControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                cancelTitle:(NSString *)cancelTitle
                                otherTitles:(NSArray <NSString *>*)otherTitles
                                    handler:(void (^)(UIAlertAction *))handler;

@end
