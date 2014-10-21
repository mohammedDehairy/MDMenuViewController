//
//  MDMenuChildViewController.h
//  MDMenuViewController Demo
//
//  Created by Mohammed Eldehairy on 3/13/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDMenuViewController.h"

@interface MDMenuChildViewController : UIViewController<MDMenuViewControllerDelegate>
@property(nonatomic,weak)MDMenuViewController *menuController;
@end
