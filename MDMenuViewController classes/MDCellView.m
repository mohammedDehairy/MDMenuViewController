//
//  MDCellView.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 4/21/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "MDCellView.h"

@implementation MDCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.frame = CGRectMake(0, self.textLabel.frame.origin.y, self.frame.size.width, self.textLabel.frame.size.height);
    self.detailTextLabel.frame = CGRectMake(0, self.detailTextLabel.frame.origin.y, self.frame.size.width, self.detailTextLabel.frame.size.height);
}
@end
