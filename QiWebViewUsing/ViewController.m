//
//  ViewController.m
//  QiWebViewUsing
//
//  Created by Xs·H on 2018/8/11.
//  Copyright © 2018年 Xs·H. All rights reserved.
//

#import "ViewController.h"

#import "UIWebViewInterceptController.h"

#import "UIWebViewJavaScriptCoreController.h"
#import "UIWebViewJSExportController.h"

#import "WKWebViewInterceptController.h"

#import "WKWebViewWKUIDelegateController.h"
#import "WKWebViewWKScriptMessageHandlerController.h"

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"QiShare";
    
    UIButton *interceptButton_UI = [UIButton buttonWithType:UIButtonTypeSystem];
    interceptButton_UI.frame = CGRectMake(30.0, 100.0, self.view.bounds.size.width - 30.0 * 2, 50.0);
    [interceptButton_UI setTitle:@"UIWebView-Intercept" forState:UIControlStateNormal];
    [interceptButton_UI addTarget:self action:@selector(skipToUIWebView_intercept:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:interceptButton_UI];
    
    UIButton *javaScriptCoreButton_UI = [UIButton buttonWithType:UIButtonTypeSystem];
    javaScriptCoreButton_UI.frame = CGRectMake(30.0, 200.0, self.view.bounds.size.width - 30.0 * 2, 50.0);
    [javaScriptCoreButton_UI setTitle:@"UIWebView-JavaScriptCore" forState:UIControlStateNormal];
    [javaScriptCoreButton_UI addTarget:self action:@selector(skipToUIWebView_javaScriptCore:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:javaScriptCoreButton_UI];
    
    UIButton *jsExportButton_UI = [UIButton buttonWithType:UIButtonTypeSystem];
    jsExportButton_UI.frame = CGRectMake(30.0, 250.0, self.view.bounds.size.width - 30.0 * 2, 50.0);
    [jsExportButton_UI setTitle:@"UIWebView-JSExport" forState:UIControlStateNormal];
    [jsExportButton_UI addTarget:self action:@selector(skipToUIWebView_jsExport:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jsExportButton_UI];
    
    UIButton *interceptButton_WK = [UIButton buttonWithType:UIButtonTypeSystem];
    interceptButton_WK.frame = CGRectMake(30.0, 350.0, self.view.bounds.size.width - 30.0 * 2, 50.0);
    [interceptButton_WK setTitle:@"WKWebView-Intercept" forState:UIControlStateNormal];
    [interceptButton_WK addTarget:self action:@selector(skipToWKWebView_intercept:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:interceptButton_WK];
    
    UIButton *wkUIDelegateButton_WK = [UIButton buttonWithType:UIButtonTypeSystem];
    wkUIDelegateButton_WK.frame = CGRectMake(30.0, 450.0, self.view.bounds.size.width - 30.0 * 2, 50.0);
    [wkUIDelegateButton_WK setTitle:@"WKWebView-WKUIDelegate" forState:UIControlStateNormal];
    [wkUIDelegateButton_WK addTarget:self action:@selector(skipToWKWebView_wkUIDelegate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wkUIDelegateButton_WK];
    
    UIButton *messageHandlerButton_WK = [UIButton buttonWithType:UIButtonTypeSystem];
    messageHandlerButton_WK.frame = CGRectMake(30.0, 500.0, self.view.bounds.size.width - 30.0 * 2, 50.0);
    [messageHandlerButton_WK setTitle:@"WKWebView-WKScriptMessageHandler" forState:UIControlStateNormal];
    [messageHandlerButton_WK addTarget:self action:@selector(skipToWKWebView_wkScriptMessageHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:messageHandlerButton_WK];
}

- (void)skipToUIWebView_intercept:(id)sender {
    
    UIWebViewInterceptController *viewController = [UIWebViewInterceptController new];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)skipToUIWebView_javaScriptCore:(id)sender {
    
    UIWebViewJavaScriptCoreController *viewController = [UIWebViewJavaScriptCoreController new];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)skipToUIWebView_jsExport:(id)sender {
    
    UIWebViewJSExportController *viewController = [UIWebViewJSExportController new];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)skipToWKWebView_intercept:(id)sender {
    
    WKWebViewInterceptController *viewController = [WKWebViewInterceptController new];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)skipToWKWebView_wkUIDelegate:(id)sender {
    
    WKWebViewWKUIDelegateController *viewController = [WKWebViewWKUIDelegateController new];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)skipToWKWebView_wkScriptMessageHandler:(id)sender {
    
    WKWebViewWKScriptMessageHandlerController *viewController = [WKWebViewWKScriptMessageHandlerController new];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
