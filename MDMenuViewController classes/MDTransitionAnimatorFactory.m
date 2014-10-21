//
//  MDTransitionAnimatorFactory.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 3/20/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "MDTransitionAnimatorFactory.h"

@implementation MDTransitionAnimatorFactory
+(id<MDTransitionAnimatorProtocol>)transitionAnimatorWithType:(MDAnimationType)animationType
{
    switch (animationType) {
        case MDAnimationTypeNone:
            return [[MDTransitionAnimatorNone alloc] init];
        case MDAnimationTypeSlideFromRight:
            return [[MDTransitionAnimatorSlideFromRight alloc] init];
        case MDAnimationTypeSlideFromLeft:
            return [[MDTransitionAnimatorSlideFromLeft alloc] init];
        default:
            break;
    }
}
@end
