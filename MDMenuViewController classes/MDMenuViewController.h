//
//  MDMenuViewController.h
//  Kitchens
//
//  Created by Mohammed Eldehairy on 2/26/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefaultMenuView.h"
#import "MDTransitionAnimatorFactory.h"
#import "TopBarView.h"
#import "MJPopupBackgroundView.h"
#import "MDStack.h"

#define NSLocalizedString(key, comment) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]
typedef enum
{
    MDMenuViewControllerAnimationTypeFromBottom,
    MDMenuViewControllerAnimationTypeFromLeft,
    MDMenuViewControllerAnimationTypeFromRight
}MDMenuViewControllerAnimationType;
@protocol MDMenuViewControllerDelegate;
@interface MDMenuViewController : UIViewController<MenuViewDelegate,TopBarViewDelegate,UIGestureRecognizerDelegate>
{
    NSInteger currentControllerIndex;
    UITapGestureRecognizer *menuCloseTapGesture;
    UIView *allContentView;
    BOOL animatingMenu;
    BOOL menuShown;
    NSMutableArray *childViewControllersStacks;
    UIViewController *currentVisibleController;
    MJPopupBackgroundView *gradientBackground;
    
    int topBarHeight;
    UIButton *backBtn;
    
    NSArray *sideMenuItems;
    
}
@property(nonatomic)BOOL contentViewSwiptToTheSideEnabled;
@property(nonatomic,retain)MenuView *menuView;
@property(nonatomic,readonly)UIView *contentView;
@property(nonatomic,readonly)TopBarView *topBar;

-(void)setTopBarTitle:(NSString*)title;
- (id)initWithChildViewControllers:(NSArray*)viewControllers;
-(void)pushViewController:(UIViewController*)childController animated:(BOOL)animated;
-(void)pushViewController:(UIViewController*)childController withTransitionAnimator:(id<MDTransitionAnimatorProtocol>)animator;
-(void)popViewControllerAnimated:(BOOL)animated;
-(void)popViewControllerWithTransitionAnimator:(id<MDTransitionAnimatorProtocol>)animator;
-(void)showViewController:(UIViewController*)childController withTransitionAnimator:(id<MDTransitionAnimatorProtocol>)animator;
@end
@protocol MDMenuViewControllerDelegate <NSObject>

@property(nonatomic,weak)MDMenuViewController *menuController;

-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController*)menuController;

-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController*)menuController;
@optional



-(UIButton*)RightBarButtonForChildControllerMDMenuViewController:(MDMenuViewController*)menuController;

-(void)topbarViewDidTapBackButton;

@end