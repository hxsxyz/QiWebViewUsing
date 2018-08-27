//
//  WKWebViewInterceptController.m
//  QiWebViewUsing
//
//  Created by huangxianshuai on 2018/8/27.
//  Copyright © 2018年 Xs·H. All rights reserved.
//

#import "WKWebViewInterceptController.h"

@interface WKWebViewInterceptController ()

@end

@implementation WKWebViewInterceptController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = NSStringFromClass(self.class);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
