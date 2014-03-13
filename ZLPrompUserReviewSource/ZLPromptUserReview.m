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

#pragma mark Initialization

static ZLPromptUserReview *sharedInstance;

+ (ZLPromptUserReview *)sharedInstance
{
    if (!sharedInstance) {
        sharedInstance = [[ZLPromptUserReview alloc] init];
    }
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self didBecomeActive];
    }
    return self;
}

#pragma mark Getters

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

#pragma mark Setting prompt paramenters

- (void)setNumberOfApplicationLaunchesToRequestReview:(NSUInteger)numberOfAppLaunches
{
    NSInteger numberOfRequiredAppLaunches = [self numberOfRequiredAppLaunches];
    
    if (numberOfRequiredAppLaunches != numberOfAppLaunches) {
        [[NSUserDefaults standardUserDefaults] setInteger:numberOfAppLaunches forKey:ZL_REQUIRED_APP_LAUNCHES_KEY];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:ZL_CURRENT_APP_LAUNCHES_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)bumpUpNumberOfApplicationLauches
{
    NSInteger numberOfAppLauches = [self numberOfApplicationLauches];
    numberOfAppLauches++;
    
    [[NSUserDefaults standardUserDefaults] setInteger:numberOfAppLauches forKey:ZL_CURRENT_APP_LAUNCHES_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark Getting Prompt Parameters

- (NSInteger)numberOfRequiredAppLaunches
{
    NSInteger number = [[NSUserDefaults standardUserDefaults] integerForKey:ZL_REQUIRED_APP_LAUNCHES_KEY];
    return number;
}

- (NSInteger)numberOfApplicationLauches
{
    NSInteger number = [[NSUserDefaults standardUserDefaults] integerForKey:ZL_CURRENT_APP_LAUNCHES_KEY];
    return number;
}

#pragma mark Helpers

- (void)openAppInAppStore
{
    
#if TARGET_IPHONE_SIMULATOR
    NSLog(@"iTunes App Store is not supported on the iOS simulator. Unable to open App Store page.");
#else
    NSString *launchUrl = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", self.appID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:launchUrl]];
#endif
    
}

#pragma mark Notification Handlers

- (void)didBecomeActive
{
    NSInteger numRequiredLaunches = [self numberOfRequiredAppLaunches];
    if (numRequiredLaunches > 0) {
        [self bumpUpNumberOfApplicationLauches];
        
        if ([self numberOfApplicationLauches] >= numRequiredLaunches) {
            [self performSelector:@selector(showPrompt) withObject:nil afterDelay:5.0];
        }
    }
}

@end
