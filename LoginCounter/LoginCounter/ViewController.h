//
//  ViewController.h
//  LoginCounter
//
//  Created by Lion User on 19/02/2013.
//  Copyright (c) 2013 Edward. All rights reserved.
//

#import <UIKit/UIKit.h>

static const int SUCCESS = 1;
static const int ERR_BAD_CREDENTIALS = -1;
static const int ERR_USER_EXISTS = -2;
static const int ERR_BAD_USERNAME = -3;
static const int ERR_BAD_PASSWORD = -4;

@interface ViewController : UIViewController <UITextFieldDelegate>
- (IBAction)login:(id)sender;
- (IBAction)add:(id)sender;

// output message
@property (retain, nonatomic) IBOutlet UITextView *message;

//@property (retain, nonatomic) IBOutlet UILabel *message;
// username textfield
@property (retain, nonatomic) IBOutlet UITextField *usernameField;
// password textfield
@property (retain, nonatomic) IBOutlet UITextField *passwordField;
// user attribute
@property (copy, nonatomic) NSString *user;
@property (copy, nonatomic) NSString *password;

// error code msg
@property (nonatomic, strong) NSDictionary *error;
@property (nonatomic, strong) NSNumber *errorCode;
@property (nonatomic, strong) NSNumber *count;
@end
