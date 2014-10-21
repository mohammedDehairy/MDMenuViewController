//
//  MenuItemEntity.h
//  Kitchens
//
//  Created by Mohammed Eldehairy on 2/26/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    MenuItemMainView,
    MenuItemProducts,
    MenuItemMetrics,
    MenuItemTips,
    MenuItemRecipes,
    MenuItemAdvisory,
    MenuItemFavourit,
    MenuItemServices,
    MenuItemContactUs
}MenuItem;
@interface MenuItemEntity : NSObject
-(id)initWithTitle:(NSString*)title iconName:(NSString*)iconName type:(MenuItem)type;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *iconName;
@property(nonatomic,assign)MenuItem itemType;

@end
