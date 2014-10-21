//
//  ContactUsViewController.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 2/26/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"Contact Us";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"phone-icon.png";
}
-(UIButton*)RightBarButtonForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    UIButton *_backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(5, 50, 40, 40);
    [_backBtn setTitle:@"Call" forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    return _backBtn;
}
-(void)rightBtnAction
{
    [[[UIAlertView alloc] initWithTitle:@"hello" message:@"this is custom right button action" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
}
@end
