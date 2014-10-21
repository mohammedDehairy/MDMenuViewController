//
//  MDTransitionAnimatorNone.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 3/20/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "MDTransitionAnimatorNone.h"

@implementation MDTransitionAnimatorNone
-(void)transitionInView:(UIView *)containerView fromView:(UIView *)fromView toView:(UIView *)toView
{
    [fromView removeFromSuperview];
    [containerView addSubview:toView];
}
@end
