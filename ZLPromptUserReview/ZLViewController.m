//
//  ZLViewController.m
//  ZLPromptUserReview
//
//  Created by Zack Liston on 3/12/14.
//  Copyright (c) 2014 zackliston. All rights reserved.
//

#import "ZLViewController.h"

#define APP_ID @"660518286"
@interface ZLViewController ()

@end

@implementation ZLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPrompt:(UIButton *)sender
{
    [[ZLPromptUserReview sharedInstance] setAppID:APP_ID];
    [[ZLPromptUserReview sharedInstance] showPrompt];
}

@end
