//
//  ZLPromptUserReview.m
//  ZLPromptUserReview
//
//  Created by Zack Liston on 3/12/14.
//  Copyright (c) 2014 zackliston. All rights reserved.
//

#import "ZLPromptUserReview.h"

@interface ZLPromptUserReview ()

@property (nonatomic, strong) NSString *appID;

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *confirmButtonText;
@property (nonatomic, strong) NSString *remindButtonText;
@property (nonatomic, strong) NSString *cancelButtonText;

@end

@implementation ZLPromptUserReview

#pragma mark Synthesize
@synthesize appID = _appID;
@synthesize message = _message;
@synthesize title = _title;
@synthesize confirmButtonText = _confirmButtonText;
@synthesize remindButtonText = _remindButtonText;
@synthesize cancelButtonText = _cancelButtonText;

static ZLPromptUserReview *sharedInstance;

#pragma mark Getters

+ (ZLPromptUserReview *)sharedInstance
{
    if (!sharedInstance) {
        sharedInstance = [[ZLPromptUserReview alloc] init];
    }
    return sharedInstance;
}

- (NSString *)title
{
    if (!_title) {
        _title = @"Review us?";
    }
    return _title;
}

- (NSString *)message
{
    if (!_message) {
        _message = @"Do you have 90 seconds to spare? Do you enjoy using our app? Please help us make it better by rating us on the App Store.";
    }
    return _message;
}

- (NSString *)confirmButtonText
{
    if (!_confirmButtonText) {
        _confirmButtonText = @"Rate it!";
    }
    return _confirmButtonText;
}

- (NSString *)remindButtonText
{
    if (!_remindButtonText) {
        _remindButtonText = @"Remind me later";
    }
    return _remindButtonText;
}

- (NSString *)cancelButtonText
{
    if (!_cancelButtonText) {
        _cancelButtonText = @"Cancel";
    }
    return _cancelButtonText;
}

#pragma mark Prompt Stuff

- (void)showPrompt
{
    UIAlertView *prompt = [[UIAlertView alloc] initWithTitle:[self title] message:[self message] delegate:self cancelButtonTitle:[self cancelButtonText] otherButtonTitles:[self confirmButtonText], [self remindButtonText], nil];
    [prompt show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self openAppInAppStore];
    }
}

#pragma mark Helpers

- (void)openAppInAppStore
{
    NSString *launchUrl = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", self.appID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:launchUrl]];
}

@end
