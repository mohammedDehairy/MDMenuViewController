//
//  ServicesViewController.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 2/26/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "ServicesViewController.h"

@interface ServicesViewController ()

@end

@implementation ServicesViewController

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
    
    NSLog(@"%f",self.view.bounds.size.height);
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)push:(id)sender
{
    AboutViewController *anotherAbout = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    anotherAbout.title = [NSString stringWithFormat: @"About"];
    [self.menuController pushViewController:anotherAbout animated:YES];
}
-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"Services";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"icon_1320_white60.png";
}
@end
