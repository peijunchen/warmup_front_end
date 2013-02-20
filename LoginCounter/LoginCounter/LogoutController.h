//
//  LogoutController.h
//  LoginCounter
//
//  Created by Lion User on 19/02/2013.
//  Copyright (c) 2013 Edward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogoutController : UIViewController
- (IBAction)logout:(id)sender;
//@property (retain, nonatomic) IBOutlet UILabel *logoutMessage;
@property (retain, nonatomic) IBOutlet UITextView *logoutMessage;

@end
