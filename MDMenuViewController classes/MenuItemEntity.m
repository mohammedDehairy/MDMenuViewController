//
//  MenuItemEntity.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 2/26/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "MenuItemEntity.h"

@implementation MenuItemEntity
-(id)initWithTitle:(NSString*)title iconName:(NSString*)iconName type:(MenuItem)type
{
    self = [super init];
    if(self)
    {
        _title = title;
        _iconName = iconName;
        _itemType = type;
    }
    return self;
}
@end
