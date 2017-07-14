//
//  services.m
//  webServices
//
//  Created by BABA on 7/12/17.
//  Copyright © 2017 iOSDevs. All rights reserved.
//

#import "services.h"

@implementation services

+(id)sharedManager{

    static services *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
    
        sharedManager = [[self alloc]init];
        
    });

    return sharedManager;
}

-(void)getDataFromURL:(NSString *)URLString isJSON:(BOOL)URLType completionHandler:(void (^)(NSDictionary *))completionHandler{
    
    // Construct an URL
    NSURL *url = [NSURL URLWithString:URLString];
    
    // Construct a URLrequest
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // NSURLSession
    NSURLSession *session = [NSURLSession sharedSession];
    
    // NSURLSessionDataTask
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *  data, NSURLResponse *response, NSError * error) {
        
        // if no error
        if(!error){
            
            // if data
            if(data){
                
                NSDictionary *dict;
                
                if(URLType){
                    
                dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                    completionHandler(dict);
                }
                else{
                
                dict = [XMLReader dictionaryForXMLData:data error:&error];
                
                }
               
                completionHandler(dict);
                
            }
        
        }else{
            NSLog(@"** Error %@",error.localizedDescription);
        }
        
    }];

    [dataTask resume];
    
}

@end
