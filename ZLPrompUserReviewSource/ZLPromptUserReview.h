//
//  ZLPromptUserReview.h
//  ZLPromptUserReview
//
//  Created by Zack Liston on 3/12/14.
//  Copyright (c) 2014 zackliston. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLPromptUserReview : NSObject <UIAlertViewDelegate>

+ (ZLPromptUserReview *)sharedInstance;

- (void)setAppID:(NSString *)appID;
- (void)setTitle:(NSString *)title;
- (void)setMessage:(NSString *)message;
- (void)setConfirmButtonText:(NSString *)confirmButtonText;
- (void)setCancelButtonText:(NSString *)cancelButtonText;
- (void)setRemindButtonText:(NSString *)remindButtonText;

- (void)showPrompt;

@end
