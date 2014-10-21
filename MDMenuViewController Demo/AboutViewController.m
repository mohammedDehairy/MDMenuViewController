//
//  AboutViewController.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 3/8/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)push:(id)sender
{
    AdvisoryViewController *anotherAbout = [[AdvisoryViewController alloc] initWithNibName:@"AdvisoryViewController" bundle:nil];
    anotherAbout.title = [NSString stringWithFormat: @"About"];
    [self.menuController pushViewController:anotherAbout withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
    
}
-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"About";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"concept-icon-poster60.png";
}
-(UIButton*)RightBarButtonForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    UIButton *_backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(5, 50, 40, 40);
    [_backBtn setTitle:@"Edit" forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    return _backBtn;
}
-(void)rightBtnAction
{
    [[[UIAlertView alloc] initWithTitle:@"hello" message:@"this is custom right button action" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
}
@end
