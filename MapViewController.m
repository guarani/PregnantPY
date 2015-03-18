//
//  MapViewController.m
//  PregnantPY
//
//  Created by Diego Correa on 17/03/15.
//  Copyright (c) 2015 Diego Correa. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController () <CLLocationManagerDelegate>

@end

@implementation MapViewController  {
    GMSMapView *mapView;
    CLLocationManager *locationManager;
    BOOL isFirst;
    CLLocation *crnCurrentLoc;
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There was an error retrieving your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [errorAlert show];
    NSLog(@"Error: %@",error.description);
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if (!isFirst) return;
    
    crnCurrentLoc = [locations lastObject];
//    
//    // Create a GMSCameraPosition that tells the map to display the
//    // coordinate -33.86,151.20 at zoom level 6.
//    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:crnCurrentLoc.coordinate.latitude
//                                                            longitude:crnCurrentLoc.coordinate.longitude
//                                                                 zoom:18];
//    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
//    mapView.myLocationEnabled = YES;
////    self.view = mapView_;
//    mapView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:mapView];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[mapView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(mapView)]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[mapView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(mapView)]];
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button addTarget:self action:@selector(getLocation:) forControlEvents:UIControlEventTouchUpInside];
//    button.translatesAutoresizingMaskIntoConstraints = NO;
//    [button setTitle:@"test" forState:UIControlStateNormal];
//    [mapView addSubview:button];
//    [mapView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(20)]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)]];
//    [mapView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(20)]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)]];
//
//    
//    // Creates a marker in the center of the map.
//    GMSMarker *marker = [[GMSMarker alloc] init];
//    marker.position = CLLocationCoordinate2DMake(crnCurrentLoc.coordinate.latitude, crnCurrentLoc.coordinate.longitude);
//    marker.title = @"Sydney";
//    marker.snippet = @"Australia";
//    
//    mapView.selectedMarker = marker;
//    
//    marker.map = mapView;

    
    isFirst = NO;
}

- (void)getLocation:(UIButton *)button
{
    
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:crnCurrentLoc.coordinate.latitude
                                                            longitude:crnCurrentLoc.coordinate.longitude
                                                                 zoom:18];
    
    
    
    [mapView setCamera:camera];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(crnCurrentLoc.coordinate.latitude, crnCurrentLoc.coordinate.longitude);
    marker.title = @"my location";
    marker.snippet = @"Australia";
    
    mapView.selectedMarker = marker;
    
    marker.map = mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isFirst = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    locationManager = [[CLLocationManager alloc]init]; // initializing locationManager
    //locationManager.distanceFilter = 100.0;
    [locationManager requestAlwaysAuthorization];
    locationManager.delegate = self; // we set the delegate of locationManager to self.
    locationManager.desiredAccuracy = kCLLocationAccuracyBest; // setting the accuracy
    
    [locationManager startUpdatingLocation];  //requesting location updates
    
    
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:self.latitud
                                                            longitude:self.longitud
                                                                 zoom:18];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    //    self.view = mapView_;
    mapView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:mapView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[mapView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(mapView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[mapView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(mapView)]];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(getLocation:) forControlEvents:UIControlEventTouchUpInside];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:@"test" forState:UIControlStateNormal];
    [mapView addSubview:button];
    [mapView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(20)]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)]];
    [mapView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(20)]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)]];
    
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(self.latitud, self.longitud);
    marker.title = self.nombre;
    marker.snippet = @"Australia";
    
    mapView.selectedMarker = marker;
    
    marker.map = mapView;

    
}

@end
