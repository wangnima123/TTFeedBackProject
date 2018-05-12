//
//  ViewController.m
//  TTFeedBackDemo
//
//  Created by wangze on 2018/5/12.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "ViewController.h"
#import "TTFeedbackViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self buildUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark buildUI
- (void)buildUI{
    
    UILabel *leftLabel = [[UILabel alloc] init];
    [self.view addSubview:leftLabel];
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).with.mas_offset(10.0f);
        make.top.mas_equalTo(self.view).with.mas_offset(60.0f);
    }];
    leftLabel.text = @"欢迎使用探探, 在使用过程中有疑问请";
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftLabel.mas_right).with.mas_offset(10.0f);
        make.right.mas_equalTo(self.view).with.mas_offset(-10.0f);
        make.centerY.mas_equalTo(leftLabel);
    }];
    [rightBtn setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    // underline Terms and condidtions
    NSMutableAttributedString *underlineStr = [[NSMutableAttributedString alloc] initWithString:@"反馈"];
    [underlineStr addAttribute:NSUnderlineStyleAttributeName
                         value:@(NSUnderlineStyleSingle)
                         range:NSMakeRange(0, underlineStr.length)];
    [rightBtn setAttributedTitle:underlineStr forState:UIControlStateNormal];
    
    [rightBtn addTarget:self action:@selector(didPressedRightBtn) forControlEvents:UIControlEventTouchUpInside];
    
    //抗拉伸
    [leftLabel setContentHuggingPriority:UILayoutPriorityRequired
                                 forAxis:UILayoutConstraintAxisHorizontal];
    [rightBtn setContentHuggingPriority:UILayoutPriorityDefaultLow
                                forAxis:UILayoutConstraintAxisHorizontal];
    
    //抗压缩
    [leftLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                               forAxis:UILayoutConstraintAxisHorizontal];
    [rightBtn setContentCompressionResistancePriority:UILayoutPriorityRequired
                                              forAxis:UILayoutConstraintAxisHorizontal];
}

- (void)didPressedRightBtn{
    
    TTFeedbackViewController *feedbackVC = [[TTFeedbackViewController alloc] init];
    [self presentViewController:feedbackVC animated:YES completion:nil];
}

@end

