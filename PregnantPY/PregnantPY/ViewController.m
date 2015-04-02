//
//  ViewController.m
//  PregnantPY
//
//  Created by Diego Correa on 07/03/15.
//  Copyright (c) 2015 Diego Correa. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"
#import "Comm.h"
#import "DetailsController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (assign, nonatomic) NSUInteger iden;


@end

@implementation ViewController


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:@"Please wait\n\n\n"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(130.5, 65.5);
    spinner.color = [UIColor blackColor];
    [spinner startAnimating];
    [alert.view addSubview:spinner];
    [self presentViewController:alert animated:NO completion:nil];*/
    
    // replace right bar button 'refresh' with spinner
    /*UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(160, 240);
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];
    
    // how we stop refresh from freezing the main UI thread
    dispatch_queue_t downloadQueue = dispatch_queue_create("downloader", NULL);
    dispatch_async(downloadQueue, ^{
        
        // do our long running process here
        [NSThread sleepForTimeInterval:10];
        
        // do any UI stuff on the main UI thread
        dispatch_async(dispatch_get_main_queue(), ^{
            //self.myLabel.text = @"After!";
            NSLog(@"hohoh");
            [spinner stopAnimating];
        });
        
    });
    dispatch_release(downloadQueue);*/
    
    self.title = @"Lista de locales para ti";
    [Comm command:@"pregnant" onSuccess:^(id onSuccess) {
        NSDictionary *response = (NSDictionary *)onSuccess;

        
        NSUInteger total = [response[@"data"] count];
        UIButton *previousLeftButton;
        UIButton *previousRightButton;
        UILabel *previousLeftLabel;
        UILabel *previousRightLabel;
        
        for (int i = 0; i < total; i = i + 2) {
            
            UIButton *leftButton = [self createButton];
            UIButton *rightButton = [self createButton];
            leftButton.tag = [response[@"data"][i][@"id"] integerValue];
            rightButton.tag = [response[@"data"][i+1][@"id"] integerValue];
            leftButton.layer.cornerRadius = 30;
            leftButton.clipsToBounds = YES;
            rightButton.layer.cornerRadius = 30;
            rightButton.clipsToBounds = YES;
            
            UILabel *leftLabel = [UILabel new];
            [self.scrollView addSubview:leftLabel];
            leftLabel.translatesAutoresizingMaskIntoConstraints = NO;
            leftLabel.textAlignment = NSTextAlignmentCenter;
            leftLabel.text = response[@"data"][i][@"title"];
            leftLabel.font = [UIFont systemFontOfSize:12];
            
            UILabel *rightLabel = [UILabel new];
            [self.scrollView addSubview:rightLabel];
            rightLabel.translatesAutoresizingMaskIntoConstraints = NO;
            rightLabel.textAlignment = NSTextAlignmentCenter;
            rightLabel.text = response[@"data"][i+1][@"title"];
            rightLabel.font = [UIFont systemFontOfSize:12];
            
            NSString *leftBase64 = response[@"data"][i][@"photo"];
            NSData *leftData = [[NSData alloc] initWithBase64EncodedString:leftBase64 options:0];
            UIImage *leftImage = [UIImage imageWithData:leftData];
            [leftButton setBackgroundImage:leftImage forState:UIControlStateNormal];
            
            NSString *rightBase64 = response[@"data"][i + 1][@"photo"];
            NSData *rightData = [[NSData alloc] initWithBase64EncodedString:rightBase64 options:0];
            UIImage *rightImage = [UIImage imageWithData:rightData];
            [rightButton setBackgroundImage:rightImage forState:UIControlStateNormal];
            
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftButton
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:0.425
                                                                   constant:0]];
            
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightButton
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:0.425
                                                                   constant:0]];
            //UILabel widths
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftLabel
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:leftButton
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1
                                                                   constant:0]];
            
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightLabel
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:rightButton
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1
                                                                   constant:0]];
            //end UILabel widths
            
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftButton
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1
                                                                   constant:10]];
            
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightButton
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1
                                                                   constant:-10]];
            
            
            //UILabel horizontal
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftLabel
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1
                                                                   constant:10]];
            
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightLabel
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1
                                                                   constant:-10]];
            
            //end UILabel horizontal
            
            
            [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:leftButton
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:leftButton
                                                                        attribute:NSLayoutAttributeWidth
                                                                       multiplier:1
                                                                         constant:0]];
            
            [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:rightButton
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:rightButton
                                                                        attribute:NSLayoutAttributeWidth
                                                                       multiplier:1
                                                                         constant:0]];
            
            if (i == 0) {
                [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[leftButton]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(leftButton)]];
                [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[rightButton]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(rightButton)]];
            } else if (i < total - 2) {
                [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousLeftButton]-[previousLeftLabel]-[leftButton]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousLeftButton, previousLeftLabel, leftButton)]];
                [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousRightButton]-[previousRightLabel]-[rightButton]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousRightButton, previousRightLabel, rightButton)]];
            } else {
                leftButton.backgroundColor = rightButton.backgroundColor = [UIColor blueColor];
                [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousLeftButton]-[previousLeftLabel]-[leftButton]-[leftLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousLeftButton, previousLeftLabel, leftButton, leftLabel)]];
                [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousRightButton]-[previousRightLabel]-[rightButton]-[rightLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousRightButton, previousRightLabel, rightButton, rightLabel)]];
            }
            
            previousLeftButton = leftButton;
            previousRightButton = rightButton;
            previousLeftLabel = leftLabel;
            previousRightLabel = rightLabel;
        }
    }];
    

}

- (void)aMethod:(UIButton *)button
{
    self.iden = button.tag;
    
    [self performSegueWithIdentifier:@"DetailsSegueID" sender:self];
}

- (UIButton *)createButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:button];
    return button;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    DetailsController *dViewC = (DetailsController *) segue.destinationViewController;
    dViewC.iden = self.iden;
    
    
}


//if (i == 0) {
//    button.backgroundColor = [UIColor greenColor];
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:button
//                                                                attribute:NSLayoutAttributeTop
//                                                                relatedBy:NSLayoutRelationEqual
//                                                                   toItem:self.scrollView
//                                                                attribute:NSLayoutAttributeTop
//                                                               multiplier:1
//                                                                 constant:30]];
//} else if (i < total - 2) {
//    button.backgroundColor = [UIColor orangeColor];
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:button
//                                                                attribute:NSLayoutAttributeTop
//                                                                relatedBy:NSLayoutRelationEqual
//                                                                   toItem:previousButton
//                                                                attribute:NSLayoutAttributeBottom
//                                                               multiplier:1
//                                                                 constant:30]];
//} else {
//    button.backgroundColor = [UIColor blueColor];
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:button
//                                                                attribute:NSLayoutAttributeBottom
//                                                                relatedBy:NSLayoutRelationEqual
//                                                                   toItem:self.scrollView
//                                                                attribute:NSLayoutAttributeBottom
//                                                               multiplier:1
//                                                                 constant:30]];
//}

@end
