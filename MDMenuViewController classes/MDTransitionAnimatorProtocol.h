//
//  MDTransitionAnimatorProtocol.h
//  Kitchens
//
//  Created by Mohammed Eldehairy on 3/20/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    MDAnimationTypeSlideFromRight,
    MDAnimationTypeSlideFromLeft,
    MDAnimationTypeNone
}MDAnimationType;
@protocol MDTransitionAnimatorProtocol <NSObject>
-(void)transitionInView:(UIView*)containerView fromView:(UIView*)fromView toView:(UIView*)toView;
@end
