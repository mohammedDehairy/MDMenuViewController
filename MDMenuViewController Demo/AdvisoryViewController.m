//
//  AdvisoryViewController.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 3/8/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "AdvisoryViewController.h"

@interface AdvisoryViewController ()

@end

@implementation AdvisoryViewController

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
    self.view.backgroundColor = [UIColor greenColor];
    
}
-(void)topbarViewDidTapBackButton
{
    [self.menuController popViewControllerWithTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromLeft]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"Advisory";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"";
}
-(UIButton*)RightBarButtonForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    UIButton *_backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(5, 50, 40, 40);
    [_backBtn setTitle:@"FAQ" forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    return _backBtn;
}
-(void)rightBtnAction
{
    [[[UIAlertView alloc] initWithTitle:@"hello" message:@"this is custom right button action" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
}
@end
