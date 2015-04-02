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
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *callPhone1;
@property (weak, nonatomic) IBOutlet UIButton *callPhone2;
@property (weak, nonatomic) IBOutlet UIButton *viewMap;
@property (weak, nonatomic) IBOutlet UITextView *desc;
@property (weak, nonatomic) IBOutlet UILabel *telefono1;
@property (weak, nonatomic) IBOutlet UILabel *telefono2;
@property (weak, nonatomic) IBOutlet UILabel *direccion;
@property (weak, nonatomic) IBOutlet UITextView *descripcion;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation DetailsController

- (IBAction)openMap:(id)sender {
    MapViewController *mapVC = [[MapViewController alloc] init];
    mapVC.nombre = self.nombre;
    mapVC.latitud = self.latitud;
    mapVC.longitud = self.longitud;
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Atrás" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (IBAction)callPhone:(id)sender {
    UIAlertView *calert;
    NSString *phNo = self.telefono1.text ;
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        calert = [[UIAlertView alloc]initWithTitle:@"Alerta" message:@"La funcionalidad de llamadas no está disponible." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }

}


- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.descripcion.layer.cornerRadius = 10;
    self.descripcion.clipsToBounds = YES;
    
    self.callPhone1.layer.cornerRadius = 10;
    self.callPhone1.clipsToBounds = YES;
    
    self.callPhone2.layer.cornerRadius = 10;
    self.callPhone2.clipsToBounds = YES;
    
    self.viewMap.layer.cornerRadius = 10;
    self.viewMap.clipsToBounds = YES;

    NSString *comando = [NSString stringWithFormat:@"details/%lu", (unsigned long)self.iden];
    [Comm command:comando onSuccess:^(id onSuccess) {
        NSDictionary *response = (NSDictionary *)onSuccess;
        
        
        NSString *imageBase64 = response[@"data"][@"photo"];
        NSData *imageData = [[NSData alloc] initWithBase64EncodedString:imageBase64 options:0];
        UIImage *imageImage = [UIImage imageWithData:imageData];
        self.imageView.image = imageImage;

        self.imageView.layer.cornerRadius = 30;
        self.imageView.clipsToBounds = YES;
        
        self.telefono1.text = response[@"data"][@"phones"][0];
        self.telefono2.text = response[@"data"][@"phones"][1];
        
        dispatch_sync(dispatch_get_main_queue(), ^ {
            self.desc.text = response[@"data"][@"description"];
            self.desc.font = [UIFont systemFontOfSize:12];
        });
        
        self.direccion.text = response[@"data"][@"address"];
        
        self.latitud = (CGFloat) [response[@"data"][@"latitud"] floatValue];
        self.longitud = (CGFloat) [response[@"data"][@"longitud"] floatValue];
        
        self.title = response[@"data"][@"title"];
        self.nombre = self.title;
    } spinner:self.spinner];
}
@end
