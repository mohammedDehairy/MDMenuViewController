//
//  DefaultMenuView.h
//  MDMenuViewController Demo
//
//  Created by Mohammed Eldehairy on 5/4/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "MenuView.h"

@interface DefaultMenuView : MenuView<UITableViewDataSource,UITableViewDelegate,MenuViewCellViewDelegate>
{
    UITableView *tableView;
    NSArray *MenuItems;
    BOOL firstLoad;
}
@end
