//
//  MDStack.m
//  Kitchens
//
//  Created by Mohammed Eldehairy on 3/20/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import "MDStack.h"

@implementation MDStack
-(void)push:(UIViewController *)obj
{
    if(!stackArray)
    {
        stackArray = [NSMutableArray array];
    }
    
    [stackArray addObject:obj];
}
-(UIViewController*)pop
{
    if(stackArray.count > 0)
    {
        UIViewController *obj = [stackArray lastObject];
        [stackArray removeLastObject];
        return obj;
    }else
    {
        return nil;
    }
    
}
-(UIViewController*)lastObject
{
    if(stackArray.count > 0)
    {
        
        return [stackArray lastObject];
    }else
    {
        return nil;
    }
}
-(void)clear
{
    [stackArray removeAllObjects];
}
-(NSInteger)count
{
    return stackArray.count;
}
@end
