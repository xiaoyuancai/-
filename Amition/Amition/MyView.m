//
//  MyView.m
//  Amition
//
//  Created by Yuan Le on 2018/12/26.
//  Copyright © 2018年 Yuan Le. All rights reserved.
//

#import "MyView.h"

@implementation MyView

-(id)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    NSLog(@"hit");
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self)
    {
        return nil;
    }
    else
    {
        return hitView;
    }
}

@end
