//
//  MenuViewCellView.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 3/8/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "MenuViewCellView.h"

@implementation MenuViewCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _backImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_backImageView];
        
        int width = 0;
        int ofset = 0;
        if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
        {
            width = 200;
            ofset = 80;
            
        }else
        {
            width = 400;
            ofset = 100;
        }
        
        _titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(ofset, 7, width-ofset, 30)];
        _titleLbl.backgroundColor = [UIColor clearColor];
        _titleLbl.textAlignment = NSTextAlignmentCenter;
        _titleLbl.textColor = [UIColor whiteColor];
        
        
        [self addSubview:_titleLbl];
        
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(ofset-55, 5, 30, 30)];
        [self addSubview:_iconView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    [_delegate cellView:self Selected:selected];
    if([_delegate respondsToSelector:@selector(cellView:Selected:)])
    {
        [_delegate cellView:self Selected:selected];
    }
    // Configure the view for the selected state
}

@end
