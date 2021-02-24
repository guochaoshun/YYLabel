//
//  ViewController.m
//  YYText竖向排版
//
//  Created by 郭朝顺 on 2021/2/8.
//

#import "ViewController.h"
#import <YYText/YYText.h>

@interface ViewController ()

@property (nonatomic, copy) NSString *content;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.content = @"支持文字31竖排👌版，可用于编辑和,.显示中日韩文本支持文字竖,.排版，可用于编辑和显示中日韩文本支持文字,..竖排版，可用于编辑和显示中日韩文本支持??文字竖排版，可用于编辑和显示中,.日韩文本支持文字竖排版，可用于编辑和显示中日韩文本";

    [self test];
    [self test2];
    [self test3];

}

// YYLabel
- (void)test {

    YYLabel *label = [[YYLabel alloc] initWithFrame:CGRectMake(0, 100, 400, 200)];
    label.numberOfLines = 0;
    UIFont *font = [UIFont systemFontOfSize:22];
    label.font = font;
    label.textColor = [UIColor blackColor];
    label.verticalForm = YES; // 文字竖向展示
    label.textVerticalAlignment = YYTextVerticalAlignmentTop; // 文字置顶显示
    label.exclusionPaths = @[[UIBezierPath bezierPathWithRect:CGRectZero]];
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];

    NSString *content = self.content;
    __block NSInteger target = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {

        NSLog(@"YY方法当前长度 %@",@(target));
        if (target>=content.length) {
            [timer invalidate];
        }

        NSRange range = NSMakeRange(0, target);
        label.text = [content substringWithRange:range];
        target ++;


    }];
}

// UILabel可以
- (void)test2 {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, 400, 200)];
    label.numberOfLines = 0;
    UIFont *font = [UIFont systemFontOfSize:20];
    label.font = font;
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];


    NSString *content = self.content;
    NSAttributedString *oldAtt = [[NSAttributedString alloc] initWithString:content attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:22]}];
    __block NSInteger target = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {

        NSLog(@"当前长度 %@",@(target));
        if (target>=content.length) {
            [timer invalidate];
        }
        NSRange range = NSMakeRange(0, target);
        NSMutableAttributedString * att = [[NSMutableAttributedString alloc] initWithAttributedString:oldAtt];
        [att addAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} range:range];
        label.attributedText = att;
        target ++;

    }];
}

- (void)test3 {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 700, 400, 200)];
    label.numberOfLines = 0;
    UIFont *font = [UIFont systemFontOfSize:20];
    label.font = font;
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];

    NSString *content = self.content;
    __block NSInteger target = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {

        NSLog(@"当前长度 %@",@(target));
        if (target>=content.length) {
            [timer invalidate];
            return;
        }
        NSRange range = NSMakeRange(0, target);
        label.text = [content substringWithRange:range];
        target ++;
    }];
}

/// iOS11新增方法, 可以设置刘海屏底部的横条隐藏
- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}

@end
