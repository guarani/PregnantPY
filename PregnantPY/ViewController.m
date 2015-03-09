//
//  ViewController.m
//  PregnantPY
//
//  Created by Diego Correa on 07/03/15.
//  Copyright (c) 2015 Diego Correa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int total = 3;
    
    UIButton *previousButton;
    for (int i = 0; i < total; i++) {
        
        // Do any additional setup after loading the view, typically from a nib.
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.backgroundColor = [UIColor purpleColor];
        [button addTarget:self
                   action:@selector(aMethod:)
         forControlEvents:UIControlEventTouchUpInside];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [button setTitle:@"Show View" forState:UIControlStateNormal];
        [self.scrollView addSubview:button];

        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                              attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeWidth
                                                             multiplier:0.8
                                                               constant:0]];
        
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:button
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1
                                                                     constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                              attribute:NSLayoutAttributeCenterX
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeCenterX
                                                             multiplier:1
                                                               constant:0]];
        if (i == 0) {
            button.backgroundColor = [UIColor redColor];
            [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[button]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)]];
        } else if (i > 0 && i < total - 1) {
            button.backgroundColor = [UIColor greenColor];
            [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousButton]-[button]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousButton, button)]];
        } else {
            button.backgroundColor = [UIColor blueColor];
            [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousButton]-[button]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousButton, button)]];
        }
        
        previousButton = button;
    }
}

- (void)aMethod:(UIButton *)button
{
    NSLog(@"Button  clicked.");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
