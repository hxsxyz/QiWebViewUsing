//
//  UIWebViewJavaScriptCoreController.m
//  QiWebViewUsing
//
//  Created by QiShare on 2018/8/27.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "UIWebViewJavaScriptCoreController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface UIWebViewJavaScriptCoreController () <UIWebViewDelegate>

//! UIWebView-webView
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation UIWebViewJavaScriptCoreController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //! 登录按钮
    UIBarButtonItem *loginBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(login:)];
    self.navigationItem.rightBarButtonItems = @[loginBtnItem];
    
    //! UIWebView
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    if (@available(ios 11.0,*)) {
        _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"UIWebView-JavaScriptCore" withExtension:@"html"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [_webView loadRequest:request];
}


#pragma mark - Action functions

//! 登录方法
- (void)login:(id)sender {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        //! JSContext -evaluateScript:方式调用JS方法
        // [context evaluateScript:[NSString stringWithFormat:@"ocToJs('loginSucceed', 'oc_tokenString')"]];
        //! JSValue -callWithArguments:方式调用JS方法
        [context[@"ocToJs"] callWithArguments:@[@"loginSucceed", @"oc_tokenString"]];
    });
}

//! 使用context监听JS的方法
- (void)addActionsWithContext:(JSContext *)context {
    
    [context setExceptionHandler:^(JSContext *context, JSValue *exception) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"JS Exception: %@", exception.toString);
        });
    }];
    
    context[@"jsToOc"] = ^(NSString *action, NSString *params) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIWebViewJavaScriptCoreController showAlertWithTitle:action message:params cancelHandler:nil];
        });
    };
    /*
    context[@"loginSucceed"] = ^(NSString *token) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIWebViewJavaScriptCoreController showAlertWithTitle:@"loginScceed" message:token cancelHandler:nil];
        });
    };
     */
    /*
    context[@"login"] = ^() {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self login:nil];
        });
    };
     */
}


#pragma mark - UIWebViewDelegate

//! UIWebView在每次加载请求完成后会调用此方法
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.title = [context evaluateScript:@"document.title"].toString;
    
    [self addActionsWithContext:context];
}


#pragma mark - Util functions

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelHandler:(void(^)(void))handler {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (handler) {
            handler();
        }
    }];
    [alertController addAction:cancelAction];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - Dealloc

- (void)dealloc {
    
    NSLog(@"%s", __func__);
}

@end
