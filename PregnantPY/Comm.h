//
//  Comm.h
//  PregnantPY
//
//  Created by Diego Correa on 12/03/15.
//  Copyright (c) 2015 Diego Correa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comm : NSObject

+ (void)command:(NSString *)command onSuccess:(void(^)(id))onSuccess;

@end
