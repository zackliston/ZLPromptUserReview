//
//  ZLPromptUserReview.h
//  ZLPromptUserReview
//
//  Created by Zack Liston on 3/12/14.
//  Copyright (c) 2014 zackliston. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZL_REQUIRED_APP_LAUNCHES_KEY @"zl_required_app_launches_key"
#define ZL_CURRENT_APP_LAUNCHES_KEY @"zl_current_app_launches_key"

@interface ZLPromptUserReview : NSObject <UIAlertViewDelegate>

+ (ZLPromptUserReview *)sharedInstance;

- (void)setAppID:(NSString *)appID;
- (void)setTitle:(NSString *)title;
- (void)setMessage:(NSString *)message;
- (void)setConfirmButtonText:(NSString *)confirmButtonText;
- (void)setCancelButtonText:(NSString *)cancelButtonText;
- (void)setRemindButtonText:(NSString *)remindButtonText;

/**
 This method will show the prompt to the user. It will ask him to rate the app and give him three options. Rate now, remind me later, or cancel.
 */
- (void)showPrompt;

/**
 This method will show the prompt after every 'numberOfLaunches' until the user clicks Rate Now, or Remind Me Later
 If you want to invalidate this then enter a number less than 1 for 'numberOfLaunches'
 */
- (void)setNumberOfApplicationLaunchesToRequestReview:(NSUInteger)numberOfAppLaunches;


@end
