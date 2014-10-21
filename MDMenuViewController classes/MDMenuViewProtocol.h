//
//  MDMenuViewProtocol.h
//  MDMenuViewController Demo
//
//  Created by Mohammed Eldehairy on 5/4/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol MenuViewDelegate <NSObject>

-(void)MenuViewDidSelectMenuItem:(MenuItem)item atIndex:(NSInteger)index;

@end
@protocol MDMenuViewProtocol <NSObject>

- (id)initWithFrame:(CGRect)frame withMenuItems:(NSArray*)menuItems;

-(void)setMenuItems:(NSArray*)menuItems;

- (void)setSelectedMenuItem:(NSInteger)index;

- (void)showMenuInView:(UIView*)containerView withRecommendedAnimationDuration:(NSTimeInterval)duration;

- (void)hideMenuFromView:(UIView*)containerView withRecommendedAnimationDuration:(NSTimeInterval)duration;

@property(nonatomic,weak)id<MenuViewDelegate> delegate;

@end
