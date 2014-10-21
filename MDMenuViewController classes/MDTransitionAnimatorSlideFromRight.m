//
//  MDTransitionAnimatorSlideFromRight.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 3/20/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "MDTransitionAnimatorSlideFromRight.h"

@implementation MDTransitionAnimatorSlideFromRight
-(void)transitionInView:(UIView *)containerView fromView:(UIView *)fromView toView:(UIView *)toView
{
    int ToViewX = 0;
    
    CGRect toRect = toView.frame;
    toRect.origin.x = containerView.bounds.size.width;
    toView.frame = toRect;
    [containerView addSubview:toView];
    
    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^(void){
    
        CGRect toRect = toView.frame;
        toRect.origin.x = ToViewX;
        toView.frame = toRect;
        
        
        CGRect fromRect = fromView.frame;
        fromRect.origin.x = -containerView.bounds.size.width;
        fromView.frame = fromRect;
    
        
        
    
    } completion:^(BOOL finished){
    
        [fromView removeFromSuperview];
    
    
    }];
}
@end
