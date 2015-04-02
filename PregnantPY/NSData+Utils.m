//
//  NSData+Utils.m
//  PregnantPY
//
//  Created by Diego Correa on 12/03/15.
//  Copyright (c) 2015 Diego Correa. All rights reserved.
//

#import "NSData+Utils.h"

@implementation NSData (Utils)

- (NSDictionary *)dc_dictionary {
    NSError *e = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error: &e];
    
    if (!dictionary) {
        NSLog(@"Error parsing JSON: %@", e);
        return nil;
    } else {
        return dictionary;
    }
}

@end
