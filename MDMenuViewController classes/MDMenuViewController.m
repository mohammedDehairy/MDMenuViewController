//
//  MDMenuViewController.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 2/26/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "MDMenuViewController.h"

@interface MDMenuViewController ()

@end


@implementation MDMenuViewController
static int TOP_BAR_HEIGHT = 50;
- (id)initWithChildViewControllers:(NSArray*)viewControllers
{
    self = [super init];
    if (self) {
        
        // initialize the array of child viewControllers stacks
        childViewControllersStacks = [NSMutableArray array];
        
        // initialize menu items array
        NSMutableArray *menuItems = [NSMutableArray array];
        
        
        for(UIViewController *childController in viewControllers)
        {
            
            // create a stack for each top level child controller and push each one as the top item
            MDStack *childstack = [[MDStack alloc] init];
            [childstack push:childController];
            [childViewControllersStacks addObject:childstack];
            
            
            
            
            // make sure each child controller conform to the protocol MDMenuViewControllerDelegate
            
            if(![childController conformsToProtocol:@protocol(MDMenuViewControllerDelegate)] )
            {
                [NSException raise:@"Invalid child view controller : child view controller must conform to protocol MDMenuViewControllerDelegate" format:@""];
            }
            
            
            
            // get the title of the child controller through its protocol method
            
            NSString *title = [((id<MDMenuViewControllerDelegate>)childController) titleForChildControllerMDMenuViewController:self];
            
            
            
            // get the icon of the child controller through its protocol method
            
            NSString *icon = [((id<MDMenuViewControllerDelegate>)childController) iconForChildControllerMDMenuViewController:self];
            
            
            
            // set self as the menuController of the child controller
            
            ((id<MDMenuViewControllerDelegate>)childController).menuController = self;
            
            
            
            
            // create menu item for the child controller to be shown in menu
            
            MenuItemEntity *menuItem = [[MenuItemEntity alloc] initWithTitle:title iconName:icon type:MenuItemMainView];
            [menuItems addObject:menuItem];
            
            
            
            
        }
        
        // initialise the menu view
        
        if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
        {
            _menuView = [[DefaultMenuView alloc] initWithFrame:CGRectMake(0, 0, 200, 350) withMenuItems:menuItems];
        }else
        {
            _menuView = [[DefaultMenuView alloc] initWithFrame:CGRectMake(0, 0, 400, 350) withMenuItems:menuItems];
        }
        _menuView.delegate = self;
        _menuView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin;
        gradientBackground = [[MJPopupBackgroundView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-50)];
        gradientBackground.backgroundColor = [UIColor clearColor];
        gradientBackground.alpha = 1.0f;
        gradientBackground.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
        
        
        animatingMenu = NO;
        
        self.contentViewSwiptToTheSideEnabled = YES;
        
        sideMenuItems = menuItems;
    }
    return self;
}
-(void)setMenuView:(MenuView *)menuView
{
    if(![menuView conformsToProtocol:@protocol(MDMenuViewProtocol)] || ![menuView isKindOfClass:[MenuView class]])
    {
        [NSException raise:@"Invalid Menu View : Menu view must be a subclass of base class MenuView And conforms to protocol MDMenuViewControllerDelegate" format:@""];
    }
    _menuView = menuView;
    
    [_menuView setMenuItems:sideMenuItems];
    
    _menuView.delegate = self;
    _menuView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    topBarHeight = 48;
    if(floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1 && [UIApplication sharedApplication].statusBarHidden == NO)
    {
        topBarHeight = 68;
    }
    
    menuShown = NO;
    
    menuCloseTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenuGesture)];
    
    
    // add allcontent view in which both content view controllers and top bar are added
    [self addAllContentView];
    
    
    // add the content view in which child view controllers are added
    [self addContentView];
    
    // add top bar
    [self addTopBarView];
    
    
    // show the top view controller in the first stack
    [self showViewController:[self topChildViewControllerAtIndex:0] withAnimationType:MDAnimationTypeNone];
    
    currentControllerIndex = 0;
    
    
}
-(void)addAllContentView
{
    allContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    allContentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin;
    
    
    [self.view addSubview:allContentView];
}
-(void)addContentView
{
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, topBarHeight, self.view.bounds.size.width, self.view.bounds.size.height-topBarHeight)];
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _contentView.backgroundColor = [UIColor colorWithRed:(135.0f/255.0f) green:(125.0f/255.0f) blue:(111.0f/255.0f) alpha:1.0];
    
    _contentView.clipsToBounds = YES;
    [allContentView addSubview:_contentView];
}
-(void)addTopBarView
{
    _topBar = [[TopBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, topBarHeight)];
    _topBar.delegate = self;
    _topBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [allContentView addSubview:_topBar];
}
-(int)topBarHeight
{
    if(floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1 )
    {
        return 70;
        
    }else
    {
        return TOP_BAR_HEIGHT;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)setTopBarTitle:(NSString *)title
{
    [_topBar setTitle:title];
}
/*-(void)setTopBarCustomView:(UIView *)topBarCustomView
{
    CGRect topBarRect = topBarCustomView.frame;
    topBarRect.size.height = topBarHeight;
    topBarRect.size.width = allContentView.bounds.size.width;
    topBarRect.origin = CGPointMake(0, 0);
    topBarCustomView.frame = topBarRect;
    
    if(!topBarCustomView)
    {
        [_topBarCustomView removeFromSuperview];
        [_topBar setHidden:NO];
        _topBarCustomView = topBarCustomView;
        return;
    }
    
    [_topBar setHidden:YES];
    [allContentView addSubview:topBarCustomView];
    _topBarCustomView = topBarCustomView;
    
}*/
-(UIViewController*)topChildViewControllerAtIndex:(NSInteger)index
{
    return [((MDStack*)[childViewControllersStacks objectAtIndex:index]) lastObject];
}
//************************************************ menu view delegate *****************************
//**************************************************************************************************
-(void)MenuViewDidSelectMenuItem:(MenuItem)item atIndex:(NSInteger)index
{
    
    [self hideMenu:_topBar];
    
    
    
    UIViewController *childController = [self topChildViewControllerAtIndex:index];
    
    currentControllerIndex = index;
    
    [self showViewController:childController withAnimationType:MDAnimationTypeNone];
    
    
    
}

//************************************************ show view controller *************************
//**************************************************************************************************
-(void)pushViewController:(UIViewController*)childController animated:(BOOL)animated
{
    if(![childController conformsToProtocol:@protocol(MDMenuViewControllerDelegate)] )
    {
        [NSException raise:@"Invalid child view controller : child view controller must conform to protocol MDMenuViewControllerDelegate" format:@""];
    }
    
    
    

    MDAnimationType animation = animated ? MDAnimationTypeSlideFromRight : MDAnimationTypeNone;
    
    [self pushViewController:childController withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:animation]];
    

}
-(void)pushViewController:(UIViewController *)childController withTransitionAnimator:(id<MDTransitionAnimatorProtocol>)animator
{
    if(![childController conformsToProtocol:@protocol(MDMenuViewControllerDelegate)] )
    {
        [NSException raise:@"Invalid child view controller : child view controller must conform to protocol MDMenuViewControllerDelegate" format:@""];
    }
    
    MDStack *stack = [childViewControllersStacks objectAtIndex:currentControllerIndex];
    
    [stack push:childController];
    ((id<MDMenuViewControllerDelegate>)childController).menuController = self;
    
    
    
    [self showViewController:childController withTransitionAnimator:animator];
}
-(void)addBackButton
{
    [self.topBar setBackButtonHidden:NO];
}
-(void)topbarViewDidTapBackButton:(TopBarView *)topBar
{
    if([currentVisibleController respondsToSelector:@selector(topbarViewDidTapBackButton)])
    {
        [((id<MDMenuViewControllerDelegate>)currentVisibleController) topbarViewDidTapBackButton];
        return;
    }
    
    [self popViewControllerAnimated:YES];
}
-(void)removeBackButton
{
    [self.topBar setBackButtonHidden:YES];
}
-(void)popViewControllerAnimated:(BOOL)animted
{
    MDAnimationType animation = animted ? MDAnimationTypeSlideFromLeft : MDAnimationTypeNone;
    [self popViewControllerWithTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:animation]];
    

}
-(void)popViewControllerWithTransitionAnimator:(id<MDTransitionAnimatorProtocol>)animator
{
    MDStack *stack = [childViewControllersStacks objectAtIndex:currentControllerIndex];
    
    if([stack count] < 2)
    {
        return;
    }
    [stack pop];
    UIViewController *preController = [self topChildViewControllerAtIndex:currentControllerIndex];
    
    [self showViewController:preController withTransitionAnimator:animator];
}
-(void)popToRootAnimated:(BOOL)animated
{
    MDAnimationType animation = animated ? MDAnimationTypeSlideFromLeft : MDAnimationTypeNone;
    [self popToRootWithTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:animation]];
}
-(void)popToRootWithTransitionAnimator:(id<MDTransitionAnimatorProtocol>)animator
{
    MDStack *stack = [childViewControllersStacks objectAtIndex:currentControllerIndex];
    while ([stack count] >= 2) {
        [stack pop];
    }
    UIViewController *preController = [self topChildViewControllerAtIndex:currentControllerIndex];
    
    [self showViewController:preController withTransitionAnimator:animator];
}
-(void)showViewController:(UIViewController*)childController withAnimationType:(MDAnimationType)animationType
{
    [self showViewController:childController withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:animationType]];
}
-(void)showViewController:(UIViewController*)childController withTransitionAnimator:(id<MDTransitionAnimatorProtocol>)animator
{
    
    if(![childController conformsToProtocol:@protocol(MDMenuViewControllerDelegate)] )
    {
        [NSException raise:@"Invalid child view controller : child view controller must conform to protocol MDMenuViewControllerDelegate" format:@""];
    }
    
    if(menuShown)
    {
        [self hideMenu:_topBar];
    }
    
    
    [_topBar setTitle:[((id<MDMenuViewControllerDelegate>)childController) titleForChildControllerMDMenuViewController:self]];
    
    
    // notify the new controller that it will be added to child viewControllers
    [childController willMoveToParentViewController:self];
    
    
    
    childController.view.frame = CGRectMake(0, 0, _contentView.bounds.size.width, _contentView.bounds.size.height);
    
    // add new Controller as a child to the container view controller (self)
    [self addChildViewController:childController];
    
    
    
    // notify old controller that it will be removed from child viewControllers
    [currentVisibleController willMoveToParentViewController:nil];
    
    
    // use MDTransitionAnimator object to animate transition
    [animator transitionInView:_contentView fromView:currentVisibleController.view toView:childController.view];
    
    //[_contentView addSubview:childController.view];
    
    
    // remove old controller from child viewControllers
    [currentVisibleController removeFromParentViewController];
    
    
    // notify the new controller that it was added to child viewControllers
    [childController didMoveToParentViewController:self];
    
    
    
    currentVisibleController = childController;
    
    
    
    // show the custom left button if the child controller implements the protocol method that returns the left button
    [self.topBar removeLeftTopBarButton];
    if([childController respondsToSelector:@selector(RightBarButtonForChildControllerMDMenuViewController:)])
    {
        [self.topBar addRightTopBarButton:[((id<MDMenuViewControllerDelegate>)childController) RightBarButtonForChildControllerMDMenuViewController:self]];
    }
    
    MDStack *stack = [childViewControllersStacks objectAtIndex:currentControllerIndex];
    
    if([stack count] <= 1)
    {
        [self removeBackButton];
    }else
    {
        [self addBackButton];
    }
}
-(MenuView*)getMenuView
{
    
    return _menuView;
}
//************************************************ Top bar delegate ************************
//**************************************************************************************************
-(void)TopBarViewDidTapMainMenuBtn:(TopBarView*)topBar
{
    
    
    
    if(menuShown)
    {
        
        [self hideMenu:topBar];
        
    }else
    {
        [self showMenu:topBar];
    }
    
    
}
-(void)closeMenuGesture
{
    [self hideMenu:_topBar];
}
//************************************************ show Menu **********************************
//**************************************************************************************************
-(void)showMenu:(TopBarView*)topBar
{
    
    if(animatingMenu)
    {
        return;
    }
    
    int menuOffset = 0;
    
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {
        menuOffset = 200;
        
    }else
    {
        menuOffset = 400;
    }
    
    
    animatingMenu = YES;
    
    [allContentView addGestureRecognizer:menuCloseTapGesture];
    menuCloseTapGesture.delegate = self;
    
    gradientBackground.alpha = 0.0;
    gradientBackground.frame = self.view.bounds;
    [_contentView addSubview:gradientBackground];
    
    menuShown = YES;
    
    MenuView *menu = [self getMenuView];
    
    //menu.frame = CGRectMake(self.view.bounds.size.width, 50, menuOffset, _contentView.bounds.size.height);
    
    
    //[self.view addSubview:menu];
    
    
    [menu showMenuInView:self.view withRecommendedAnimationDuration:0.2];
    
    [self.view bringSubviewToFront:topBar];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        if(_contentViewSwiptToTheSideEnabled)
        {
            CGAffineTransform scale = CGAffineTransformMakeScale(0.6, 0.6);
            CGAffineTransform translate = CGAffineTransformMakeTranslation((self.view.bounds.size.width/2), -20);
            allContentView.transform = CGAffineTransformConcat(scale, translate);
        }
        
        
        
        
        gradientBackground.alpha = 1.0;
        
        
        
    } completion:^(BOOL finished){
        
        [menu setSelectedMenuItem:currentControllerIndex];
        animatingMenu = NO;
        
    }];
}
//************************************************ hide Menu *********************************
//**************************************************************************************************
-(void)hideMenu:(TopBarView*)topBar
{
    
    if(animatingMenu)
    {
        return;
    }
    
    [allContentView removeGestureRecognizer:menuCloseTapGesture];
    
    animatingMenu = YES;
    
    menuShown = NO;
    
    [_menuView hideMenuFromView:self.view withRecommendedAnimationDuration:0.2];
    
   
    
    
    
    [UIView animateWithDuration:0.2 animations:^{
        
        gradientBackground.alpha = 0.0;
        
        if(_contentViewSwiptToTheSideEnabled)
        {
            allContentView.transform = CGAffineTransformIdentity;
            allContentView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        }
        
    } completion:^(BOOL finished){
        
        [gradientBackground removeFromSuperview];
        animatingMenu = NO;
        
        
    }];
        
    

    
    
}
-(BOOL)shouldAutomaticallyForwardAppearanceMethods
{
    return YES;
}
-(BOOL)shouldAutomaticallyForwardRotationMethods
{
    return YES;
}

@end

