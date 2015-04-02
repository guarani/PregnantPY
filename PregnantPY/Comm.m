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

+ (void)command:(NSString *)command onSuccess:(void(^)(id))onSuccess spinner:(UIActivityIndicatorView *)spinner {
    
    
    NSString *url = [NSString stringWithFormat:@"http://54.207.46.168/pregnantpy/%@", command];

    spinner.hidesWhenStopped = YES;
    
  
    [spinner startAnimating];
    
    // how we stop refresh from freezing the main UI thread
    
    
    // do our long running process here
    //[NSThread sleepForTimeInterval:1];
    
    // do any UI stuff on the main UI thread
    
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                            [spinner stopAnimating];
                NSDictionary *resp = [data dc_dictionary];
                onSuccess(resp);
            }] resume];
    
}

@end
