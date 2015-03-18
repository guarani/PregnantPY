//
//  DetailsController.m
//  PregnantPY
//
//  Created by Diego Correa on 14/03/15.
//  Copyright (c) 2015 Diego Correa. All rights reserved.
//

#import "DetailsController.h"
#import "MapViewController.h"
#import "Comm.h"

@interface DetailsController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DetailsController
- (IBAction)openMap:(id)sender {
    MapViewController *mapVC = [[MapViewController alloc] init];
    mapVC.nombre = self.nombre;
    mapVC.latitud = self.latitud;
    mapVC.longitud = self.longitud;
    //[self performSegueWithIdentifier:@"DetailsSegueID" sender:self];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
}
@end
