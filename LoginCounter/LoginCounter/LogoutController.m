//
//  LogoutController.m
//  LoginCounter
//
//  Created by Lion User on 19/02/2013.
//  Copyright (c) 2013 Edward. All rights reserved.
//

#import "LogoutController.h"

@interface LogoutController ()

@end

@implementation LogoutController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logout:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
