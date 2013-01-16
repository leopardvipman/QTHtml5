//
//  QTViewController.m
//  QTHtml5
//
//  Created by 杨 宏强 on 13-1-9.
//  Copyright (c) 2013年 yanghongqiang. All rights reserved.
//

#import "QTViewController.h"

@interface QTViewController ()

@end

@implementation QTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
    webView.delegate = self;
    webView.scalesPageToFit = YES;
    [self.view addSubview:webView];
    activityIndicatorView = [[UIActivityIndicatorView alloc]
                             initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] ;
    [activityIndicatorView setCenter: self.view.center];
    [activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleGray];
    [self.view addSubview : activityIndicatorView] ;
    
    NSURL *url =[NSURL URLWithString:@"http://leelong.qingter.com/jqmobie/demo2/index.php"];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    NSLog(@"-------%@",request);
    //[webView loadHTMLString:myHTML baseURL:[NSURL URLWithString:@"http://baidu.com"]];
    
    [webView loadRequest:request];
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicatorView startAnimating] ;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicatorView stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription]  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alterview show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
