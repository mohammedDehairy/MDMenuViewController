//
//  MDMenuChildViewController.m
//  MDMenuViewController Demo
//
//  Created by Mohammed Eldehairy on 3/13/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "MDMenuChildViewController.h"

@interface MDMenuChildViewController ()

@end

@implementation MDMenuChildViewController

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
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.view.frame = CGRectMake(0, 0, self.menuController.contentView.bounds.size.width, self.menuController.contentView.bounds.size.height);
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"";
}
@end
