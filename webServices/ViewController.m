//
//  ViewController.m
//  webServices
//
//  Created by BABA on 7/12/17.
//  Copyright © 2017 iOSDevs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    NSString *XMLURL = @"https://itunes.apple.com/us/rss/topaudiobooks/limit=10/xml";
    //NSString *JSONURL = @"http://rest-service.guides.spring.io/greeting";
    
    
    
    [[services sharedManager]getDataFromURL:XMLURL isJSON:NO completionHandler:^(NSDictionary *results) {
        
        NSLog(@"result in viewController %@",results);
        
    }];
    
}

@end
