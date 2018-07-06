//
//  ViewController.m
//  LYAlertControllerDemo
//
//  Created by Lusty on 2018/7/2.
//  Copyright © 2018年 Lusty. All rights reserved.
//

#import "ViewController.h"
#import "LYAlertController.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *ly_title;
@property (nonatomic, copy) NSString *message;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ly_title = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    self.message = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
}

- (IBAction)normalAlert:(id)sender {
    
    LYAlertController *alertController = [LYAlertController ly_alertControllerWithTitle:self.ly_title message:self.message cancelTitle:@"取消" confirmTitle:@"确认" handler:^(UIAlertAction *action) {
        NSLog(@"%@",action.title);
    }];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)strictNumberOfLines:(id)sender {
    LYAlertController *alertController = [LYAlertController ly_alertControllerWithTitle:self.ly_title message:self.message cancelTitle:@"取消" confirmTitle:@"确认" handler:^(UIAlertAction *action) {
        NSLog(@"%@",action.title);
    }];
    alertController.maxTitleNumberOfLines = 2;
    alertController.maxMessageNumberOfLines = 3;
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)strictTextAlignment:(id)sender {
    LYAlertController *alertController = [LYAlertController ly_alertControllerWithTitle:self.ly_title message:self.message cancelTitle:@"取消" confirmTitle:@"确认" handler:^(UIAlertAction *action) {
        NSLog(@"%@",action.title);
    }];
    alertController.maxTitleNumberOfLines = 2;
    alertController.maxMessageNumberOfLines = 3;
    alertController.titleTextAlignment = NSTextAlignmentLeft;
    alertController.messageTextAlignment = NSTextAlignmentLeft;
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
