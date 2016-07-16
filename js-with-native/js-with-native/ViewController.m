//
//  ViewController.m
//  js-with-native
//
//  Created by 朱益达 on 16/7/17.
//  Copyright © 2016年 朱益达. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)NSString *text;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建webview
    UIWebView *web = [[UIWebView alloc] init];
    CGFloat webW = [UIScreen mainScreen].bounds.size.width;
    CGFloat webH = [UIScreen mainScreen].bounds.size.height-20;
    web.frame = CGRectMake(0, 20, webW, webH);
   //获取本地HTML文件路径
    NSString* path = [[NSBundle mainBundle] pathForResource:@"javascript" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [web loadRequest:request];
    [self.view addSubview:web];
    web.delegate = self;
    
    

}



//代理方法
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
//    _text = [webView stringByEvaluatingJavaScriptFromString:@"btns()"];

    NSString *url = request.URL.absoluteString;
//    
    if ([url hasPrefix:@"zhu://"]) {
        
    
    NSString *te =[url substringFromIndex:6];
    NSLog(@"%@",te);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题" message:te preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
