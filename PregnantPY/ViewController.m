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
    
    int total = 10;
    
    UIButton *previousLeftButton;
    UIButton *previousRightButton;
    for (int i = 0; i < total; i++) {
        
        UIButton *leftButton = [self createButton:@"Left"];
        UIButton *rightButton = [self createButton:@"Right"];
        
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
        } else if (i < total - 1) {
            [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousLeftButton]-[leftButton]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousLeftButton, leftButton)]];
            [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousRightButton]-[rightButton]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousRightButton, rightButton)]];
        } else {
            leftButton.backgroundColor = rightButton.backgroundColor = [UIColor blueColor];
            [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousLeftButton]-[leftButton]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousLeftButton, leftButton)]];
            [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousRightButton]-[rightButton]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousRightButton, rightButton)]];
        }
        
        previousLeftButton = leftButton;
        previousRightButton = rightButton;
    }
   }

- (void)aMethod:(UIButton *)button
{
    NSLog(@"Button  clicked.");
}

- (UIButton *)createButton:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIImage *image = [UIImage imageNamed:@"cat.jpg"];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:title forState:UIControlStateNormal];
    [self.scrollView addSubview:button];
    return button;
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
