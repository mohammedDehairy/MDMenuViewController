//
//  MenuView.h
//  Kitchens
//
//  Created by Mohammed Eldehairy on 2/26/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItemEntity.h"
#import "MenuViewCellView.h"
#import "MDMenuViewProtocol.h"
@protocol MenuViewDelegate;

@interface MenuView : UIView<MDMenuViewProtocol>
{
    UIColor *menuItemTitleTextColorNormal;
    UIColor *menuItemTitleTextColorHighlighted;
    
    UIColor *menuItemBackgroundColorNormal;
    UIColor *menuItemBackgroundColorHighlighted;
    
    UIImage *menuItemBackgroundImageNormal;
    UIImage *menuItemBackgroundImageHighlighted;
}
@property(nonatomic)BOOL disableRippleAnimation;
@property(nonatomic,weak)id<MenuViewDelegate> delegate;



-(void)setMenuItemTitleTextColor:(UIColor*)txtColor forState:(UIControlState)controlState;

-(void)setMenuItemBackgroundColor:(UIColor*)backColor forState:(UIControlState)controlState;

-(void)setMenuItemBackgroundImage:(UIImage*)backImage forState:(UIControlState)controlState;
@end
