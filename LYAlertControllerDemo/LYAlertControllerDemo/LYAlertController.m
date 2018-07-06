//
//  LYAlertController.m
//  LYAlertControllerDemo
//
//  Created by Lusty on 2018/7/6.
//  Copyright © 2018年 Lusty. All rights reserved.
//

#import "LYAlertController.h"

@interface UIView (LYViewHierarchy)

- (void)logViewHierarchy;
- (NSArray *)labelsForTitle:(NSString *)title message:(NSString *)message;

@end

@implementation UIView (LYViewHierarchy)

static NSMutableArray *_labelsArray;
static NSString *_title;
static NSString *_message;
static NSUInteger _totalCount;

- (void)logViewHierarchy {
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)subview;
            if ([label.text isEqualToString:_title]) {
                [_labelsArray addObject:label];
            } else if ([label.text isEqualToString:_message]) {
                [_labelsArray addObject:label];
            }
        }
        if (_labelsArray.count >= 2) { break; }
        [subview logViewHierarchy];
    }
}

- (NSArray *)labelsForTitle:(NSString *)title message:(NSString *)message {
    _totalCount = 0;
    _labelsArray = [NSMutableArray array];
    _title = title;
    _message = message;
    _totalCount = 0;
    if (_title != nil) {
        _totalCount += 1;
    }
    if (_message != nil) {
        _totalCount += 1;
    }
    [self logViewHierarchy];
    return _labelsArray;
}

@end

@interface LYAlertController ()

@property (nonatomic, strong) UILabel *ly_titleLabel;
@property (nonatomic, strong) UILabel *ly_messageLabel;

@end

@implementation LYAlertController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.titleTextAlignment = NSTextAlignmentCenter;
        self.messageTextAlignment = NSTextAlignmentCenter;
        self.maxTitleNumberOfLines = 0;
        self.maxMessageNumberOfLines = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextAttribute];
}

- (void)setupTextAttribute {
    //设置标题和内容最大显示行数和对齐方式
    NSArray *labelsArray = [self.view labelsForTitle:self.title message:self.message];
    UILabel *titleLabel = labelsArray.firstObject;
    UILabel *messageLabel = labelsArray.count >= 2 ? labelsArray[1] : nil;
    if ([titleLabel isKindOfClass:[UILabel class]]) {
        titleLabel.numberOfLines = self.maxTitleNumberOfLines;
        titleLabel.textAlignment = self.titleTextAlignment;
        self.ly_titleLabel = titleLabel;
    }
    if ([messageLabel isKindOfClass:[UILabel class]]) {
        messageLabel.numberOfLines = self.maxMessageNumberOfLines;
        messageLabel.textAlignment = self.messageTextAlignment;
        self.ly_messageLabel = messageLabel;
    }
}

+ (instancetype)ly_alertControllerWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle handler:(void (^)(UIAlertAction *))handler {
    return [LYAlertController ly_alertControllerWithTitle:title
                                                  message:message
                                              cancelTitle:nil
                                             confirmTitle:confirmTitle
                                                  handler:handler];
}

+ (instancetype)ly_alertControllerWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle confirmTitle:(NSString *)confirmTitle handler:(void (^)(UIAlertAction *))handler {
    NSArray *titles = confirmTitle != nil ? @[confirmTitle] : nil;
    return [LYAlertController ly_alertControllerWithTitle:title
                                                  message:message
                                              cancelTitle:cancelTitle
                                              otherTitles:titles
                                                  handler:handler];
}

+ (instancetype)ly_alertControllerWithTitle:(NSString *)title message:(NSString *)message titles:(NSArray<NSString *> *)titles handler:(void (^)(UIAlertAction *))handler {
    return [LYAlertController ly_alertControllerWithTitle:title
                                                  message:message
                                              cancelTitle:nil
                                              otherTitles:titles
                                                  handler:handler];
}

+ (instancetype)ly_alertControllerWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle otherTitles:(NSArray <NSString *>*)otherTitles handler:(void (^)(UIAlertAction *))handler {
    LYAlertController *alertController = [LYAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    NSMutableArray *actionTitles = otherTitles.mutableCopy;
    if (cancelTitle != nil) {
        [actionTitles addObject:cancelTitle];
    }
    UIAlertActionStyle actionStyle = UIAlertActionStyleDefault;
    for (NSString *actionTitle in actionTitles) {
        actionStyle = [actionTitle isEqualToString:cancelTitle] ? UIAlertActionStyleCancel: UIAlertActionStyleDefault;
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle
                                                         style:actionStyle
                                                       handler:handler];
        [alertController addAction:action];
    }
    return alertController;
}

@end
