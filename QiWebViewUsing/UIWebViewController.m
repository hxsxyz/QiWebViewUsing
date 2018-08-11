//
//  UIWebViewController.m
//  QiWebViewUsing
//
//  Created by Xs·H on 2018/8/11.
//  Copyright © 2018年 Xs·H. All rights reserved.
//

#import "UIWebViewController.h"

@interface UIWebViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation UIWebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
