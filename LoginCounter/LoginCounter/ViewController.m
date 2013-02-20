//
//  ViewController.m
//  LoginCounter
//
//  Created by Lion User on 19/02/2013.
//  Copyright (c) 2013 Edward. All rights reserved.
//

#import "ViewController.h"
#import "LogoutController.h"
@interface ViewController ()

@end

@implementation ViewController

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField{
    [theTextField resignFirstResponder];
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.error = [NSDictionary dictionaryWithObjectsAndKeys:
                     @"Invalid username and password combination. Please try again.", [NSNumber numberWithInt: ERR_BAD_CREDENTIALS],
                     @"This user name already exists. Please try again.",  [NSNumber numberWithInt:ERR_USER_EXISTS],
                     @"The user name should not be empty or over 128 characters long. Please try again.",  [NSNumber numberWithInt:ERR_BAD_USERNAME],
                     @"The password should not be over 128 characters long. Please try again.",[NSNumber numberWithInt:ERR_BAD_PASSWORD],
                     nil];
    self.passwordField.secureTextEntry = YES;}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    self.user = self.usernameField.text;
    self.password = self.passwordField.text;
    [self request:@"/users/login"];
}

- (IBAction)add:(id)sender {
    self.user = self.usernameField.text;
    self.password = self.passwordField.text;
    [self request:@"/users/add"];
}

//handle the error msg and jump if successful
- (void) errorMessage:(NSNumber*)error{
    if (error != [NSNumber numberWithInt:1]) {
        self.message.text = [self.error objectForKey:error];
    }
    else {
        LogoutController *jump = [self.storyboard instantiateViewControllerWithIdentifier:@"LogoutController"];
        [self presentViewController:jump animated:YES completion:nil];
        
        jump.logoutMessage.text = [NSString stringWithFormat:@"Welcome %@ !\n You have logged in %@ times.", self.user, self.count];
        self.message.text = @"Enter Your Credentials";    }
    // Reinitialize
    
    self.usernameField.text = @"";
    self.passwordField.text = @"";
    self.user = @"";
    self.password = @"";
}

//handle the actions
- (void) request:(NSString*) path{
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObjectsAndKeys:
                              self.user, @"user",
                              self.password, @"password",
                              nil];
    NSError *tempError;
    NSData *jsonRequest = [NSJSONSerialization dataWithJSONObject:jsonDict options:NSJSONWritingPrettyPrinted error:&tempError];
    NSString *fullPath = [NSString stringWithFormat:@"%@%@", @"http://fast-hollows-4122.herokuapp.com", path];
    NSURL *url = [NSURL URLWithString:fullPath];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:[NSString stringWithFormat:@"%d", [jsonRequest length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:jsonRequest];
    
    NSURLResponse *tempResponse =[[NSURLResponse alloc]init];
    NSData *jsonResponse = [NSURLConnection sendSynchronousRequest:request returningResponse:&tempResponse error:&tempError];
    
    NSDictionary *jsonDictionaryResponse = [NSJSONSerialization JSONObjectWithData:jsonResponse options:kNilOptions error:&tempError];
    
    self.errorCode = [jsonDictionaryResponse objectForKey:@"errCode"];
    
    self.count = [jsonDictionaryResponse objectForKey:@"count"];
    [self errorMessage:self.errorCode];
    
    
    
    
}
@end
