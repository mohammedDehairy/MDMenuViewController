//
//  TopBarView.h
//  Kitchens
//
//  Created by Mohammed Eldehairy on 2/26/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TopBarViewDelegate;
@interface TopBarView : UIView
{
    
}
@property(nonatomic,retain,readonly)UIButton *menuBtn;
@property(nonatomic,retain,readonly)UILabel *titleLbl;
@property(nonatomic,retain,readonly)UIButton *backBtn;
@property(nonatomic,retain,readonly)UIImageView *backgroundImage;

@property(nonatomic,weak)id<TopBarViewDelegate> delegate;
-(void)setTitle:(NSString*)title;
-(void)addRightTopBarButton:(UIButton*)leftBtn;
-(void)setBackButtonHidden:(BOOL)hidden;
-(void)removeLeftTopBarButton;
-(void)setMenuButtonIcon:(UIImage*)icon forState:(UIControlState)state;
@end
@protocol TopBarViewDelegate <NSObject>

-(void)TopBarViewDidTapMainMenuBtn:(TopBarView*)topBar;
-(void)topbarViewDidTapBackButton:(TopBarView*)topBar;
@end