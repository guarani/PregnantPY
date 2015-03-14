//
//  Comm.m
//  PregnantPY
//
//  Created by Diego Correa on 12/03/15.
//  Copyright (c) 2015 Diego Correa. All rights reserved.
//

#import "Comm.h"
#import "NSData+Utils.h"

@implementation Comm

+ (void)command:(NSString *)command onSuccess:(void(^)(id))onSuccess {
    
    
    NSString *url = [NSString stringWithFormat:@"http://localhost/%@", command];


    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                NSDictionary *resp = [data dc_dictionary];
                onSuccess(resp);
            }] resume];
    
}

@end
