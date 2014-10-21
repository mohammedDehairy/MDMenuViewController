//
//  MDMenuViewControllerDemoAppDelegate.m
//  MDMenuViewController Demo
//
//  Created by Mohammed Eldehairy on 3/8/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "MDMenuViewControllerDemoAppDelegate.h"
#import "ServicesViewController.h"
#import "ContactUsViewController.h"
#import "FavouritViewController.h"
#import "AdvisoryViewController.h"
#import "AboutViewController.h"
#import "MDMenuViewController.h"
@implementation MDMenuViewControllerDemoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //****************************** MDMenuViewController initialisation ******************************************
    
    
    
    
    NSArray *viewControllers = [NSArray arrayWithObjects:[[ServicesViewController alloc] initWithNibName:@"ServicesViewController" bundle:nil],[[FavouritViewController alloc] initWithNibName:@"FavouritViewController" bundle:nil],[[ContactUsViewController alloc] initWithNibName:@"ContactUsViewController" bundle:nil],[[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil], nil];
    
    MDMenuViewController *mainViewC = [[MDMenuViewController alloc] initWithChildViewControllers:viewControllers];
    
    
    
    //************************************************************************************************************
    
    
    
    
    
    
    
    
    
    
    //****************************** MDMenuViewController customise top bar ******************************************
    
    // set main menu button image
    [mainViewC.topBar.menuBtn setImage:[UIImage imageNamed:@"menu_icon (1).png"] forState:UIControlStateNormal];
    
    
    
    // set back button image
    [mainViewC.topBar.backBtn setImage:[UIImage imageNamed:@"icon_back_white.png"] forState:UIControlStateNormal];
    
    
    
    // set top bar background color
    [mainViewC.topBar setBackgroundColor:[UIColor colorWithWhite:0.85 alpha:1.0]];
    
    
    
    // set top bar title text color
    [mainViewC.topBar.titleLbl setTextColor:[UIColor whiteColor]];
    
    
    
    // set top bar background image
    mainViewC.topBar.backgroundImage.image = [UIImage imageNamed:@"topBar.jpg"];
    
    
    
    
    //************************************************************************************************************
    
    
    
    
    
    
    
    
    // MDMenuController background view image
    mainViewC.view.backgroundColor = [UIColor lightGrayColor];
    
    
    
    //if you want to disable or enable content view swipt to the side when menu is shown
    mainViewC.contentViewSwiptToTheSideEnabled = YES;
    
    
    
    
    
    
    
    
    //****************************** MDMenuViewController customise menu view ***************************************
    
    
    
    
    
    // menu item title text color when selected
    [mainViewC.menuView setMenuItemTitleTextColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    
    
    // menu item title text color when unSelected
    [mainViewC.menuView setMenuItemTitleTextColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    
    // menu item background color when unSelected
    [mainViewC.menuView setMenuItemBackgroundColor:[UIColor colorWithRed:(46.0f/255.0f) green:(46.0f/255.0f) blue:(46.0f/255.0f) alpha:1.0] forState:UIControlStateNormal];
    
    
    
    // menu item background color when selected
    [mainViewC.menuView setMenuItemBackgroundColor:[UIColor colorWithRed:(47.0f/255.0f) green:(123.0f/255.0f) blue:(154.0f/255.0f) alpha:1.0] forState:UIControlStateHighlighted];
    
    
    
    // menu vie background color
    [mainViewC.menuView setBackgroundColor:[UIColor colorWithRed:(46.0f/255.0f) green:(46.0f/255.0f) blue:(46.0f/255.0f) alpha:1.0]];
    
    
    
    
    //disabel ripple animation
    
    [mainViewC.menuView setDisableRippleAnimation:NO];
    
    
    //************************************************************************************************************
    
    
    
    
    
    
    
    
    
    
    self.window.rootViewController = mainViewC;
    

    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor colorWithRed:(135.0f/255.0f) green:(125.0f/255.0f) blue:(111.0f/255.0f) alpha:1.0];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
