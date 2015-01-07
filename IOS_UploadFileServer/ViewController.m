//
//  ViewController.m
//  IOS_UploadFileServer
//
//  Created by User on 15/1/4.
//  Copyright (c) 2015年 gejw. All rights reserved.
//

#import "ViewController.h"
#import "HTTPServer.h"
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "ExHTTPConnection.h"

// Log levels: off, error, warn, info, verbose
static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface ViewController ()

@end

@implementation ViewController {
    HTTPServer *httpServer;
    UILabel *label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    label = [[UILabel alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [label setBackgroundColor:[UIColor whiteColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:label];
    
    [self startServer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startServer {
    
    // Configure our logging framework.
    // To keep things simple and fast, we're just going to log to the Xcode console.
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    // Initalize our http server
    httpServer = [[HTTPServer alloc] init];
    
    // Tell the server to broadcast its presence via Bonjour.
    // This allows browsers such as Safari to automatically discover our service.
    [httpServer setType:@"_http._tcp."];
    //    [httpServer ]
    
    // Normally there's no need to run our server on any specific port.
    // Technologies like Bonjour allow clients to dynamically discover the server's port at runtime.
    // However, for easy testing you may want force a certain port so you can just hit the refresh button.
    //	[httpServer setPort:12345];
    
    // Serve files from the standard Sites folder
    NSString *docRoot = [[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"Web"] stringByDeletingLastPathComponent];
    DDLogInfo(@"Setting document root: %@", docRoot);
    
    [httpServer setDocumentRoot:docRoot];
    
    [httpServer setConnectionClass:[ExHTTPConnection class]];
    
    NSError *error = nil;
    
    
    if(![httpServer start:&error port:^(NSString *ip, NSString *port) {
        label.text = [NSString stringWithFormat:@"http://%@:%@", ip, port];
    }])
    {
        DDLogError(@"Error starting HTTP Server: %@", error);
    }
}


@end
