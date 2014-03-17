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
#define ZL_REQUIRED_SIG_EVENTS_KEY @"zl_required_sig_events_key"
#define ZL_CURRENT_SIG_EVENTS_KEY @"zl_current_sig_events_key"
#define ZL_DAYS_TO_REMIND_KEY @"zl_days_to_remind_key"
#define ZL_DATE_TO_REMIND_KEY @"zl_date_to_remind_key"

#define ZL_DEFAULT_DAYS_TO_REMIND 14

@interface ZLPromptUserReview : NSObject <UIAlertViewDelegate>

+ (ZLPromptUserReview *)sharedInstance;

/**
 REQUIRED! You must set the appID or it will not direct you to the app in the app store.
 */
- (void)setAppID:(NSString *)appID;

/**
 This sets the title of the prompt.
 */
- (void)setTitle:(NSString *)title;
/** 
 This sets the message of the prompt
 */
- (void)setMessage:(NSString *)message;
/**
 This sets the text on the Confirm button. The button that takes the user to the app on the App Store
 */
- (void)setConfirmButtonText:(NSString *)confirmButtonText;
/**
 This sets the text on the Cancel Button
 */
- (void)setCancelButtonText:(NSString *)cancelButtonText;
/**
 This sets the text on the Remind button
 */
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

/**
 This method will show the prompt afterthe "significantEventHappened" event has been called "numberOfEvents" times
 until the user clicks Rate Now or Remind Me Later.
 If you want to invalidate this then enter a number less than 1 for "numberOfEvents"
 */
- (void)setNumberOfSignificantEventsToRequestReview:(NSUInteger)numberOfEvents;

/**
 This method will bump up the value for current signficant events. If it puts the number of current significant events
 above what is required to show the prompt (as set in "setNumberOfSignificantEventsToRequestReview") it will show the prompt
 */
- (void)significantEventHappened;

/**
 This method will set the number of days the app should wait until asking the user to rate the app again AFTER he clicks
 "Remind Me Later" on the prompt. If this value is not set the default is 14
 */
- (void)setNumberOfDaysToWaitBeforeRemindingUser:(NSInteger)numberOfDays;

@end
