//
//  UIGestureRecognizer+functions.m
//  testGesture
//
//  Created by José Roldán Jiménez on 10/5/15.
//  Copyright (c) 2015 com.roldanjimenez. All rights reserved.
//

#import "UIGestureRecognizer+functions.h"

@implementation UIGestureRecognizer (functions)

-(CGFloat)fractionTouch
{
    CGPoint location = [self locationInView:self.view];
    CGFloat width = self.view.frame.size.width;
    CGFloat pCent = location.x/width ;
    return pCent;

}
@end
