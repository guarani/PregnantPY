//
//  DetailsController.h
//  PregnantPY
//
//  Created by Diego Correa on 14/03/15.
//  Copyright (c) 2015 Diego Correa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsController : UIViewController

@property (nonatomic, assign) double latitud;
@property (nonatomic, assign) double longitud;
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, assign) NSUInteger iden;

@end
