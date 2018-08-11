//
//  ViewController.m
//  QiWebViewUsing
//
//  Created by Xs·H on 2018/8/11.
//  Copyright © 2018年 Xs·H. All rights reserved.
//

#import "ViewController.h"
#import "UIWebViewController.h"
#import "WKWebViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"QiWebViewUsing";
    
    UIButton *skipToUIWebViewButton = [UIButton buttonWithType:UIButtonTypeSystem];
    skipToUIWebViewButton.frame = CGRectMake(30.0, 300.0, self.view.bounds.size.width - 30.0 * 2, 50.0);
    [skipToUIWebViewButton setTitle:@"skipToUIWebViewController" forState:UIControlStateNormal];
    [skipToUIWebViewButton addTarget:self action:@selector(skipToUIWebView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:skipToUIWebViewButton];
    
    UIButton *skipToWKWebViewButton = [UIButton buttonWithType:UIButtonTypeSystem];
    skipToWKWebViewButton.frame = CGRectMake(30.0, 400.0, self.view.bounds.size.width - 30.0 * 2, 50.0);
    [skipToWKWebViewButton setTitle:@"skipToWKWebViewController" forState:UIControlStateNormal];
    [skipToWKWebViewButton addTarget:self action:@selector(skipToWKWebView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:skipToWKWebViewButton];
}

- (void)skipToUIWebView:(id)sender {
    
    UIWebViewController *webViewController = [UIWebViewController new];
    [self.navigationController pushViewController:webViewController animated:YES];
}

- (void)skipToWKWebView:(id)sender {
    
    WKWebViewController *webViewController = [WKWebViewController new];
    [self.navigationController pushViewController:webViewController animated:YES];
}

@end
