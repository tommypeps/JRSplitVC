//
//  UISplitViewController+function.m
//  testGesture
//
//  Created by José Roldán Jiménez on 14/8/15.
//  Copyright (c) 2015 com.roldanjimenez. All rights reserved.
//

#import "UISplitViewController+function.h"

@implementation UISplitViewController (function)
-(void)insertDisplayModeButtonAnimated2:(BOOL)animated
{
    UINavigationController *nc = [self.viewControllers objectAtIndex:[@1 integerValue]];
    if (nc) {
        UIViewController *vc   = [nc topViewController];
        if (vc) {
            [vc.navigationItem setLeftItemsSupplementBackButton:YES];
            [vc.navigationItem setLeftBarButtonItem:[self displayModeButtonItem]
                                           animated:animated];
            
        }
        
    }
}
-(UIViewController*)masterView
{
    if ([self.viewControllers count]) {
        id vc = self.viewControllers[0];
        if ([vc isKindOfClass:[UINavigationController class]]) {
            return [vc topViewController];
        }else if ([vc isKindOfClass:[UIViewController class]]){
            return vc;
        }else{
            return nil;
        }
    }
    return nil;
}
-(UIViewController*)detailView
{

    if ([self.viewControllers count] == [@2 intValue]) {

        id vc = self.viewControllers[1];
        if ([vc isKindOfClass:[UINavigationController class]]) {
            return [vc topViewController];
        }else if ([vc isKindOfClass:[UIViewController class]]){
            return vc;
        }else{
            return nil;
        }
    }
    return nil;
}
@end
