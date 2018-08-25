//
//  UIWebViewController.m
//  QiWebViewUsing
//
//  Created by Xs·H on 2018/8/11.
//  Copyright © 2018年 Xs·H. All rights reserved.
//

#import "UIWebViewController.h"

@interface UIWebViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation UIWebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = NSStringFromClass(self.class);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _webView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    if (@available(ios 11.0,*)) {
        _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"QiWebViewUsing" withExtension:@"html"];
    url = [NSURL URLWithString:@"https://i.360.cn/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [_webView loadRequest:request];
}


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    static NSString *loginSucceedString = @"qi_jsAction://loginSucceed";
    static NSString *loginBtnClickedString = @"qi_jsAction://loginBtnClicked";
    
    if ([request.URL.absoluteString containsString:loginSucceedString]) {
        NSString *message = [request.URL.absoluteString componentsSeparatedByString:@"?"].lastObject;
        [self.class showAlertWithTitle:loginSucceedString message:message completion:nil];
        return NO;
    }
    else if ([request.URL.absoluteString containsString:loginBtnClickedString]) {
        [self.class showAlertWithTitle:loginBtnClickedString message:nil completion:^{
            NSString *jsString = [NSString stringWithFormat:@"loginCallback('%@')", @"oc_tokenString"];
            [self.webView stringByEvaluatingJavaScriptFromString:jsString];
        }];
        return NO;
    }
    else if ([request.URL.absoluteString hasPrefix:@"https://i.360.cn/login/wap?show_index=1"]) {
        
    }
    
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}


#pragma mark - Util functions

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(void))completion {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (completion) {
            completion();
        }
    }];
    [alertController addAction:cancelAction];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}

@end
