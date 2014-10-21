//
//  MDStack.h
//  Kitchens
//
//  Created by Mohammed Eldehairy on 3/20/14.
//  Copyright (c) 2014 Mohammed Eldehairy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDStack : NSObject
{
    NSMutableArray *stackArray;
}
-(void)push:(UIViewController*)obj;
-(UIViewController*)pop;
-(UIViewController*)lastObject;
-(void)clear;
-(NSInteger)count;
@end
