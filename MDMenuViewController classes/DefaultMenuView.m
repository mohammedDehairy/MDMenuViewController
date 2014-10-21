//
//  DefaultMenuView.m
//  MDMenuViewController Demo
//
//  Created by Mohammed Eldehairy on 5/4/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "DefaultMenuView.h"

@implementation DefaultMenuView
-(id)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame withMenuItems:[NSArray array]];
    return self;
}
- (id)initWithFrame:(CGRect)frame withMenuItems:(NSArray*)menuItems
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.8];
        
        tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, self.bounds.size.width, self.bounds.size.height-10) style:UITableViewStylePlain];
        [self addSubview:tableView];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.separatorColor = [UIColor clearColor];
        tableView.showsVerticalScrollIndicator = NO;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.bounces = YES;
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        firstLoad = YES;
        tableView.rowHeight = 40;
        
        MenuItems = [NSArray arrayWithArray:menuItems];
    }
    return self;
}
-(void)setMenuItems:(NSArray *)menuItems
{
    MenuItems = menuItems;
    [tableView reloadData];
    
}
-(void)showMenuInView:(UIView *)containerView withRecommendedAnimationDuration:(NSTimeInterval)duration
{
    int menuOffset = 0;
    
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {
        menuOffset = 200;
        
    }else
    {
        menuOffset = 400;
    }
    
    
    int y = 48;
    
    if(floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1 && [UIApplication sharedApplication].statusBarHidden == NO)
    {
        y = 68;
    }
    
    self.frame = CGRectMake(-self.frame.size.width, y, menuOffset, containerView.bounds.size.height-y);
    
    [containerView addSubview:self];
    
    [UIView animateWithDuration:duration animations:^{
        
        
        
        
        
        
        
        CGRect menuRect = self.frame;
         
        menuRect.origin.x = 0;
        
         self.frame = menuRect;
        
        
    } completion:^(BOOL finished){
        
        
        
    }];

}
-(void)hideMenuFromView:(UIView *)containerView withRecommendedAnimationDuration:(NSTimeInterval)duration
{
    [UIView animateWithDuration:duration animations:^{
        
        
        CGRect menuRect = self.frame;
        
        menuRect.origin.x = -self.bounds.size.width;
        
        self.frame = menuRect;
        
    } completion:^(BOOL finished){
        
        [self removeFromSuperview];
        
        
    }];
}
-(void)willMoveToSuperview:(UIView *)newSuperview
{
    if(newSuperview)
    {
        
    }
}
-(void)didMoveToSuperview
{
    if(!self.superview)
    {
        return;
    }
    if(!firstLoad)
    {
        [tableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.08];
    }else
    {
        firstLoad = NO;
    }
    
    
    
}

-(void)setSelectedMenuItem:(NSInteger)index
{
    [tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return MenuItems.count;
}
-(void)tableView:(UITableView *)tableView1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MenuItemEntity *entity = [MenuItems objectAtIndex:indexPath.row];
    if([self.delegate respondsToSelector:@selector(MenuViewDidSelectMenuItem:atIndex:)])
    {
        [self.delegate MenuViewDidSelectMenuItem:entity.itemType atIndex:indexPath.row];
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"MenuItem";
    MenuViewCellView *cell = [tableView1 dequeueReusableCellWithIdentifier:cellID];
    if(!cell)
    {
        cell = [[MenuViewCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    MenuItemEntity *entity = [MenuItems objectAtIndex:indexPath.row];
    cell.titleLbl.text = entity.title;
    cell.titleLbl.textColor = menuItemTitleTextColorNormal ? menuItemTitleTextColorNormal : [UIColor whiteColor];
    cell.titleLbl.textAlignment = NSTextAlignmentLeft;
    cell.titleLbl.font = [UIFont systemFontOfSize:18];
    cell.backgroundColor = menuItemBackgroundColorNormal ? menuItemBackgroundColorNormal : [UIColor clearColor];
    cell.delegate = self;
    cell.backImageView.image = menuItemBackgroundImageNormal;
    
    if(entity.iconName && ![entity.iconName isEqualToString:@""])
        cell.iconView.image = [UIImage imageNamed:entity.iconName];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)tableView:(UITableView *)tableView1 willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.disableRippleAnimation)
    {
        return;
    }
    
    cell.alpha = 1.0;
    CATransform3D scale = CATransform3DMakeTranslation(tableView1.bounds.size.width, 0, 0);
    cell.layer.transform = CATransform3DConcat(scale, CATransform3DMakeScale(0.1, 0.1, 0.1));
    
    [UIView animateWithDuration:0.18 delay:indexPath.row*0.06 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        
        cell.alpha = 1.0;
       // cell.layer.transform = CATransform3DMakeTranslation(-7, 0, 0);
        cell.layer.transform = CATransform3DConcat(CATransform3DMakeTranslation(-7, 0, 0), CATransform3DMakeScale(1.3, 1.3, 1.3));
        
    } completion:^(BOOL finished){
        
        [UIView animateWithDuration:0.13 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            cell.layer.transform = CATransform3DConcat(CATransform3DMakeTranslation(5, 0, 0), CATransform3DMakeScale(0.9, 0.9, 0.9)) ;
            
            
        } completion:^(BOOL finished){
            
            
            
            [UIView animateWithDuration:0.09 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                cell.layer.transform = CATransform3DIdentity;
                
                
            } completion:^(BOOL finished){
                
                
                
                
            }];
            
        }];
        
        
    }];
}
-(void)cellView:(MenuViewCellView *)cellView Selected:(BOOL)selected
{
    if(selected)
    {
        if(menuItemTitleTextColorHighlighted)
            cellView.titleLbl.textColor = menuItemTitleTextColorHighlighted;
        
        if(menuItemBackgroundImageHighlighted)
            cellView.backImageView.image = menuItemBackgroundImageHighlighted;
        
        if(menuItemBackgroundColorHighlighted)
            cellView.backgroundColor = menuItemBackgroundColorHighlighted;
        
    }else
    {
        if(menuItemTitleTextColorNormal)
            cellView.titleLbl.textColor = menuItemTitleTextColorNormal ;
        
        if(menuItemBackgroundImageNormal)
            cellView.backImageView.image = menuItemBackgroundImageNormal;
        
        if(menuItemBackgroundColorNormal)
            cellView.backgroundColor = menuItemBackgroundColorNormal;
        
    }
}
-(void)setMenuItemTitleTextColor:(UIColor *)txtColor forState:(UIControlState)controlState
{
    if(controlState == UIControlStateNormal)
    {
        menuItemTitleTextColorNormal = txtColor;
    }else if (controlState == UIControlStateHighlighted)
    {
        menuItemTitleTextColorHighlighted = txtColor;
    }
}
-(void)setMenuItemBackgroundColor:(UIColor*)backColor forState:(UIControlState)controlState
{
    if(controlState == UIControlStateNormal)
    {
        menuItemBackgroundColorNormal = backColor;
    }else if (controlState == UIControlStateHighlighted)
    {
        menuItemBackgroundColorHighlighted = backColor;
    }
}
-(void)setMenuItemBackgroundImage:(UIImage*)backImage forState:(UIControlState)controlState
{
    if(controlState == UIControlStateNormal)
    {
        menuItemBackgroundImageNormal = backImage;
    }else if (controlState == UIControlStateHighlighted)
    {
        menuItemBackgroundImageHighlighted = backImage;
    }
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
