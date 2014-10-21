//
//  MenuViewCellView.h
//  Kitchens
//
//  Created by Mohammed Eldehairy on 3/8/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MenuViewCellViewDelegate;
@interface MenuViewCellView : UITableViewCell
{
    
}
@property(nonatomic,weak)id<MenuViewCellViewDelegate> delegate;
@property(nonatomic,retain,readonly)UIImageView *backImageView;
@property(nonatomic,retain,readonly)UIImageView *iconView;
@property(nonatomic,retain,readonly)UILabel *titleLbl;


@end

@protocol MenuViewCellViewDelegate <NSObject>

-(void)cellView:(MenuViewCellView*)cellView Selected:(BOOL)selected;

@end
