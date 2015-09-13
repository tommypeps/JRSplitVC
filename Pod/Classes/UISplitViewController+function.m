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
@end
