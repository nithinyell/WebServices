//
//  services.h
//  webServices
//
//  Created by BABA on 7/12/17.
//  Copyright © 2017 iOSDevs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLReader.h"

@interface services : NSObject

+(id)sharedManager;

-(void)getDataFromURL:(NSString *)URLString isJSON:(BOOL)URLType completionHandler:(void (^)(NSDictionary *results))completionHandler;

@end
