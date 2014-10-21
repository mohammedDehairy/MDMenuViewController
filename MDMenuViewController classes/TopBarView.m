//
//  TopBarView.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 2/26/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "TopBarView.h"

@implementation TopBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _backgroundImage.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:_backgroundImage];
        
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(5, frame.size.height-45, 40, 40);
        [_backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backBtn];
        
        [self setBackButtonHidden:YES];
        
        
        int btnWidth = 55;
        int btnHeight = 45;
        
        _menuBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, frame.size.height-45, btnWidth, btnHeight)];
        
        
        [_menuBtn setImage:[UIImage imageNamed:@"side_menu.png"] forState:UIControlStateNormal];
        
        
        [_menuBtn addTarget:self action:@selector(MenuBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        _menuBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
        
        [self addSubview:_menuBtn];
        
        
        
        _titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        _titleLbl.backgroundColor = [UIColor clearColor];
        _titleLbl.textColor = [UIColor whiteColor];
        
        _titleLbl.textAlignment = NSTextAlignmentCenter;
        _titleLbl.center = self.center;
        CGRect titleLblRect = _titleLbl.frame;
        titleLblRect.origin.y = frame.size.height-50;
        _titleLbl.frame = titleLblRect;
        
        _titleLbl.font = [UIFont boldSystemFontOfSize:19];
        _titleLbl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:_titleLbl];
        
        
        
        
        
    }
    return self;
}

-(void)setMenuButtonIcon:(UIImage *)icon forState:(UIControlState)state
{
    [_menuBtn setImage:icon forState:state];
}
-(void)backAction
{
    if([_delegate respondsToSelector:@selector(topbarViewDidTapBackButton:)])
    {
        [_delegate topbarViewDidTapBackButton:self];
    }
}
-(void)setBackButtonHidden:(BOOL)hidden
{
    _backBtn.hidden = hidden;
    
    _menuBtn.hidden = !hidden;
}
-(void)addRightTopBarButton:(UIButton*)leftBtn
{
    
    
    CGRect leftBtnRect = leftBtn.frame;
    leftBtnRect.origin = CGPointMake(self.bounds.size.width-50, self.frame.size.height-45);
    leftBtn.frame = leftBtnRect;
    leftBtn.tag = 1001;
    leftBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [self addSubview:leftBtn];
}
-(void)removeLeftTopBarButton
{
    _backBtn.alpha = 1.0;
    UIButton *leftBtn = (UIButton*)[self viewWithTag:1001];
    [leftBtn removeFromSuperview];
}
-(void)MenuBtnTapped:(UIButton*)sender
{
    if([_delegate respondsToSelector:@selector(TopBarViewDidTapMainMenuBtn:)])
    {
        [_delegate TopBarViewDidTapMainMenuBtn:self];
    }
}
-(void)setTitle:(NSString *)title
{
    
    _titleLbl.text = title;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
