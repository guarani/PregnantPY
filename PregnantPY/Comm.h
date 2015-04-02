//
//  Comm.h
//  PregnantPY
//
//  Created by Diego Correa on 12/03/15.
//  Copyright (c) 2015 Diego Correa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Comm : NSObject

+ (void)command:(NSString *)command onSuccess:(void(^)(id))onSuccess spinner:(UIActivityIndicatorView *)spinner;

@end
