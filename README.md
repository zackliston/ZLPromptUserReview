ZLPromptUserReview
==================

This project allows you (the iOS dev) to prompt users to review your app. It will prompt them based on time passed, how many times the user has opened the app, or how many significant events the user has completed. It is fully customizable. It also has a remind me later feature.

<h2>Getting started</h2>
<h3>CocoaPods</h3>
<a href='http://cocoapods.org/'>CocoaPods</a> is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like ZLPrompUserReview in your projects. See the <a href='http://guides.cocoapods.org/using/getting-started.html'>"Getting Started" guide</a> for more information.
<h4>PodFile</h4>
```
platform :ios, '6.1'
pod "ZLPrompUserReview", "->1.0.0"
```
<h3>Source Files</h3>
If you are not using cocoapods you can simply add the two source files into your project.<br>
```
ZLPromptUserReview.h
ZLPromptUserReview.m
```
<h2>How to implement</h2>
<h3>Required</h3>
In order to use ZLPrompUserReview there are two things you have to do.<br>
First of all, import ZLPromptUserReview in your App Delegate
```
#import "ZLPromptUserReview.h"
```
Secondly, you must call the sharedInstance method in the didFinishLauchingWithOptions method in your App Delegate, on top of this you must get your unique App ID from itunesConnect and set it in the ZLPromptUserReview.
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[ZLPromptUserReview sharedInstance] setAppID:YOUR_APP_ID];
    '
    '
}
```
This instaniates a static instance of this class. This needs to be done at app launch so that it can count how many times the app has been launched. Also, you must set the App ID so that the library knows where to direct the user if he/she decides to rate your app.
<h3>Optional</h3>
Currently, there are four ways that you can prompt the user to review your app. These include
<ul>
<li>Show prompt at any point in your code</li>
<li>Show prompt after a certain number of App Launches</li>
<li>Show prompt after a certain number of Significant Events</li>
<li>Show prompt after a certain number of days after the user clicks "Remind Me Later"</li>
</ul>
<h4>Show prompt at any point in your code</h4>
This is very self-explanatory. You can simply call:
```
[[ZLPromptUserReview sharedInstance] showPrompt];
```
<h4>Show prompt after a certain number of App Launches</h4>
By default, this option is off. If you want to turn it on simply call
```
[[ZLPromptUserReview sharedInstance] setNumberOfApplicationLaunchesToRequestReview:NUMBER_OF_LAUNCHES];
```
Where NUMBER_OF_LAUNCHES is how many times you want the user to open the app before prompting the user. You want to call this method in your App Delegate didFinishLaunchingWithOptions method.<br>Entering a number less than 1 will turn this feature off.
<h4>Show prompt after a certain number of Significant Events</h4>
This feature is off by default
Whenever the user does something of significance you can record it. After a certain number of these significant events the library will prompt the user to review the app. To start you must set the number of significant events that must occur before prompting the user to review your app. To do this call:
```
[[ZLPromptUserReview sharedInstance] setNumberOfSignificantEventsToRequestReview:NUMBER_OF_EVENTS];
```
Where NUMBER_OF_EVENTS is how many significant events you want the user to perform before prompting the review. If NUMBER_OF_EVENTS is less than 1 then this feature is turned off. 
<br>To register that a significant event has happened, call:
```
[[ZLPromptUserReview sharedInstance] significantEventHappened];
```
<h4>Show prompt after a certain number of days after the user clicks "Remind Me Later"</h4>
This feature is on by default
<br>After the user is show the prompt, if he clicks the "Remind Me Later" button then the library will suspend the significantEvent and Application Launches prompts. It will then set a timer and check it every time the app launches. Once the specified amount of time (the default is 14 days) has passed it will prompt the user again. Set the amount of time using: 
```
[[ZLPromptUserReview sharedInstance] setNumberOfDaysToWaitBeforeRemindingUser:NUMBER_OF_DAYS];
```
Where NUMBER_OF_DAYS is how many days after clikcing the "Remind Me Button" that the prompt should be shown again.

<h3>Customization</h3>
You can customize the text of the prompt user these methods:
```
[[ZLPromptUserReview sharedInstance] setTitle:TITLE];
```
```
[[ZLPromptUserReview sharedInstance] setMessage:MESSAGE];
```
```
[[ZLPromptUserReview sharedInstance] setConfirmButtonText:BUTTON_TEXT];
```
```
[[ZLPromptUserReview sharedInstance] setCancelButtonText:BUTTON_TEXT];
```
```
[[ZLPromptUserReview sharedInstance] setRemindButtonText:BUTTON_TEXT];
```
